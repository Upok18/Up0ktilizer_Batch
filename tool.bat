@echo off
set tool_version=1.6
title MANU
color 0a

goto changelog

:menu
title MANU
color 0a
cls
echo ==============================
echo       Up0ktilizer (ver 1.6)
echo ==============================
echo [1] Yt-dlp
echo [2] spicetify update(Extra option)
echo [3] Scrcpy
echo [4] Winutil
echo [5] Exit
echo test
REM set /p choice=Choose an option: 
choice /N /C 12345 /M "Chose an option:"

if errorlevel 5 goto :exit
if errorlevel 4 goto :winutil 
if errorlevel 3 goto :scrcpy
if errorlevel 2 goto :spice
if errorlevel 1 goto :yt

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

:winutil
title Winutil(Chris Titus)
echo.
echo Running Win Utility....
timeout /t 6 >nul
echo Opening Win Utility...

echo x=MsgBox("Do not panic if it doesn't appear just wait for a second!",0+64,"Winutil") > "%temp%\winutil.vbs"
cscript //nologo "%temp%\winutil.vbs"
del "%temp%\winutil.vbs" >nul 2>&1


REM powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoLogo -NoProfile -ExecutionPolicy Bypass -Command ""irm https://christitus.com/win | iex""'" 

REM echo Do not panic if it doesn't appear just wait for a second!
powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoLogo -NoProfile -ExecutionPolicy Bypass -Command ""irm https://christitus.com/win | iex""'" >nul
REM Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -NoExit -ExecutionPolicy Bypass -Command `"irm https://christitus.com/win | iex`"" -NoNewWindow
REM where Winwutil.bat 2>nul

REM start Winutil.bat 2>nul
echo Press any key to continue...
pause >nul

cls
echo.
echo [1] Main Menu 
echo [2] Exit
CHOICE /n /c 12 /m "Chose an option:"

if errorlevel 2 goto exit
if errorlevel 1 goto menu

:changelog
timeout /t 3 >nul
echo This is for test!
timeout /t 2 >nul
echo Everything you see is subject to change!
timeout /t 2 >nul
echo Press any key to continue
pause >nul
cls
echo Kaiyum femboy (•_•)
timeout /t 3 >nul
echo Going to menu in a moment...
timeout /t 2 >nul
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

exit
