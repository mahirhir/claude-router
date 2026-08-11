param(
    [string]$InstallDir = (Join-Path $HOME '.claude\9router'),
    [switch]$SkipPath
)

$repoRoot = Split-Path $PSScriptRoot -Parent
if (-not (Test-Path -LiteralPath (Join-Path $repoRoot 'config.example.json'))) {
    Write-Error 'Run install.ps1 from the cloned repository.'
    exit 1
}

New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
foreach ($name in @('Common.ps1', 'claude-9router.ps1', 'claude-9router.cmd', 'vscode-switch.ps1', 'uninstall.ps1')) {
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot $name) -Destination (Join-Path $InstallDir $name) -Force
}

$configPath = Join-Path $InstallDir 'config.local.json'
if (-not (Test-Path -LiteralPath $configPath)) {
    Copy-Item -LiteralPath (Join-Path $repoRoot 'config.example.json') -Destination $configPath
    Write-Host "Created $configPath" -ForegroundColor Yellow
    Write-Host 'Edit it and add your endpoint, API key, and model IDs before use.' -ForegroundColor Yellow
} else {
    Write-Host "Preserved existing $configPath" -ForegroundColor Green
}

if (-not $SkipPath) {
    $current = [Environment]::GetEnvironmentVariable('Path', 'User')
    $parts = @($current -split ';' | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    if ($parts -notcontains $InstallDir) {
        [Environment]::SetEnvironmentVariable('Path', (($parts + $InstallDir) -join ';'), 'User')
        Write-Host "Added $InstallDir to user PATH." -ForegroundColor Green
    } else {
        Write-Host 'User PATH already contains the install directory.' -ForegroundColor Green
    }
}

Write-Host 'Installation complete. Open a new terminal after editing config.local.json.' -ForegroundColor Cyan
