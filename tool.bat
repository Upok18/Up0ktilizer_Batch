@echo off
set tool_version=1.1
title MANU
color 0a
cls

set tempascii=https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/Ascii.txt
curl -s -o "%temp%\Ascii.txt" https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/Ascii.txt

REM call :changelog
goto :menu

:menu
title MANU v%tool_version%
color 0a
cls
echo =========================================================================================================
type "%temp%\Ascii.txt"
echo =========================================================================================================
REM echo ==============================
REM echo       Up0ktilizer (v%tool_version%)
REM echo ==============================
echo  [1] SFC and DISM (File Repair)
echo  [2] spicetify update(Extra option)
echo  [3] Scrcpy
echo  [4] Winutil
echo  [5] Exit
REM set /p choice=Choose an option: 
choice /N /C 12345k /M " Choose an option:"
REM choice /C k /N 

if errorlevel 6 goto :arifin
if errorlevel 5 goto :exit
if errorlevel 4 goto :winutil 
if errorlevel 3 goto :scrcpy
if errorlevel 2 goto :spice
if errorlevel 1 goto :sfc

:sfc
color 0b
cls
echo.
echo  It will take some time to check for files and to remove, 
timeout /t 2 >nul
echo  That is corrupted, or temporary cache files.
timeout /t 2 >nul
echo  do you want to run this command??
choice /n /c YN /m "  Press Y to continue or Press N to cancel it:"

if errorlevel 2 goto :menu

if errorlevel 1 (
Title System File Repair
timeout /t 2 >nul
echo Running system file repair...
timeout /t 2 >nul
echo This may take up to 10-20min...
timeout /t 2 >nul
echo you can keep using your pc...
timeout /t 2 >nul

REM powershell -Command "Start-Process cmd -Verb RunAs -Wait -ArgumentList '/k echo Running System Repair... ^& dism /online /cleanup-image /restorehealth ^&^& sfc /scannow ^& echo. ^& echo Repair Completed'"

powershell -Command "Start-Process cmd -Verb RunAs -Wait -ArgumentList '/c title System File Repair & dism /online /cleanup-image /restorehealth & sfc /scannow'"

echo MsgBox "File checking has been completed",64,"Complete" > "%temp%\complete.vbs"
start "" wscript "%temp%\complete.vbs"
timeout /t 1 >nul
del "%temp%\complete.vbs"

echo Done..
timeout /t 2 >nul
echo Press any key to cnotinue...
pause >nul
echo.
echo [1] Menu 
echo [2] exit
choice /n /c 12 /m "Choose and option:"

if errorlevel 2 goto exit
if errorlevel 1 goto menu

)

:underway
color 0C
echo This command is stil in developement....
timeout /t 2 >NULL
echo It will be added soon...
pause
exit /b
REM echo [1] Go back to menu
REM echo [2] Exit
REM set /p choice=Choose an option: 
REM choice /N /C 12 /M "Choose an option:"

if "%errorlevel%"=="2" goto :exit
if "%errorlevel%"=="1" goto :menu


:scrcpy
call :underway
goto :menu
color 09
title Scrcpy
cls 
goto underway
echo Running Scrcpy...
dir "scrcpy.exe" /s /b 2>nul
scrcpy --prefer-text --video-playback --audio-source=playback --max-video-size 1M --audio-bit-rate 6M --render-driver=opengl

::title Name
::cls 
::echo.
::echo Details
::timeout /t 1 >nul
::REM echo [1] Install [2] Go Back 
::echo.
::choice /n /c 12 /m "[1] Install [2] Go Back: "

::if errorlevel 2 goto 

::if errorlevel 1 (
::title Installing
::cls
::echo.
::timeout /t 1 >nul
::echo Installing Name...
::timeout /t 3 >nul
::winget install -e --id Name.Name --silent --accept-package-agreements --accept-source-agreements
::timeout /t 2 >nul
::echo Done 
::echo. 
::echo Press any key to continue....
::pause >nul
::goto esc
::)

::)

:winutil
title Winutil
color 0B
cls
REM goto underway
echo ============================
echo [1] Up0ktilizer
echo ============================
echo [2] Chris Titus(Recommended)
echo ============================
echo [3] Go Back
echo ============================
choice /c 123k /n /m "Choose an option:"

if errorlevel 4 goto :ky
if errorlevel 3 goto :menu
if errorlevel 2 goto :titus
if errorlevel 1 goto :up

:up
title Up0ktilizer
color 0a
cls
REM goto underway

echo ========================
echo Welcome to Up0ktilizer
echo ========================
echo [1] Install app/software
echo [2] Upgrade app/software
echo [3] Unistall app/software
echo [4] Go back
echo [5] Main Menu
echo only winget is available!
echo.
choice /n /c 12345 /m "Choose an option:"

if errorlevel 5 goto menu
if errorlevel 4 goto winutil
if errorlevel 3 goto menuupun
if errorlevel 2 goto menuupu
if errorlevel 1 goto menuupi

:menuupi
title Select
color 0b
cls
set browser_count=2
set multi_count=2
set utili_count=2
set doc_count=1
echo.
echo     --------------------------------------------------------------------------------
echo                              Select Any Option to Continue...
echo     ================================================================================
echo     [1] Browsers          [2]Multimedias          [3]Utilities          [4]Documents
echo                                    [5] Go Back
echo     ================================================================================
choice /n /c 12345 /m "    :"

if errorlevel 5 goto up
if errorlevel 4 goto docupi
if errorlevel 3 goto utiupi
if errorlevel 2 goto multiupi
if errorlevel 1 goto broupi

:broupi
title Up0ktilizer Browser
color 0a
cls
REM call :underway
REM goto menuupi
echo.
echo.
echo --------------------------------------------------------------------------------------------------------
echo                                             B R O W S E R 
echo ========================================================================================================
echo [1] Chrome             [2] Brave             [3] Firefox              [4] Zen               [5] Opera
echo ========================================================================================================
echo Available Browsers:%browser_count%
echo.
echo [B] Go back [C] Exit
choice /n /c 12345BC /m "Choose an option:"

if errorlevel 7 goto :exit
if errorlevel 6 goto menuupi

if errorlevel 5 (
call :underway
goto menuupi
)

if errorlevel 4 (
call :underway
goto menuupi
)

if errorlevel 3 (
call :underway
goto menuupi

)

if errorlevel 2 goto :aboutbrave
if errorlevel 1 goto :aboutchrome

:aboutbrave
REM call :underway
REM goto menuupi
title Brave
cls 
echo.
echo  Brave is a free, open-source, Chromium-based browser focused on privacy and speed, 
echo  blocking ads and trackers by default to load pages up to 3x faster than Google Chrome. 
echo  It features built-in Brave Shields (blocking ads/trackers), Brave Leo AI assistant, 
echo  and Brave Rewards (optional cryptocurrency earning).
timeout /t 1 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :broupi 
if errorlevel 1 goto :installbrave


:installbrave
title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Brave...
timeout /t 3 >nul
winget install -e --id Brave.Brave --silent --accept-package-agreements --accept-source-agreements
timeout /t 1 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc

:aboutchrome
title Chrome
cls 
echo Google Chrome is a fast, secure, 
echo and widely used cross-platform web browser developed by Google
echo.
timeout /t 2 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :broupi
if errorlevel 1 goto :installchrome 


:installchrome
title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Chrome...
timeout /t 3 >nul
winget install -e --id Google.Chrome --silent --accept-package-agreements --accept-source-agreements
timeout /t 1 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc

:multiupi
title Up0ktilizer Browser
color 0a
cls
echo.
echo.
echo --------------------------------------------------------------------------------------------------------
echo                                           M U L T I M E D I A 
echo ========================================================================================================
echo [1] Audacity           [2] VLC 
echo ========================================================================================================
echo Available Browsers:%multi_count%
echo.
echo [B] Go back [C] Exit
choice /n /c 12BC /m "Choose an option:"

if errorlevel 4 goto Exit
if errorlevel 3 goto upi
if errorlevel 2 goto :aboutvlc
if errorlevel 1 goto :aboustauda

:aboutvlc
title About VLC
cls
echo.
echo VLC is a free and open source cross-platform multimedia player and 
echo framework that plays most multimedia files as well as DVDs, Audio CDs, 
echo VCDs, and various streaming protocols. Simple, 
echo fast and powerful ✓ Plays everything - Files, Discs, Webcams, Devices and Streams. 
echo ✓ Pays most codecs with no codec packs needed - MPEG-2, MPEG-4, H.264, MKV, WebM, 
echo WMV, MP3... ✓ Runs on all platforms - Windows, Linux, Mac OS X, Unix, iOS, 
echo Android ... ✓ Completely Free - no spyware, no ads and no user tracking.

timeout /t 2 >nul
echo.
REM echo [1] Install [2] Go Back 
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :multiupi

if errorlevel 1 (
cls
::vlc
echo Installing VLC...
timeout /t 3 >nul
winget install -e --id VideoLAN.VLC --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)

:aboustauda
title About Audacity
cls
echo.
echo Audacity is the world’s most popular free software for recording and editing audio. 
echo So if you're producing music, a podcast, or just playing around with audio,
echo Audacity is for you.
timeout /t 2 >nul
echo.
REM echo [1] Install [2] Go Back 
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :multiupi

if errorlevel 1 (
cls
::auda
echo Installing Audacity...
timeout /t 3 >nul
winget install -e --id Audacity.Audacity --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)
 
:utiupi
title Utilities
color 0a
cls
REM call :underway 
REM goto :up
Echo.
echo.
echo --------------------------------------------------------------------------------------------------------
echo                                           U T I L I T I E S
echo ========================================================================================================
echo [1] Github           [2] Winrar           [3]  7-zip(X)           [4] Power toys
echo ========================================================================================================
echo Available Browsers:%utili_count%
echo.
echo [B] Go back [C] Exit
choice /n /c 1234BC /m "Choose an option:"

if errorlevel 6 goto :exit
if errorlevel 5 goto :upi

if errorlevel 4 (
call :underway
goto :utiupi
)

if errorlevel 3 (
call :underway
goto :utiupi
)

if errorlevel 2 goto :aboutwinrar
if errorlevel 1 goto :aboutgit

:aboutpower
title About Powertoys
cls 
echo.
echo With GitHub Desktop, you can interact with GitHub using a GUI instead of the command line or a web browser. 
echo You can use GitHub Desktop to complete most Git commands from your desktop, such as pushing to, pulling from, 
echo and cloning remote repositories, attributing commits, and creating pull requests, with visual confirmation of changes.
timeout /t 1 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto upi

if errorlevel 1 (

title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Github...
timeout /t 3 >nul
winget install -e --id GitHub.GitHubDesktop --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)

:aboutwinrar
title About Winrar
cls 
echo.
echo WinRAR is a powerful archiver (RAR and ZIP) and 
echo extractor tool that can open all popular file formats.
timeout /t 1 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :utiupi

if errorlevel 1 (

title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Winrar...
timeout /t 3 >nul
winget install -e --id RARLab.WinRAR --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)

:aboutgit
title About Github Desktop
cls 
echo.
echo With GitHub Desktop, you can interact with GitHub using a GUI instead of the command line or a web browser. 
echo You can use GitHub Desktop to complete most Git commands from your desktop, such as pushing to, pulling from, 
echo and cloning remote repositories, attributing commits, and creating pull requests, with visual confirmation of changes.
timeout /t 1 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto upi

if errorlevel 1 (

title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Github...
timeout /t 3 >nul
winget install -e --id GitHub.GitHubDesktop --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)

:docupi
title Documents
color 0a
cls
REM call :underway 
REM goto :up
Echo.
echo.
echo --------------------------------------------------------------------------------------------------------
echo                                           D O C U M E N T S
echo ========================================================================================================
echo [1] Notepad++                             More Coming Soon! 
echo ========================================================================================================
echo Available Docs:%doc_count%
echo.
echo [B] Go back [C] Exit
choice /n /c 1BC /m "Choose an option:"

if errorlevel 3 goto Exit
if errorlevel 2 goto upi
if errorlevel 1 goto :aboutnotepad+


:aboutnotepad+
title About Notepad++
cls 
echo.
echo Notepad++ is a free (as in “free speech” and also as in “free beer”) source code editor and 
echo Notepad replacement that supports several languages. Running in the MS Windows 
echo environment, its use is governed by GNU General Public License.
timeout /t 1 >nul
REM echo [1] Install [2] Go Back 
echo.
choice /n /c 12 /m "[1] Install [2] Go Back: "

if errorlevel 2 goto :docupi
if errorlevel 1 goto :notepad+


:notepad+
title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Notepad++...
timeout /t 3 >nul
winget install -e --id Notepad++.Notepad++ --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
echo Press any key to continue....
pause >nul
goto esc
)

:titus
title Chris Titus
color 0b
cls
REM echo x=MsgBox("Do not panic It takes time to load",0+64,"Chris Titus") > "%temp%\info.vbs"
REM echo WScript.Quit(x) >> "%temp%\info.vbs"

::Run popup
REM cscript //nologo "%temp%\info.vbs"
REM set result=%errorlevel%

::Delete temp script
REM del "%temp%\info.vbs"
echo.
echo It recuires to run in Administrator mode to run tweaks..
echo.
timeout /t 3 >nul
echo Running Chris Titus Utilities...
timeout /t 1 >nul
REM powershell -command "irm christitus.com/win | iex"

powershell -Command "Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""irm https://christitus.com/win | iex""'"

timeout /t 1 >nul
echo.
choice /n /c 12 /m "[1]Go back  [2]Exit:"

if errorlevel 2 goto :exit
if errorlevel 1 goto :winutil

:esc 
echo [1] Up0ktilizer menu   [2] exit
choice /n /c 12 /m "Choose an option:"

if errorlevel 2 goto exit
if errorlevel 1 goto up

:changelog
timeout /t 3 >nul
echo This is for test!
timeout /t 2 >nul
echo Everything you see is subject to change!
timeout /t 2 >nul
echo Press any key to continue...
pause >nul
REM cls

goto menu

:ky
title Easter egg
echo.
echo You have found the Easter egg!
timeout /t 2 >nul
echo Kaiyum femboy 
timeout /t 2 >nul
echo :)
timeout /t 3 >nul
echo I know that from the begining
timeout /t 2 >nul
echo and here is the prove
timeout /t 2 >nul
REM start https://imgur.com/a/Z2RsFPg
start https://i.imgur.com/bmWyApT.png
echo press any key to continue...
timeout /t 3 >nul
pause >nul

goto menu

:arifin
title Easter egg
echo.
echo You have found the Easter egg!
timeout /t 2 >nul
echo Arifina :)
timeout /t 2 >nul
echo Gay boy..
timeout /t 2 >nul
echo I nkow what you send to your homies >:)
timeout /t 2 >nul
echo wait a sec
timeout /t 3 >nul
start https://i.imgur.com/XayYtaj.png
REM echo press any key to continue... 
pause
echo also I had to to say something...
timeout /t 3 >nul
title Malware
color 0c
cls
shutdown /s /t 20 /c "Installing Malware" >nul
REM timeout /t 3 >nul
REM shutdown /a >nul
timeout /t 2 >nul
echo finally a world without one less gay 
timeout /t 4 >nul
goto :exit

:exit
cls
REM echo Press C to cancel exit
REM echo Exiting in:
REM for /L %%i in (5,-1,1) do (
REM echo %%i...
REM choice /C CX /N /T 1 /D X >nul

if errorlevel 2 (
rem timeout happened → continue countdown
) else (
echo Cancelling exit, going back to menu...
timeout /t 2 >nul
goto menu
)
)

del "%temp%\Ascii.txt" >nul 2>&1

exit
