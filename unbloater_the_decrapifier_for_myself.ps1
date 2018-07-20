# Note: Some inspiration was taken from here: https://community.spiceworks.com/scripts/show/3977-windows-10-decrapifier-version-2 
# The computer needs being in a workgroup (no domain AD)
# Set Set-ExecuionPolicy unrestricted
# UnBloater the DeCrapfier
# By The Odious Olivetree
# July 4 2018 
# 
# Uninstall

# Activate Remote Desktop
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

# Disable first logon animation
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v EnableFirstLogonAnimation /t REG_DWORD /d 0

# Disable Suggested Apps, Feedback, Lockscreen Spotlight
Write-Host "***Disabling Suggested Apps, Feedback, Lockscreen Spotlight***"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\" /f /t REG_DWORD /v SystemPaneSuggestionsEnabled /d 0
reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager\SoftLandingEnabled" /f /t REG_DWORD /v SoftLandingEnabled /d 0
reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager\" /f /t REG_DWORD /v RotatingLockScreenEnable /d 0

# Disable One Drive
# Terminate any OneDrive processes
    CMD /C "C:\Windows\System32\taskkill.exe /f /im OneDrive.exe"
#   CMD /C "C:\Windows\System32\taskkill.exe /f /im explorer.exe"
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
    CMD /C "icacls C:\Windows\SysWOW64\OneDriveSetup.exe /deny "Tout le Monde":W"

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

# Disable telemetry
write-Host "***Disabling telemetry...***"
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /f /t REG_DWORD /v AllowTelemetry /d 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /f /v DontOfferThroughWUAU /t REG_DWORD /d 1
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /f /v "CEIPEnable" /t REG_DWORD /d 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /f /v "AITEnable" /t REG_DWORD /d 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /f /v "DisableUAR" /t REG_DWORD /d 1

# Set Windows 10 privacy options
write-Host "***Setting Windows 10 privacy options...***"
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /t REG_DWORD /v LetAppsAccessAccountInfo /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /t REG_DWORD /v EnableWebContentEvaluation /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /t REG_DWORD /v Enabled /d 0  /f
reg add "HKCU\Control Panel\International\User Profile" /t REG_DWORD /v HttpAcceptLanguageOptOut /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /t REG_DWORD /v AcceptedPrivacyPolicy /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitTextCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitInkCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /t REG_DWORD /v HarvestContacts /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /t REG_DWORD /v NumberOfSIUFInPeriod /d 0 /f

# Disable Cortana
write-Host "***Disabling Cortana and Bing search...***"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

# Disable delivery optimization - I don't see why we should disable this, loads Windows Updates from other peer computers.
#write-Host "***Disabling delivery optimization...***"
#reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /t REG_DWORD /v DODownloadMode /d 0 /f
#reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f
#reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /t REG_DWORD /v SystemSettingsDownloadMode /d 3 /f
#reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f

# Disable a couple of services
write-Host "***Disabling scheduled tasks...***"
#schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
# schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable 
# schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
# schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
# schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
# schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
# schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
# schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable

write-Host "***Stopping and disabling diagnostics tracking services, Onedrive sync service, various Xbox services, Distributed Link Tracking, and Windows Media Player network sharing (you can turn this back on if you share your media libraries with WMP)...***"
get-service Diagtrack,DmwApPushService,OneSyncSvc,XblAuthManager,XblGameSave,XboxNetApiSvc,TrkWks,WMPNetworkSvc | stop-service -passthru | set-service -startuptype disabled

# Remove all built-in apps for the current user, exclude calculator
# Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxPackage 

# Remove provisioning of all packages, exclude calculator
# Get-AppxProvisionedPackage -online | where-object {$_.packagename -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxProvisionedPackage -online

exit
