function Test-BlockPage($html,$minChars){
  if($html -match '(?i)Just a moment|Enable JavaScript|Are you a robot|Request unsuccessful|Access Denied|Attention Required|Verifying Device|Verification failed|Pardon Our Interruption|unusual traffic|checking your browser'){ return "bot-wall" }
  $t=([regex]::Replace($html,'(?s)<script.*?</script>','') -replace '(?s)<style.*?</style>','' -replace '<[^>]+>',' ')
  $t=[Net.WebUtility]::HtmlDecode($t)
  if((($t -replace '\s','')).Length -lt $minChars){ return "too-little-text($((($t -replace '\s','')).Length))" }
  return $null
}
