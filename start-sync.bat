@echo off
chcp 65001 >nul
title Dong Bo Tu Dong - Thien Son Epoxy AI Agentic
echo ==========================================================
echo   DICH VU DONG BO TU DONG - THIEN SON EPOXY AI AGENTIC
echo   Dang chay kiem tra dong bo moi 5 phut...
echo   (Dong cua so nay hoac chay stop-sync.bat de dung)
echo ==========================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync-worker.ps1"
