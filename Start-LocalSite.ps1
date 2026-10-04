<#
.SYNOPSIS
  本機開站（Windows）：IIS Express → Python → HttpListener 備援。
.PARAMETER Port
  埠號，預設 8098。
.EXAMPLE
  .\Start-LocalSite.ps1 -Port 8098
#>
[CmdletBinding()]
param(
  [int]$Port = 8098
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Web = Join-Path $Root "iis"

if (-not (Test-Path $Web)) {
  Write-Error "找不到 $Web"
}

Write-Host "系統殼範本 · 本機站台"
Write-Host "根目錄：$Web"
Write-Host "URL：http://localhost:$Port/"
Write-Host "頁面：/  /ui-brief.html  /table-sys.html  /doc.html  /exec.html  /form.html"
Write-Host ""

function Start-WithIisExpress {
  $candidates = @(
    "${env:ProgramFiles}\IIS Express\iisexpress.exe",
    "${env:ProgramFiles(x86)}\IIS Express\iisexpress.exe"
  ) | Where-Object { Test-Path $_ }

  if (-not $candidates) { return $false }
  $exe = $candidates[0]
  Write-Host "使用 IIS Express：$exe"
  & $exe /path:"$Web" /port:$Port
  return $true
}

function Start-WithPython {
  $py = Get-Command python -ErrorAction SilentlyContinue
  if (-not $py) { $py = Get-Command py -ErrorAction SilentlyContinue }
  if (-not $py) { return $false }
  Write-Host "使用 Python：$($py.Source)"
  Push-Location $Web
  try {
    & $py.Source -m http.server $Port --bind 127.0.0.1
  } finally {
    Pop-Location
  }
  return $true
}

function Start-WithHttpListener {
  Write-Host "使用 .NET HttpListener 備援"
  $prefix = "http://localhost:$Port/"
  $listener = [System.Net.HttpListener]::new()
  $listener.Prefixes.Add($prefix)
  $listener.Start()
  Write-Host "Listening $prefix （Ctrl+C 結束）"
  try {
    while ($listener.IsListening) {
      $ctx = $listener.GetContext()
      $req = $ctx.Request
      $res = $ctx.Response
      $path = [Uri]::UnescapeDataString($req.Url.AbsolutePath.TrimStart("/"))
      if ([string]::IsNullOrWhiteSpace($path)) { $path = "index.html" }
      $full = Join-Path $Web ($path -replace "/", [IO.Path]::DirectorySeparatorChar)
      if (-not (Test-Path $full) -or (Get-Item $full).PSIsContainer) {
        $res.StatusCode = 404
        $buf = [Text.Encoding]::UTF8.GetBytes("404")
      } else {
        $bytes = [IO.File]::ReadAllBytes($full)
        $ext = [IO.Path]::GetExtension($full).ToLowerInvariant()
        $res.ContentType = switch ($ext) {
          ".html" { "text/html; charset=utf-8" }
          ".css"  { "text/css; charset=utf-8" }
          ".js"   { "application/javascript; charset=utf-8" }
          ".json" { "application/json; charset=utf-8" }
          ".svg"  { "image/svg+xml" }
          ".png"  { "image/png" }
          default { "application/octet-stream" }
        }
        $buf = $bytes
        $res.StatusCode = 200
      }
      $res.OutputStream.Write($buf, 0, $buf.Length)
      $res.Close()
    }
  } finally {
    $listener.Stop()
  }
  return $true
}

if (Start-WithIisExpress) { exit 0 }
if (Start-WithPython) { exit 0 }
Start-WithHttpListener | Out-Null
