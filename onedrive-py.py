# -*- coding: utf-8 -*-
from setuphelpers import *

uninstallkey = []

def install():
    print('installing %s' % control.asrequirement())
    killalltasks("OneDrive.exe")
    killalltasks("explorer.exe")

    if iswin64():
        onedrivesetup = makepath('C:','Windows','SysWOW64','OneDriveSetup.exe')
    else:
        onedrivesetup = makepath(system32,'OneDriveSetup.exe')

    print('Uninstall OneDrive')
    run_notfatal('"%s" /uninstall' % onedrivesetup,timeout=60)

##    print('Remove OneDrive user folders')
##    for users in local_users_profiles():
##        user_od = makepath(users,'OneDrive')
##        appdata_od = makepath(users,'AppData','Local','OneDrive')
##        if isdir(user_od): remove_tree(user_od)
##        if isdir(appdata_od): remove_tree(makepath(users,'AppData','Local','OneDrive'))

    print('Remove OneDrive system folders')
    if isdir(makepath('C:','ProgramData','OneDrive')): remove_tree(makepath('C:','ProgramData','OneDrive'))
    if isdir(r'C:\OneDriveTemp'): remove_tree(r'C:\OneDriveTemp')

    print('Remove OneDrive registry keys')
    if iswin64():
        registry_set(HKEY_CLASSES_ROOT,'Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}',"System.IsPinnedToNameSpaceTree",0,REG_DWORD)
    else:
        registry_set(HKEY_CLASSES_ROOT,'CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}',"System.IsPinnedToNameSpaceTree",0,REG_DWORD)

    print('Disable OneDrive')
    registry_set(HKEY_LOCAL_MACHINE,'SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive',"DisableFileSyncNGSC",1,REG_DWORD)



def session_setup():
    print('Session setup for %s' % control.asrequirement())
    if iswin64():
        registry_set(HKEY_CURRENT_USER,r"Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}","System.IsPinnedToNameSpaceTree",0,REG_DWORD)
    else:
        registry_set(HKEY_CURRENT_USER,r"CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}","System.IsPinnedToNameSpaceTree",0,REG_DWORD)
    remove_file(makepath(user_appdata,"Microsoft","Windows","Start Menu","Programs","OneDrive.lnk"))
    remove_tree(makepath(user_local_appdata,"Microsoft","OneDrive"))


