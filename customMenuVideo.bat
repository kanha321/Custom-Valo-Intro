@echo off

color 0a

set "processName=RiotClientServices.exe"

tasklist /fi "ImageName eq %processName%" /fo csv 2>NUL | find /I "%processName%">NUL

if not "%ERRORLEVEL%"=="0" (
    echo.
    color 04
    echo Riot Client is not running.
    echo Launch Riot Client and then run this script again.
    pause
    exit
)

for /f "delims=" %%i in ('dir /b /a-d *.mp4 ^| find /v /c ""') do (
    set "count=%%i"
)

set "myDir=%cd%"

cd shits
echo.
call getVideoFilePath.bat

cd ..
call shits\setNewVideo.bat %count%

echo %myDir%\%videoName%

copy "%myDir%\%videoName%" "%videoFilePath%"
echo.
echo Done!!!
echo.
call shits\findValorant.bat