$release = Invoke-RestMethod -Uri 'https://api.github.com/repos/baldurk/renderdoc/releases/latest' -UseBasicParsing
$asset = $release.assets | Where-Object { $_.name -match 'RenderDoc_.*_64\.msi$' } | Select-Object -First 1
if (-not $asset) { Write-Error 'RenderDoc MSI asset not found in latest release'; exit 1 }

Write-Host "Downloading $($asset.name)..."
Invoke-WebRequest -Uri $asset.browser_download_url -OutFile renderdoc.msi -UseBasicParsing

Start-Process -FilePath msiexec.exe -Wait -ArgumentList '/i', (Resolve-Path renderdoc.msi), '/qn', '/norestart'

$exe = 'C:\Program Files\RenderDoc\qrenderdoc.exe'
if (-Not (Test-Path $exe)) {
  Write-Error "qrenderdoc.exe not found at expected path ($exe)"
  exit 1
}

& $exe --version
