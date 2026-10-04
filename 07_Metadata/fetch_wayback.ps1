<#
  fetch_wayback.ps1 - Second-pass retrieval for sources that block scripted clients.

  Strategy per URL:
    1. Query the Wayback availability API (a lighter endpoint than /web/) for the
       closest snapshot to the item's publication date.
    2. Fetch that snapshot from web.archive.org, serialised with a long delay --
       Wayback returns 429 quickly if you parallelise or poll aggressively.
    3. On 429, back off exponentially rather than retrying immediately.

  Results merge into the same ledger so provenance stays in one place.
#>
[CmdletBinding()]
param(
  [int]$DelaySeconds = 25,
  [int]$MaxRetries = 4
)

$ErrorActionPreference = 'Continue'
$Root      = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$MetaDir   = Join-Path $Root '07_Metadata'
$LedgerCsv = Join-Path $MetaDir 'ledger.csv'
$LedgerJson= Join-Path $MetaDir 'ledger.jsonl'
$FailLog   = Join-Path $MetaDir 'failures.log'

$rows = @()
if (Test-Path -LiteralPath $LedgerCsv) { $rows = @(Import-Csv -LiteralPath $LedgerCsv) }

# Items that failed with a block (403) or Wayback 429, excluding the intentional probe row
$targets = $rows | Where-Object {
  $_.retrieval_note -match 'FAILED' -and $_.path -notmatch 'LIVE-403-blocked'
} | ForEach-Object {
  [pscustomobject]@{
    row  = $_
    slug = ($_.original_url -replace '[^A-Za-z0-9]', '_')
  }
}

Write-Host "Wayback second pass - $($targets.Count) blocked items, ${DelaySeconds}s serial delay" -ForegroundColor Cyan
Write-Host ("-" * 78)

foreach ($t in $targets) {
  $row = $t.row
  $url = $row.original_url
  Write-Host ("  " + $row.path) -ForegroundColor White

  # Step 1 - ask the availability API which snapshot exists
  $snapTs = $null
  try {
    $api = 'http://archive.org/wayback/available?url=' + [uri]::EscapeDataString($url)
    $j = Invoke-RestMethod -Uri $api -UseBasicParsing -TimeoutSec 45 -ErrorAction Stop
    if ($j.archived_snapshots -and $j.archived_snapshots.closest) {
      $snapTs = $j.archived_snapshots.closest.timestamp
      Write-Host ("        snapshot: " + $snapTs) -ForegroundColor DarkGray
    } else {
      Write-Host "        no snapshot found in Wayback" -ForegroundColor DarkYellow
    }
  } catch {
    Write-Host ("        availability API failed: " + $_.Exception.Message) -ForegroundColor DarkYellow
  }

  $got = $false; $note = 'no snapshot available'
  $cands = @()
  if ($snapTs) { $cands += "https://web.archive.org/web/${snapTs}id_/$url" }
  $cands  += "https://web.archive.org/web/2026id_/$url"

  foreach ($cu in $cands) {
    for ($a = 1; $a -le $MaxRetries; $a++) {
      $tmp = Join-Path $MetaDir ("_wb_" + $t.slug + ".tmp")
      try {
        Invoke-WebRequest -Uri $cu -OutFile $tmp -UseBasicParsing `
          -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' `
          -TimeoutSec 90 -ErrorAction Stop
        if ((Test-Path -LiteralPath $tmp) -and (Get-Item -LiteralPath $tmp).Length -gt 500) {
          $dest = $row.local_path
          $destDir = Split-Path -Parent $dest
          if (-not (Test-Path -LiteralPath $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
          Move-Item -LiteralPath $tmp -Destination $dest -Force

          $hash = (Get-FileHash -LiteralPath $dest -Algorithm SHA256).Hash.ToLower()
          $row.bytes   = (Get-Item -LiteralPath $dest).Length
          $row.sha256  = $hash
          $row.retrieval_note = "retrieved via Internet Archive snapshot $snapTs"
          if (-not $row.archive_url) { $row.archive_url = $cu }
          $got = $true
          Write-Host ("        OK  [" + [math]::Round($row.bytes/1KB,1) + " KB]  $cu") -ForegroundColor Green
          break
        } else {
          $note = 'snapshot returned empty/redirect stub'
        }
      } catch {
        $note = $_.Exception.Message
        if ($_.Exception.Response) { $note = "HTTP $([int]$_.Exception.Response.StatusCode)" }
        if ($note -match '429') { Start-Sleep -Seconds (20 * $a) }
        elseif ($note -match '404') { break }
      }
    }
    if ($got) { break }
  }

  if (-not $got) {
    $row.retrieval_note = "FAILED (via Wayback): $note"
    "$((Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ'))  $($row.path)`n        $note`n        origin: $url`n        (manual retrieval recommended)" |
      Add-Content -LiteralPath $FailLog -Encoding UTF8
    Write-Host ("        STILL BLOCKED: " + $note + "  -> manual retrieval needed") -ForegroundColor Yellow
  }

  Get-ChildItem -LiteralPath $MetaDir -Filter '_wb_*.tmp' -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
  $rows | Export-Csv -LiteralPath $LedgerCsv -NoTypeInformation -Encoding UTF8
  Start-Sleep -Seconds $DelaySeconds
}

Write-Host ("-" * 78)
$resolved = ($rows | Where-Object { $_.retrieval_note -notmatch 'FAILED' }).Count
$still    = ($rows | Where-Object { $_.retrieval_note -match 'FAILED' }).Count
Write-Host "ledger now: $resolved resolved / $still outstanding" -ForegroundColor Cyan
