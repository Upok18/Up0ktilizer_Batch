@echo off
title Up0ktilizer Loader

set tempFile=%temp%\up0k_tool.bat
set url=https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/tool.bat?%random%

del "%tempFile%" >nul 2>&1

echo Downloading latest version...
curl -L "%url%" -o "%tempFile%"

echo Starting tool...
call "%tempFile%"

del "%tempFile%"
exit
