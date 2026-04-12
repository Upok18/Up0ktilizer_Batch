@echo off

set tempTool=%temp%\up0k_tool.bat
set tempVer=%temp%\up0k_version.txt

set toolURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer_Batch/refs/heads/main/tool.bat?%random%
set verURL=https://raw.githubusercontent.com/Upok18/Up0ktilizer_Batch/refs/heads/main/version.txt?%random%

echo Checking latest version...

curl -sL "%verURL%" -o "%tempVer%"
set /p remoteVer=<"%tempVer%"

echo Downloading latest tool...
curl -sL "%toolURL%" -o "%tempTool%"

call "%tempTool%"

echo Cleaning up...
del "%tempTool%" >nul 2>&1
del "%tempVer%" >nul 2>&1

pause
