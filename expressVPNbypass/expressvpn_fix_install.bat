@echo off
title ExpressVPN Install Fix Script
echo ====================================================
echo   ExpressVPN Installation Cleanup & Silent Install
echo ====================================================
echo.

:: Stop ExpressVPN services
echo Stopping ExpressVPN services...
net stop expressvpnservice >nul 2>&1
taskkill /f /im expressvpn.exe >nul 2>&1
taskkill /f /im expressvpndaemon.exe >nul 2>&1

:: Wait for 2 seconds
timeout /t 2 >nul

:: Delete any lingering AppData folders
echo Cleaning AppData...
rmdir /s /q "%appdata%\ExpressVPN"
rmdir /s /q "%localappdata%\ExpressVPN"

:: Run installer silently
echo Starting Installer...
set installer=expressvpn_windows_12.101.0.45_release.exe
if exist "%~dp0%installer%" (
    "%~dp0%installer%" /quiet
    echo Installation started. Please wait...
) else (
    echo ERROR: Installer file not found in this folder!
)

pause
