@echo off
chcp 65001 >nul
echo ==========================================================
echo   CAI DAT DONG BO TU DONG KHOI DONG CUNG WINDOWS
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$startup = [System.Environment]::GetFolderPath('Startup'); $sLink = Join-Path $startup 'ThienSon-AutoSync.lnk'; $vbs = '%~dp0start-sync-silent.vbs'; $wsh = New-Object -ComObject WScript.Shell; $sc = $wsh.CreateShortcut($sLink); $sc.TargetPath = $vbs; $sc.WorkingDirectory = '%~dp0'; $sc.Description = 'Tu dong dong bo Thien Son Epoxy AI Agentic'; $sc.Save(); Write-Host '[OK] Da cai dat thanh cong! Ung dung se tu dong chay ngam moi khi mo may.' -ForegroundColor Green"
echo.
echo Boss co muon bat tien trinh dong bo ngay bay gio luon khong? (Y/N)
set /p opt="Lua chon: "
if /i "%opt%"=="Y" (
    wscript "%~dp0start-sync-silent.vbs"
    echo [OK] Tien trinh dong bo ngam da duoc khoi chay!
)
echo ==========================================================
pause
