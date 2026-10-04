<#
  hash_manual.ps1 - Fold manually-retrieved files into the provenance ledger.

  Run this after saving documents by hand from a browser (see MANUAL_RETRIEVAL.md).
  Any file present on disk but absent from the ledger is registered with a SHA-256,
  timestamp, and inferred size. Files already in the ledger are re-verified.

  Usage
    powershell -ExecutionPolicy Bypass -File .\hash_manual.ps1
    powershell -ExecutionPolicy Bypass -File .\hash_manual.ps1 -Note "saved via browser 2026-10-03"
#>
[CmdletBinding()]
param(
  [string]$Note = '',
  [string[]]$Only = @()      # optional: limit to specific relative paths
)

$ErrorActionPreference = 'Continue'
$Root       = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$LedgerCsv  = Join-Path $Root '07_Metadata\ledger.csv'
$LedgerJson = Join-Path $Root '07_Metadata\ledger.jsonl'
$Skip       = @('07_Metadata')

$rows = @()
if (Test-Path -LiteralPath $LedgerCsv) { $rows = @(Import-Csv -LiteralPath $LedgerCsv) }
$known = @{}
foreach ($r in $rows) { $known[$r.path] = $r }

$onDisk = Get-ChildItem -LiteralPath $Root -Recurse -File |
  Where-Object {
    $rel = $_.FullName.Substring($Root.Length + 1) -replace '\\','/'
    ($rel -notmatch '^07_Metadata/') -and
    ($rel -notmatch 'MANUAL_RETRIEVAL|manifest\.json|ledger\.|failures\.log')
  }

$added = 0; $verified = 0; $fixed = 0

foreach ($f in $onDisk) {
  $rel = $f.FullName.Substring($Root.Length + 1) -replace '\\','/'
  if ($Only.Count -and ($Only -notcontains $rel)) { continue }

  $hash = (Get-FileHash -LiteralPath $f.FullName -Algorithm SHA256).Hash.ToLower()

  if ($known.ContainsKey($rel)) {
    if ($known[$rel].sha256 -eq $hash) { $verified++ }
    else {
      $known[$rel].sha256 = $hash
      $known[$rel].bytes  = $f.Length
      $known[$rel].retrieval_note = "content changed since first capture$(if ($Note) { "; $Note" })"
      $fixed++
      Write-Host ("  CHANGED  $rel") -ForegroundColor Yellow
    }
    continue
  }

  $rows += [pscustomobject]@{
    path = $rel
    title = ''
    source = 'manual retrieval'
    original_url = ''
    archive_url = ''
    published = ''
    downloaded_utc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    bytes = $f.Length
    sha256 = $hash
    local_path = $rel -replace '/','\'
    retrieval_note = if ($Note) { "manual: $Note" } else { 'manual retrieval' }
  }
  $added++
  Write-Host ("  ADDED    {0}  [{1:N1} KB]" -f $rel, ($f.Length/1KB)) -ForegroundColor Green
}

$rows | Export-Csv -LiteralPath $LedgerCsv -NoTypeInformation -Encoding UTF8
$rows | ForEach-Object {
  [pscustomobject]@{
    path=$_.path; title=$_.title; source=$_.source; original_url=$_.original_url
    archive_url=$_.archive_url; published=$_.published; downloaded_utc=$_.downloaded_utc
    bytes=$_.bytes; sha256=$_.sha256; local_path=$_.local_path; retrieval_note=$_.retrieval_note
  } | ConvertTo-Json -Compress
} | Set-Content -LiteralPath $LedgerJson -Encoding UTF8

Write-Host ("-" * 60)
Write-Host "added: $added   already-verified: $verified   changed: $fixed   total rows: $($rows.Count)" -ForegroundColor Cyan
if ($added -eq 0 -and $fixed -eq 0) { Write-Host "nothing new - nothing to do." -ForegroundColor DarkGray }
