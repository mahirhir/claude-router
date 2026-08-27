$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$temp = Join-Path ([IO.Path]::GetTempPath()) ("claude-router-tests-" + [guid]::NewGuid())
New-Item -ItemType Directory -Path $temp | Out-Null

try {
    $config = Join-Path $temp 'config.local.json'
    @{
        baseUrl = 'http://127.0.0.1:20128'
        authToken = 'test-token-not-a-secret'
        mainModel = 'test/main-model'
        smallFastModel = 'test/small-model'
    } | ConvertTo-Json | Set-Content -LiteralPath $config -Encoding UTF8

    $settings = Join-Path $temp 'settings.json'
    @{
        'editor.fontSize' = 14
        'claudeCode.environmentVariables' = @(
            @{ name = 'KEEP_ME'; value = 'unchanged' },
            @{ name = 'ANTHROPIC_BASE_URL'; value = 'http://old.example' }
        )
    } | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $settings -Encoding UTF8

    & (Join-Path $root 'scripts\claude-9router.ps1') -ConfigPath $config -DryRun
    if ($LASTEXITCODE -ne 0) { throw 'Launcher dry run failed.' }

    & (Join-Path $root 'scripts\vscode-switch.ps1') on -ConfigPath $config -SettingsPath $settings
    if ($LASTEXITCODE -ne 0) { throw 'VSCode switch on failed.' }
    $on = Get-Content -LiteralPath $settings -Raw | ConvertFrom-Json
    if ($on.'editor.fontSize' -ne 14) { throw 'Unrelated VSCode setting changed.' }
    $keep = @($on.'claudeCode.environmentVariables' | Where-Object { $_.name -eq 'KEEP_ME' })
    if ($keep.Count -ne 1 -or $keep[0].value -ne 'unchanged') { throw 'Unrelated environment entry changed.' }
    $base = @($on.'claudeCode.environmentVariables' | Where-Object { $_.name -eq 'ANTHROPIC_BASE_URL' })
    if ($base.Count -ne 1 -or $base[0].value -ne 'http://127.0.0.1:20128') { throw 'Managed entry was not replaced.' }
    if (-not (Test-Path -LiteralPath "$settings.bak-claude-router")) { throw 'Backup was not created.' }

    & (Join-Path $root 'scripts\vscode-switch.ps1') status -SettingsPath $settings
    & (Join-Path $root 'scripts\vscode-switch.ps1') off -SettingsPath $settings
    if ($LASTEXITCODE -ne 0) { throw 'VSCode switch off failed.' }
    $off = Get-Content -LiteralPath $settings -Raw | ConvertFrom-Json
    $names = @($off.'claudeCode.environmentVariables' | ForEach-Object { $_.name })
    if ($names -contains 'ANTHROPIC_BASE_URL' -or $names -notcontains 'KEEP_ME') { throw 'Switch off removed or retained wrong entries.' }

    . (Join-Path $root 'scripts\Common.ps1')
    $customConfig = Join-Path $temp 'custom.router.config.json'
    @{
        baseUrl = 'http://127.0.0.1:20129'
        authToken = 'test-token-custom'
        mainModel = 'test/custom-main'
        smallFastModel = 'test/custom-small'
    } | ConvertTo-Json | Set-Content -LiteralPath $customConfig -Encoding UTF8

    $savedRouterConfigEnv = $env:CLAUDE_ROUTER_CONFIG
    try {
        $env:CLAUDE_ROUTER_CONFIG = $customConfig
        $loaded = Get-RouterConfig
        if ($loaded.BaseUrl -ne 'http://127.0.0.1:20129') { throw 'Custom CLAUDE_ROUTER_CONFIG BaseUrl mismatch.' }
        if ($loaded.AuthToken -ne 'test-token-custom') { throw 'Custom CLAUDE_ROUTER_CONFIG AuthToken mismatch.' }
        if ($loaded.MainModel -ne 'test/custom-main') { throw 'Custom CLAUDE_ROUTER_CONFIG MainModel mismatch.' }
        if ($loaded.SmallFastModel -ne 'test/custom-small') { throw 'Custom CLAUDE_ROUTER_CONFIG SmallFastModel mismatch.' }

        $env:CLAUDE_ROUTER_CONFIG = Join-Path $temp 'non-existent-config.json'
        $failedAsExpected = $false
        try {
            Get-RouterConfig | Out-Null
        } catch {
            $failedAsExpected = $true
        }
        if (-not $failedAsExpected) { throw 'Non-existent CLAUDE_ROUTER_CONFIG did not throw.' }
    } finally {
        $env:CLAUDE_ROUTER_CONFIG = $savedRouterConfigEnv
    }

    Write-Host 'All tests passed.' -ForegroundColor Green
} finally {
    Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
}
