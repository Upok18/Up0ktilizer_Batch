@echo off
title Up0ktilizer Loader

set url=https://raw.githubusercontent.com/Upok18/Up0ktilizer/refs/heads/main/tool.bat
set tempFile=%temp%\Up0ktilizer_tool.bat

echo Downloading Up0ktilizer...
curl -L -o "%tempFile%" "%url%"

echo Starting tool...
call "%tempFile%"

echo Cleaning up...
del "%tempFile%"

exit
