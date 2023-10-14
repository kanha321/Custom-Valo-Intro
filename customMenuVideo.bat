@echo off

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