param(
    [string]$InstallDir = (Join-Path $HOME '.claude\9router'),
    [string]$SettingsPath = (Join-Path $env:APPDATA 'Code\User\settings.json'),
    [switch]$KeepConfig,
    [switch]$SkipPath
)

$switchScript = Join-Path $InstallDir 'vscode-switch.ps1'
if (Test-Path -LiteralPath $switchScript) {
    & $switchScript off -SettingsPath $SettingsPath
    if (-not $?) {
        Write-Error 'Could not disable VSCode routing. Uninstall stopped to avoid leaving a broken configuration.'
        exit 1
    }
}

if (-not $SkipPath) {
    $current = [Environment]::GetEnvironmentVariable('Path', 'User')
    $parts = @($current -split ';' | Where-Object {
        -not [string]::IsNullOrWhiteSpace($_) -and $_ -ne $InstallDir
    })
    [Environment]::SetEnvironmentVariable('Path', ($parts -join ';'), 'User')
}

$managedFiles = @('Common.ps1', 'claude-9router.ps1', 'claude-9router.cmd', 'vscode-switch.ps1', 'uninstall.ps1')
foreach ($name in $managedFiles) {
    $path = Join-Path $InstallDir $name
    if (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Force }
}
if (-not $KeepConfig) {
    $configPath = Join-Path $InstallDir 'config.local.json'
    if (Test-Path -LiteralPath $configPath) { Remove-Item -LiteralPath $configPath -Force }
}

if ((Test-Path -LiteralPath $InstallDir) -and -not (Get-ChildItem -LiteralPath $InstallDir -Force)) {
    Remove-Item -LiteralPath $InstallDir -Force
}

Write-Host 'Claude Router uninstalled. Restart VSCode and open a new terminal.' -ForegroundColor Green
