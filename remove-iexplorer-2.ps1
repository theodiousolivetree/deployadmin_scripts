# =======================================================
# NAME: removeappsforall-v1.ps1
# AUTHOR: Pavilla Olivier, Deployadmin.com
# Aka The Odious Olivetree
# DATE: 19/02/2019
#
# KEYWORDS: remove, Internet Explorer, default
# VERSION 1.0
# DD/MM/YYYY added help to the functions
# COMMENTS: Removing default apps for all users especially default user
# Set Set-ExecutionPolicy unrestricted
#Requires -Version 2.0
# =======================================================
# Define Variables #
# $ErrorAction = 'silentlycontinue'
$ErrorActionPreference = 'silentlycontinue'

Get-Process "iexplore" | Stop-process -Force 
FORFILES /P %WINDIR%\servicing\Packages /M Microsoft-Windows-InternetExplorer-*11.*.mum /c "cmd /c echo Uninstalling package @fname && start /w pkgmgr /up:@fname /quiet /norestart"
    CMD /C "C:\Windows\System32\taskkill.exe /f /im OneDrive.exe"
    CMD /C "C:\Windows\System32\taskkill.exe /f /im explorer.exe"