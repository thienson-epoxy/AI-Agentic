@echo off
chcp 65001 >nul
echo ==========================================================
echo   DUNG DICH VU DONG BO TU DONG - THIEN SON EPOXY
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$procs = Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*sync-worker.ps1*' }; if ($procs) { $procs | ForEach-Object { Stop-Process -Id $_.ProcessId -Force; Write-Host ('[OK] Da dung tien trinh PID: ' + $_.ProcessId) -ForegroundColor Green } } else { Write-Host '[THONG BAO] Khong tim thay tien trinh sync nao dang chay.' -ForegroundColor Yellow }"
echo ==========================================================
echo Hoan tat.
pause
