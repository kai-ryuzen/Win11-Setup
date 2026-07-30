@echo off

echo Closing apps...
taskkill /IM spotify.exe /T /F >nul 2>&1
taskkill /IM zen.exe /T /F >nul 2>&1
taskkill /IM ABDownloadManager.exe /T /F >nul 2>&1