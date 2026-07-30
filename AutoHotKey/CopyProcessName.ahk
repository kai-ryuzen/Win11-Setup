#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon
#Warn All

; Hotkey: Ctrl + Alt + P (Change to your preference)
^!p::
{
    try {
        ; Get the process name of the active window ("A")
        exeName := WinGetProcessName("A")
        
        ; Copy to clipboard
        A_Clipboard := exeName
        
        ; Optional: Show a tooltip confirmation
        ToolTip(exeName . " copied!")
        SetTimer(() => ToolTip(), -1500) ; Hide tooltip after 1.5 seconds
    }
    catch TargetError {
        ToolTip("No active window found.")
        SetTimer(() => ToolTip(), -1500)
    }
}