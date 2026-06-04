$#e::
WinGet, fpID, ID, ahk_exe FPilot.exe
if(fpID){
    WinGet, currID, ID, A
    if(currID = fpID)
        WinMinimize ahk_id %fpID%
    else
        WinActivate ahk_id %fpID%
} else {
    Run "C:\Users\Kai\AppData\Local\Voidstar\FilePilot\FPilot.exe"
}
return
