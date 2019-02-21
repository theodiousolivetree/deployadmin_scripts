# =======================================================
# NAME: removeappsforall-v1.ps1
# AUTHOR: Pavilla Olivier, Deployadmin.com
# Aka The Odious Olivetree
# DATE: 19/02/2019
#
# KEYWORDS: remove, Apps , default
# VERSION 1.0
# DD/MM/YYYY added help to the functions
# COMMENTS: Removing default apps for all users especially default user
# Set Set-ExecutionPolicy unrestricted
#Requires -Version 2.0
# =======================================================
# Define Variables #
# $ErrorAction = 'silentlycontinue'
$ErrorActionPreference = 'silentlycontinue'
$datetoday = 0
# Before everything making point recovery
Enable-ComputerRestore -Drive "C:"
# Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore -Name RPSessionInterval -Value 0 
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name 'RPSessionInterval' -Value '0'
$datetoday = Get-Date -UFormat "%Y-%m-%d"
Checkpoint-Computer -Description $datetoday -RestorePointType MODIFY_SETTINGS
# first run as test:
# Set-variable -name skypebloat$ -Value (get-appxpackage *skype* | select packagefullname)
# remove-appxprovisionedpackage -online -packagename skypebloat$
# Remove-AppxPackage -allusers -Package "testzune"
# end of first run as test
Set-ExecutionPolicy Unrestricted -Force Get-ExecutionPolicy
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Unrestricted -Force
# Set-ExecutionPolicy -Scope MachinePolicy -ExecutionPolicy Unrestricted -Force 

# To uninstall 3D Builder:
get-appxpackage -allusers *3dbuilder* | remove-appxpackage

# To uninstall Alarms & Clock:
get-appxpackage -allusers *alarms* | remove-appxpackage

# To uninstall App Connector:
get-appxpackage -allusers *appconnector* | remove-appxpackage

# To uninstall App Installer:
# get-appxpackage *appinstaller* | remove-appxpackage

# To uninstall Calendar and Mail apps together:
get-appxpackage -allusers *communicationsapps* | remove-appxpackage 

# To uninstall Calculator:
get-appxpackage -allusers *calculator* | remove-appxpackage 

# To uninstall Camera:
get-appxpackage -allusers *camera* | remove-appxpackage 

# To uninstall Feedback Hub:
get-appxpackage -allusers *feedback* | remove-appxpackage 

# To uninstall Get Office:
get-appxpackage -allusers *officehub* | remove-appxpackage

# To uninstall Get Started or Tips:
get-appxpackage -allusers *getstarted* | remove-appxpackage

# To uninstall Get Skype:
get-appxpackage -allusers *skypeapp* | remove-appxpackage

# To uninstall Groove Music:
get-appxpackage -allusers *zunemusic* | remove-appxpackage

# To uninstall Groove Music and Movies & TV apps together:
get-appxpackage -allusers *zune* | remove-appxpackage

# To uninstall Maps:
get-appxpackage -allusers *maps* | remove-appxpackage

# To uninstall Messaging and Skype Video apps together:
get-appxpackage -allusers *messaging* | remove-appxpackage

# To uninstall Microsoft Solitaire Collection:
get-appxpackage -allusers *solitaire* | remove-appxpackage

# To uninstall Microsoft Wallet:
get-appxpackage -allusers *wallet* | remove-appxpackage

# To uninstall Microsoft Wi-Fi:
get-appxpackage -allusers *connectivitystore* | remove-appxpackage

# To uninstall Zune Music, Movies & TV:
get-appxpackage -allusers *zunevideo* | remove-appxpackage 
get-appxpackage -allusers *zunemusic* | remove-appxpackage 

# To uninstall OneNote:
get-appxpackage -allusers *onenote* | remove-appxpackage 

# To uninstall Paid Wi-Fi & Cellular:
get-appxpackage -allusers *oneconnect* | remove-appxpackage 

# To uninstall Paint 3D:
get-appxpackage -allusers *mspaint* | remove-appxpackage 

# To uninstall People:
get-appxpackage -allusers *people* | remove-appxpackage 

# To uninstall Phone, Phone Companion :
get-appxpackage -allusers *commsphone* | remove-appxpackage 
get-appxpackage -allusers *windowsphone* | remove-appxpackage
# To uninstall Phone and Phone Companion apps together:
# get-appxpackage -allusers *phone* | remove-appxpackage

# To uninstall Photos:
get-appxpackage -allusers *photos* | remove-appxpackage

# To uninstall Sticky Notes:
get-appxpackage -allusers *sticky* | remove-appxpackage

# To uninstall Sway:
get-appxpackage -allusers *sway* | remove-appxpackage

# To uninstall View 3D:
get-appxpackage -allusers *Microsoft3dviewer* | remove-appxpackage
get-appxpackage -allusers *3d* | remove-appxpackage

# To uninstall Voice Recorder:
get-appxpackage -allusers *soundrecorder* | remove-appxpackage

# To uninstall Bing Weather, Sports, Money & News :
get-appxpackage -allusers *bingweather* | remove-appxpackage 
get-appxpackage -allusers *bingsports* | remove-appxpackage 
get-appxpackage -allusers *bingnews* | remove-appxpackage 
get-appxpackage -allusers *bingfinance* | remove-appxpackage 
# To uninstall all bing apps together at least :
get-appxpackage -allusers *bing* | remove-appxpackage 

# To uninstall Windows Holographic:
get-appxpackage -allusers *holographic* | remove-appxpackage

# To uninstall Windows Store: (Be very careful!)
get-appxpackage -allusers *windowsstore* | remove-appxpackage

# To uninstall apps added after W10 1511 
Get-AppxPackage *phototastic* | Remove-AppxPackage
Get-AppxPackage *picsart* | Remove-AppxPackage 
Get-AppxPackage *plex* | Remove-AppxPackage 
Get-AppxPackage *fitbitcoach* | Remove-AppxPackage 
Get-AppxPackage *dolbyaccess* | Remove-AppxPackage

# To uninstall Xbox:
Get-AppxPackage -allusers *Xbox.TCUI* | Remove-AppxPackage 
Get-AppxPackage -allusers *XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage -allusers *XboxGameCallableUI* | Remove-AppxPackage 
Get-AppxPackage -allusers *XboxGamingOverlay* | Remove-AppxPackage 
Get-AppxPackage -allusers *XboxApp* | Remove-AppxPackage 
Get-AppxPackage -allusers *XboxGameOverlay* | Remove-AppxPackage 
Get-AppxPackage -allusers *XboxIdentityProvider* | Remove-AppxPackage 
# Get-appxpackage -allusers *xbox* | remove-appxpackage -AllUsers

# Disable Apps for Default User
CMD /C reg load HKU\Default_User C:\Users\Default\NTUSER.DAT
Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SystemPaneSuggestionsEnabled -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name PreInstalledAppsEnabled -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name OemPreInstalledAppsEnabled -Value 0
# opt
Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name ContentDeliveryAllowed -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name PreInstalledAppsEverEnabled -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SoftLandingEnabled -Value 0
Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContentEnabled -Value 0
# Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions
# Set-ItemProperty -Path Registry::HKU\Default_User\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps
# opt
CMD /C reg unload HKU\Default_User

# Disable Cortana
Function DisableCortana
{  
    $path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"    
    IF(!(Test-Path -Path $path)) { 
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "Windows Search"
    } 
    Set-ItemProperty -Path $path -Name "AllowCortana" -Value 0 
    # Do Restart Explorer to change it immediately    
    Stop-Process -name explorer
}
DisableCortana