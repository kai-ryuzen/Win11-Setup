item(
    title="Connect Cloudflare WARP"
    admin=true
    image=\uE09C
    where=!path.exists("C:\\Scripts\\State\\Warp.connected")
    cmd="powershell.exe"
    args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Scripts\WarpToggle.ps1"'
)

item(
    title="Disconnect Cloudflare WARP"
    admin=true
    image=\uE09C
    where=path.exists("C:\\Scripts\\State\\Warp.connected")
    cmd="powershell.exe"
    args='-ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Scripts\WarpToggle.ps1"'
)