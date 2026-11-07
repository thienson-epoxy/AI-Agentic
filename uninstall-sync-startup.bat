@echo off
chcp 65001 >nul
echo ==========================================================
echo   HUY DONG BO TU DONG KHOI DONG CUNG WINDOWS
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$startup = [System.Environment]::GetFolderPath('Startup'); $sLink = Join-Path $startup 'ThienSon-AutoSync.lnk'; if (Test-Path $sLink) { Remove-Item -Path $sLink -Force; Write-Host '[OK] Da go bo khoi dong cung Windows thanh cong!' -ForegroundColor Green } else { Write-Host '[THONG BAO] Khong ton tai shortcut trong Startup.' -ForegroundColor Yellow }"
echo ==========================================================
pause
