# Sets Lockscreen for Windows 10 Pro #

takeown /f C:\Windows\Web
takeown /f C:\Windows\Web\*.* /R
takeown /f C:\ProgramData\Microsoft\Windows\SystemData /R /D Y
icacls C:\ProgramData\Microsoft\Windows\SystemData\*.* /reset /T /C
icacls C:\Windows\Web\*.* /reset /T /C
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img100.jpg /y
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img101.jpg /y
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img102.jpg /y
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img103.jpg /y
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img104.jpg /y
copy \\Server\everyone\LockScreen\img100.jpg C:\Windows\Web\Screen\img105.jpg /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img100.png /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img101.png /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img102.png /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img103.png /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img104.png /y
copy \\Server\everyone\LockScreen\img101.png C:\Windows\Web\Screen\img105.png /y
RD C:\ProgramData\Microsoft\Windows\SystemData /S /Q
icacls c:\windows\web\*.* /setowner "NT Service\TrustedInstaller" /T /C"