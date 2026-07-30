#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon
#Warn All

; ----------------------------
; Window Management
; ----------------------------

!q::Send "{Blind}{F4}"
!f::Run('nircmd win max foreground')

; ----------------------------
; Applications
; ----------------------------

!t::Run('wt.exe')
!e::Run('explorer.exe')
!r::Run("shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}")
!d::Run("C:\Program Files (x86)\Steam\steamapps\common\MyDockFinder\Mydock.exe")

; ----------------------------
; Windows Features
; ----------------------------

!v::Send("#v") ; Clipboard

; ----------------------------
; Windows Settings
; ----------------------------

!w::Run('ms-settings:network-wifi')
!b::Run('ms-settings:devices')

; ----------------------------
; Utilities
; ----------------------------

!z::Run('C:\Scripts\FreeRam.bat', , "Hide")
!c::Run('powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Scripts\WarpToggle.ps1"')
^!d::Run('C:\Scripts\Kill_Dock.bat', , "Hide")

!m:: {
    RunWait('powershell -Command "Get-Process | Where-Object {$_.MainWindowTitle -ne \"\"} | ForEach-Object { $_.CloseMainWindow() }"')
}

; ----------------------------
; Launchpad
; ----------------------------

*LWin::
{
    SendInput("^{F12}")
    return
}

; ----------------------------
; Script
; ----------------------------

^!r::Reload()
