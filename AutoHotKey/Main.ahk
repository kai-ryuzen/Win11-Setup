#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon
#Warn All

; ==============================================================================
; GLOBAL CONFIGURATION / HEADERS
; ==============================================================================
; Keeps AHK continuously monitoring Stage Manager's hidden layers (from explorer_script)
DetectHiddenWindows(True)

; ==============================================================================
; 1. WINDOW MANAGEMENT HOTKEYS (from Hotkeys.ahk)
; ==============================================================================

!q:: Send "{Blind}{F4}"
!f:: Run('nircmd win max foreground')

; ==============================================================================
; 2. APPLICATIONS (from Hotkeys.ahk)
; ==============================================================================

!t:: Run('wt.exe')
!r:: Run("shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}")
!d:: Run('"C:\Program Files (x86)\Steam\steamapps\common\MyDockFinder\Dock_64.exe"')
!c:: Run('C:\Scripts\connectWarp.bat')
^!c:: Run('C:\Scripts\KillWarp.bat')


; ==============================================================================
; 3. STAGE MANAGER COMPATIBLE FILE EXPLORER RESETTER (from explorer_script.ahk)
; ==============================================================================

!e:: {
    ; 1. Keep closing File Explorer windows until none are left in the background
    while HWND := WinExist("ahk_class CabinetWClass") {
        WinClose(HWND)
        Sleep(50) ; Tiny 50ms pause to let the window close cleanly
    }

    ; 2. Wait up to 1 second to ensure the OS registers that they are completely gone
    WinWaitClose("ahk_class CabinetWClass", , 1)

    ; 3. Launch a single, fresh File Explorer instance
    Run("explorer.exe")
}

; ==============================================================================
; 4. WINDOWS FEATURES & SETTINGS (from Hotkeys.ahk)
; ==============================================================================

!v:: Send("#v") ; Clipboard
!w:: Run('ms-settings:network-wifi')
!b:: Run('ms-settings:devices')

; ==============================================================================
; 5. UTILITIES & ACTIONS (from Hotkeys.ahk)
; ==============================================================================

!z:: Run('C:\Scripts\FreeRam.bat', , "Hide")
; !c:: Run('powershell.exe -ExecutionPolicy Bypass -File "C:\Scripts\WarpToggle.ps1"', , "Hide")

^!d:: Run('C:\Scripts\Kill_Dock.bat', , "Hide")

!m:: {
    RunWait(
        'powershell -Command "Get-Process | Where-Object {$_.MainWindowTitle -ne \"\"} | ForEach-Object { $_.CloseMainWindow() }"'
    )
}

; ==============================================================================
; 6. SYSTEM ACCESSIBILITY & UTILITIES (from remaining files)
; ==============================================================================

; --- NO PERMANENT DELETE (from no_permanent_delete.ahk) ---
+Delete:: {
    SendInput "{Blind}{Shift Up}{Delete}"
}

; --- COPY PROCESS NAME TO CLIPBOARD (from copy_process_name.ahk) ---
^!p::
{
    try {
        ; Get the process name of the active window ("A")
        exeName := WinGetProcessName("A")

        ; Copy to clipboard
        A_Clipboard := exeName

        ; Show a tooltip confirmation
        ToolTip(exeName . " copied!")
        SetTimer(() => ToolTip(), -1500) ; Hide tooltip after 1.5 seconds
    }
    catch TargetError {
        ToolTip("No active window found.")
        SetTimer(() => ToolTip(), -1500)
    }
}

; ==============================================================================
; 7. DOCK/LAUNCHPAD TRiggers & INTERNALS (from Hotkeys.ahk)
; ==============================================================================

*LWin::
{
    SendInput("^{F12}")
    return
}
; --- GLOBAL SCRIPT RELOAD ---
^!r:: Reload()
