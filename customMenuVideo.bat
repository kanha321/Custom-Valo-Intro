@echo off

color 0a

@REM set "processName=RiotClientServices.exe"

@REM tasklist /fi "ImageName eq %processName%" /fo csv 2>NUL | find /I "%processName%">NUL

@REM if not "%ERRORLEVEL%"=="0" (
@REM     echo.
@REM     color 04
@REM     echo Riot Client is not running.
@REM     echo Launch Riot Client and then run this script again.
@REM     pause
@REM     exit
@REM )

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