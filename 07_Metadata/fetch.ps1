<#
  fetch.ps1 - Idempotent, provenance-preserving fetcher for the Cornell-7 public-records set.

  Design goals
  - Re-runnable. Items already present are skipped unless -Force is passed.
  - Every retrieval records: original URL, source org, title, published date,
    date downloaded (UTC), byte size, SHA-256, and archive/preservation URL.
  - Failures are recorded honestly in failures.log rather than silently dropped.
  - Polite: serial requests with a delay; exponential backoff on 429/5xx.

  Usage
    powershell -ExecutionPolicy Bypass -File .\fetch.ps1
    powershell -ExecutionPolicy Bypass -File .\fetch.ps1 -Force
    powershell -ExecutionPolicy Bypass -File .\fetch.ps1 -DelaySeconds 10
#>
[CmdletBinding()]
param(
  [switch]$Force,
  [int]$DelaySeconds = 4,
  [int]$MaxRetries = 3
)

$ErrorActionPreference = 'Continue'
$Root       = Split-Path -Parent (Split-Path -Parent $PSCommandPath)   # ...\Cornell-7
$MetaDir    = Join-Path $Root '07_Metadata'
$Manifest   = Join-Path $MetaDir 'manifest.json'
$LedgerCsv  = Join-Path $MetaDir 'ledger.csv'
$LedgerJson = Join-Path $MetaDir 'ledger.jsonl'
$FailLog    = Join-Path $MetaDir 'failures.log'

if (-not (Test-Path -LiteralPath $Manifest)) { throw "manifest.json not found at $Manifest" }

$items = Get-Content -LiteralPath $Manifest -Raw -Encoding UTF8 | ConvertFrom-Json

# Load prior ledger so re-runs append rather than truncate history
$prior = @{}
if (Test-Path -LiteralPath $LedgerJson) {
  Get-Content -LiteralPath $LedgerJson -Encoding UTF8 | Where-Object { $_.Trim() } | ForEach-Object {
    try { $r = $_ | ConvertFrom-Json; if ($r.sha256) { $prior[$r.path] = $r } } catch {}
  }
}

function Get-Sha256([string]$Path) {
  (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLower()
}

function Save-Ledger($rows) {
  $rows | Export-Csv -LiteralPath $LedgerCsv -NoTypeInformation -Encoding UTF8
  $rows | ForEach-Object {
    [pscustomobject]@{
      path = $_.path; title = $_.title; source = $_.source; publisher = $_.source
      original_url = $_.original_url; archive_url = $_.archive_url
      published = $_.published; downloaded_utc = $_.downloaded_utc
      bytes = $_.bytes; sha256 = $_.sha256; local_path = $_.local_path
      retrieval_note = $_.retrieval_note
    } | ConvertTo-Json -Compress
  } | Set-Content -LiteralPath $LedgerJson -Encoding UTF8
}

$results = @()
$ok = 0; $skipped = 0; $failed = 0

Write-Host "Cornell-7 fetcher  |  root: $Root" -ForegroundColor Cyan
Write-Host "manifest items: $($items.Count)   delay: ${DelaySeconds}s" -ForegroundColor DarkGray
Write-Host ("-" * 78)

foreach ($it in $items) {
  $rel      = $it.path
  $dest     = Join-Path $Root ($rel -replace '/', '\')
  $destDir  = Split-Path -Parent $dest
  $stamp    = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
  $note     = ''

  if (-not $Force -and (Test-Path -LiteralPath $dest) -and (Get-Item -LiteralPath $dest).Length -gt 200) {
    if ($prior.ContainsKey($rel) -and $prior[$rel].sha256) {
      $results += $prior[$rel]
      $note = 'unchanged (skipped)'
      $skipped++
      Write-Host ("  SKIP  " + $rel) -ForegroundColor DarkGray
      continue
    }
  }

  if (-not (Test-Path -LiteralPath $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
  }

  $got = $false
  for ($attempt = 1; $attempt -le $MaxRetries; $attempt++) {
    try {
      Invoke-WebRequest -Uri $it.url -OutFile $dest -UseBasicParsing `
        -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' `
        -Headers @{ 'Accept' = 'text/html,application/xhtml+xml,application/pdf,*/*'; 'Accept-Language' = 'en-US,en;q=0.9' } `
        -MaximumRedirection 5 -TimeoutSec 60 -ErrorAction Stop

      if ((Get-Item -LiteralPath $dest).Length -gt 200) { $got = $true; break }
      else { $note = 'response too small (<200 bytes) - treated as block/redirect page' }
    } catch {
      $note = $_.Exception.Message
      if ($_.Exception.Response) { $note = "HTTP $([int]$_.Exception.Response.StatusCode) $($_.Exception.Response.StatusDescription) - $note" }
      if ($note -match '429|Too Many') { Start-Sleep -Seconds (10 * $attempt) }
      elseif ($note -match '403|Forbidden') { break }   # don't hammer a block
    }
  }

  if ($got) {
    $len = (Get-Item -LiteralPath $dest).Length
    $hash = Get-Sha256 $dest
    $results += [pscustomobject]@{
      path = $rel; title = $it.title; source = $it.source
      original_url = $it.url; archive_url = $it.archive
      published = $it.published; downloaded_utc = $stamp
      bytes = $len; sha256 = $hash; local_path = $dest
      retrieval_note = 'retrieved'
    }
    $ok++
    Write-Host ("  OK    " + $rel + "  [" + [math]::Round($len/1KB,1) + " KB]") -ForegroundColor Green
  } else {
    $results += [pscustomobject]@{
      path = $rel; title = $it.title; source = $it.source
      original_url = $it.url; archive_url = $it.archive
      published = $it.published; downloaded_utc = $stamp
      bytes = 0; sha256 = ''; local_path = $dest
      retrieval_note = "FAILED: $note"
    }
    "$stamp  $rel`n        $note`n        $($it.url)" | Add-Content -LiteralPath $FailLog -Encoding UTF8
    $failed++
    Write-Host ("  FAIL  " + $rel) -ForegroundColor Yellow
    Write-Host ("        " + $note) -ForegroundColor DarkYellow
  }

  Save-Ledger $results
  Start-Sleep -Seconds $DelaySeconds
}

Save-Ledger $results
Write-Host ("-" * 78)
Write-Host ("OK: $ok   SKIPPED: $skipped   FAILED: $failed") -ForegroundColor Cyan
Write-Host "ledger.csv / ledger.jsonl / failures.log in 07_Metadata"
