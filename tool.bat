@echo off
set tool_version=1.2
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
echo [1] SFC and DISM (File Repair)
echo [2] spicetify update(Extra option)
echo [3] Scrcpy
echo [4] Winutil
echo [5] Exit
REM set /p choice=Choose an option: 
choice /N /C 12345k /M "Chose an option:"
REM choice /C k /N 

if errorlevel 6 goto :ky
if errorlevel 5 goto :exit
if errorlevel 4 goto :winutil 
if errorlevel 3 goto :scrcpy
if errorlevel 2 goto :spice
if errorlevel 1 goto :sfc

:sfc
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
choice /n /c 12 /m "Chose and option:"

if errorlevel 2 goto exit
if errorlevel 1 goto menu

:yt
title yt-dlp
cls
goto underway
echo Looking for yt-dlp...
where yt-dlp >nul 2>nul

if %errorlevel%==0 (
echo Found yt-dlp
timeout /t 2 >nul
goto ytmenu
) else (
echo yt-dlp not found
timeout /t 2 >nul
goto yins
)

if exit "%path%" (
cd /d "%path%"
goto ytmenu
) else (
echo Sorry theres no such thing as yt-dlp :-( 
REM choice /m "Have you Installed it in your pc??" /c YN
CHOICE /N /C YN /M "(Have you Installed it in your pc)"
)

IF ERRORLEVEL ==NO GOTO yins
IF ERRORLEVEL ==YES GOTO yins

:yins
echo Select install location...

:: Open folder picker
for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.FolderBrowserDialog; if($f.ShowDialog() -eq 'OK'){ $f.SelectedPath }"') do set installpath=%%i

if not defined installpath (
echo No folder selected.
pause
exit
)

echo.
echo Installing yt-dlp to:
echo %installpath%
timeout /t 2 >nul

echo Select install folder...

:: Folder picker
for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.FolderBrowserDialog; if($f.ShowDialog() -eq 'OK'){ $f.SelectedPath }"') do set installpath=%%i

if not defined installpath (
echo No folder selected.
pause
exit
)

echo.
echo Installing to:
echo %installpath%
timeout /t 2 >nul

:: Download yt-dlp
echo Downloading yt-dlp...
powershell -command "Invoke-WebRequest https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -OutFile '%installpath%\yt-dlp.exe'"

:: Download FFmpeg
echo Downloading FFmpeg...
powershell -command "Invoke-WebRequest https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -OutFile '%installpath%\ffmpeg.zip'"

:: Extract FFmpeg
echo Extracting FFmpeg...
powershell -command "Expand-Archive '%installpath%\ffmpeg.zip' '%installpath%' -Force"

del "%installpath%\ffmpeg.zip"

echo.
echo ===============================
echo Installation Finished
echo yt-dlp: %installpath%\yt-dlp.exe
echo FFmpeg extracted in install folder
echo ===============================

pause
goto ysmenu

:ysmenu
echo [1] yt-dlp menu
echo [2] main menu
echo [3] Exit
REM set /p choice=Choose an option: 
CHOICE /N /C 12 /M "Chose an option!:"

if errorlevel 3 goto exit
if errorlevel 2 goto menu
if errorlevel 1 goto ytmenu

:ytmenu
title Yt-dlp
color 0b
cls
echo ==============================
echo            Yt-dlp
echo ==============================
echo [1] Download Video
echo [2] Download Audio
echo [3] Back to menu
REM set /p choice=Choose an option: 
choice /N /C 123 /M "Chose an option:"

if errorlevel 3 goto menu
if errorlevel 2 goto mp3
if errorlevel 1 goto video

:pickfolder 
echo.
echo Select download folder...

for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.FolderBrowserDialog; if($f.ShowDialog() -eq 'OK'){ $f.SelectedPath }"') do set dpath=%%i

if not defined dpath (
echo No folder selected.
timeout /t 2 >nul
goto ytmenu
)

goto download

:video
set type=video
goto pickfolder

:mp3
set type=mp3
goto pickfolder

:playlist
set type=playlist
goto pickfolder

:download
color 0b
cls
echo selected folder:%dpath%
echo.

set /p url=Paste video url:
set /p name=Entar file name(leave it blank for default):

if "%name%"=="" set name=%%(title)s

if "%type%"=="video" (
yt-dlp -f "bv*+ba/b" --embed-thumbnail -o "%dpath%\%name%.%%(ext)s" "%url%"
)

if "%type%"=="mp3" (
yt-dlp -x --audio-format mp3 --embed-thumbnail -o "%dpath%\%name%.%%(ext)s" "%url%"
)

echo.
echo Download finished!...
pause
echo
echo [1] Main Menu
echo [2] Yt-dlp Menu
echo [3] exit
choice /n /c 123 /m "Chose and option:"

if errorlevel 3 goto exit
if errorlevel 2 goto ytmenu
if errorlevel 1 goto menu

:underway
color 0C
echo This command is stil in developement....
timeout /t 3 >NULL
echo [1] Go back to menu
echo [2] Exit
REM set /p choice=Choose an option: 
choice /N /C 12 /M "Chose an option:"

if "%errorlevel%"=="2" goto :exit
if "%errorlevel%"=="1" goto :menu

:spice
title spicetify updater 
color 0a
cls
goto underway
echo lookin for spicetify...
REM where spicetify.exe >nul 2>nul
dir "spicetify.exe" /s /b 2>nul

if %errorlevel%==1 (
echo Found Spicetify...
timeout /t 2 >NULL
echo Updating Spicetify.....
spicetify update 
pause
goto smenu
) else (
echo Spicetify not Found
timeout /t 2 >NULL
set /p path=Enter Spicetify path:
)

if exit "%path%" (
cd /d "%path%"
spicetify update
pause
goto smenu
) else (
echo Sorry theres no such thing as spicetify :-( 
REM choice /m "Have you Installed it in your pc??" /c YN
CHOICE /N /C YN /M "(Have you Installed it in your pc)"
)

IF ERRORLEVEL ==NO GOTO sins
IF ERRORLEVEL ==YES GOTO sins

:sins
title Spicetify Installer
cls 
echo Do you wan to intall it??
CHOICE /N /C YN /M "Do you want to install it??"
If %errorlevel%==2 (
echo spicetify installison cancelled
timeout /t 6 >NUL 
goto smenu
) else (
echo Installing Spicetify
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex
echo installison completed!
pause 
goto smenu


:smenu

echo [1] Go back to menu
echo [2] Exit
REM set /p choice=Choose an option: 
CHOICE /N /C 12 /M "Chose an option!:"

if "%errorlevel%"=="2" goto exit
if "%errorlevel%"=="1" goto menu

:scrcpy
color 09
title Scrcpy
cls 
goto underway
echo Running Scrcpy...
dir "scrcpy.exe" /s /b 2>nul
scrcpy --prefer-text --video-playback --audio-source=playback --max-video-size 1M --audio-bit-rate 6M --render-driver=opengl

::Example winget install -e --id Name.Name --silent --accept-package-agreements --accept-source-agreements
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
choice /c 123 /n /m "Chose an option:"

if errorlevel 3 goto menu
if errorlevel 2 goto titus
if errorlevel 1 goto up

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
choice /n /c 1234 /m "Chose an option:"

if errorlevel 5 goto menu
if errorlevel 4 goto winutil
if errorlevel 3 goto menuupun
if errorlevel 2 goto menuupu
if errorlevel 1 goto menuupi

:menuupi
title Select
color 0b
cls
set browser_count=5
set multi_count=2
set utili_count=0
echo.
echo ------------------------------------------------------------------------------
echo                         Select Any Option to Continue...
echo ==============================================================================
echo [1] Browsers          [2]Multimedias          [3]Utilities          [4]Go Back
echo ==============================================================================
choice /n /c 1234 /m ":"

if errorlevel 4 goto up
if errorlevel 3 goto utiupi
if errorlevel 2 goto multiupi
if errorlevel 1 goto broupi

:broupi
title Up0ktilizer Browser
color 0a
cls
call :underway
echo.
echo.
echo --------------------------------------------------------------------------------------------------------
echo                                             B R O W S E R 
echo ========================================================================================================
echo [1] Chrome             [2] Brave             [3] Firefox              [4] Zen               [5] Opera
echo ========================================================================================================
echo Available Browsers:"%browser_count%"
echo [B] Go back [C] Exit
choice /n /c 12345BC /m "Chose an option:"



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
echo Available Browsers:"%multi_count%"
echo [B] Go back [C] Exit
choice /n /c 12BC /m "Chose an option:"

if errorlevel 4 goto Exit
if errorlevel 3 goto upi
if errorlevel 2 (
call :underway
)

if errorlevel 1 (
title Installing
cls
echo.
timeout /t 1 >nul
echo Installing Audacity...
timeout /t 3 >nul
winget install -e --id Audacity.Audacity --silent --accept-package-agreements --accept-source-agreements
timeout /t 2 >nul
echo Done 
echo. 
goto esc
 
:utiupi
goto underway

:esc 
echo [1] Up0ktilizer menu   [2] exit
choice /n /c 12 /m "Chose an option:"

if errorlevel 2 exit
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

:exit
del "%temp%\Ascii.txt" >nul 2>&1

exit
