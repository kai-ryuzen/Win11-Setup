**Create ProfileFile for PowerShell**  
---
New-Item -Path $profile.CurrentUserAllHosts -Type File -Force  
---
⚠️ If you get "execution of scripts is disabled on this system" then do this 👇
Run the following command in an elevated PowerShell session (Run as Administrator):
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force   
