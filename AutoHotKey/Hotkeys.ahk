#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon
#Warn All

!q::Run('nircmd win close foreground')
!t::Run('wt.exe')
!z::Run('nircmd exec hide "C:\Program Files\Nilesoft Shell\imports\FreeRam.bat"')
!f::Run('nircmd win max foreground')
!w::Run('ms-settings:network-wifi')
!b::Run('ms-settings:devices')

~LWin Up:: {
    if (A_PriorKey == "LWin") {
        Sleep(20)
        Send("^{F12}")
    }
}

^!r::Reload()
