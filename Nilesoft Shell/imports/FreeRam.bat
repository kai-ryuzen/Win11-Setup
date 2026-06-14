@echo off
setlocal enabledelayedexpansion

:: 1. Optional: Close apps to free extra RAM
echo Closing apps...
taskkill /IM spotify.exe /T /F >nul 2>&1
taskkill /IM Doubao.exe /T /F >nul 2>&1
taskkill /IM zen.exe /T /F >nul 2>&1
taskkill /IM Blip.exe /T /F >nul 2>&1

:: 2. Run Mem Reduct's full cleanup (silent mode)
echo Running Mem Reduct cleanup...
:: Use Mem Reduct's command-line: /clean performs the default selected tasks
start "" "C:\Program Files\Mem Reduct\MemReduct.exe" /clean /tray /minimized

:: 3. Optional: Force garbage collection via PowerShell (lightweight)
echo Clearing standby memory...
powershell -Command "Get-Process | Where-Object {$_.WorkingSet -gt 200MB} | ForEach-Object { $_.Minimize() }" >nul 2>&1

echo RAM cleanup complete!
:: Optional pause for debugging; remove the line below if you don't want a "Press any key" prompt
::pause >nul
