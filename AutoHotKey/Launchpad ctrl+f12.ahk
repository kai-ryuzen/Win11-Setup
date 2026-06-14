#Requires AutoHotkey v2.0

~LWin Up:: {
    if (A_PriorKey == "LWin") {
        Send("^{F12}")
    }
}