@echo off
chcp 65001 >nul
title Dong Bo Ngay - Thien Son Epoxy AI Agentic
echo ==========================================================
echo   DONG BO NGAY (2 CHIEU) VOI GITHUB - THIEN SON EPOXY
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync-worker.ps1" -Once
echo.
echo ==========================================================
echo Hoan tat dong bo. Nhan phim bat ky de dong cua so...
pause >nul
