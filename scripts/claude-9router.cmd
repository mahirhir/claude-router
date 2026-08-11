@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0claude-9router.ps1" %*
exit /b %ERRORLEVEL%
