@echo off

set tempTool=%temp%\up0k_tool.bat
rem set tempVer=%temp%\up0k_version.txt

set toolURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer_Batch/refs/heads/main/tool.bat?%random%
rem set verURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer_Batch/refs/heads/main/version.txt?%random%

rem echo Checking latest version...

rem curl -sL "%verURL%" -o "%tempVer%"
rem set /p remoteVer=<"%tempVer%"

echo Running latest tool...
curl -sL "%toolURL%" -o "%tempTool%"

call "%tempTool%"

echo Cleaning up...
del "%tempTool%" >nul 2>&1
rem del "%tempVer%" >nul 2>&1

pause
