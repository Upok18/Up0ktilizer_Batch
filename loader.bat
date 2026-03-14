@echo off

set tempTool=%temp%\up0k_tool.bat
set tempVer=%temp%\up0k_version.txt

set toolURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/tool.bat?%random%
set verURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/version.txt?%random%

echo Checking latest version...

curl -sL "%verURL%" -o "%tempVer%"
set /p remoteVer=<"%tempVer%"

if exist "%tempTool%" (
    findstr "%remoteVer%" "%tempTool%" >nul
    if %errorlevel%==0 (
        echo Tool already up to date.
        goto runTool
    )
)

echo Updating tool...
curl -sL "%toolURL%" -o "%tempTool%"

:runTool
call "%tempTool%"

echo Cleaning up...

del "%tempTool%" >nul 2>&1
del "%tempVer%" >nul 2>&1

exit
