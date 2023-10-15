@echo off

setlocal enabledelayedexpansion

set "value=%1"

set "value=!value:~1,-1!"

echo Found Custom Path: %value%
echo.
echo Going to your specified path... 

for /f "tokens=1 delims=\" %%a in ("%value%") do set "driveLetter=%%a"

%driveLetter%
cd %value%
pause