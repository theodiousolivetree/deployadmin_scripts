# Note: Some inspiration was taken from here: https://gist.github.com/ThaddeusAid/55a137fb48fc01594eca4e89a025b456
# Remove ALL OneDrive
# By The Odious Olivetree
# July 4 2018 
# Disable One Drive
# Uninstall
    CMD /C "c:\Windows\SysWOW64\OneDriveSetup.exe /uninstall"
# take ownership of the re-installer
    CMD /C "takeown.exe /F C:\windows\SysWOW64\OneDriveSetup.exe /A"
    CMD /C "icacls C:\windows\syswow64\OneDriveSetup.exe /grant Administrateurs:F"
# Remove
    Remove-Item C:\Windows\SysWOW64\OneDriveSetup.exe -Force
# Create (a fake .exe, 0 bytes in size)
    New-Item C:\Windows\SysWOW64\OneDriveSetup.exe -Force
# Deny system write
    CMD /C "icacls C:\Windows\SysWOW64\OneDriveSetup.exe /deny Everyone:W"


write-Host "***Disabling OneDrive...***"
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /f /t REG_DWORD /v DisableFileSyncNGSC /d 1
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /f /t REG_DWORD /v DisableFileSync /d 1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /f /t REG_BINARY /v OneDrive /d 0300000021B9DEB396D7D001
# Remove 'Onedrive folder' from left side of file explorer
reg Add "HKLM\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /T REG_DWORD /V "System.IsPinnedToNameSpaceTree" /D 0 /F

# Clean up random onedrive stuff
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"
Remove-Item -Force -ErrorAction SilentlyContinue "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
