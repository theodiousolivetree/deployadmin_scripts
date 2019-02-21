
# =======================================================
# NAME: creat_user-v1.ps1
# AUTHOR: Pavilla Olivier, Deployadmin.com
# Aka The Odious Olivetree
# DATE: 19/02/2019
#
# KEYWORDS: user, create, account, local , default
# VERSION 1.0
# DD/MM/YYYY added help to the functions
# COMMENTS: Creating local user and joining in admin group
# Set Set-ExecuionPolicy unrestricted
#Requires -Version 2.0
# =======================================================
# Input password used for new account
# $Password = Read-Host -AsSecureString
$password = EZpa$$w0rd 
New-LocalUser "lstaff" -Password $Password -FullName "lstaff" -Description "staff Admin account."
Get-LocalUser -Name "lstaff" | Enable-LocalUser
Add-LocalGroupMember -Group "Administrateurs" -Member "lstaff"
# Add-LocalGroupMember -Group "Administrateurs" -Member "LIMSI\wstaff"

$password = EZpa$$w0rd 
New-LocalUser "p2staff" -Password $Password -FullName "p2staff" -Description "P2I Admin account."
Get-LocalUser -Name "p2staff" | Enable-LocalUser
Add-LocalGroupMember -Group "Administrateurs" -Member "p2staff"

$OldList = Get-WinUserLanguageList
$OldList.Add("fr-FR")
Set-WinUserLanguageList $OldList
