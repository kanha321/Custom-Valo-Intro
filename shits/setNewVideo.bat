@echo off

setlocal enabledelayedexpansion

if not defined launchable (
    echo This file is not meant to be run directly
    pause
    goto :EOF
)

set "count=%1"

if %count%==0 (
    echo no mp4 files found
    echo exiting...
    pause
    exit
) else if %count%==1 (
    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "videoName=%%i"
    )
) else (
    echo found %count% videos
    echo.
    echo Select the video you want to use.
    echo.

    for /f "delims=" %%i in ('dir /b *.mp4') do (
        echo %%i
    )
    
    echo.
    set /p videoName= Copy and Paste the Video Name Here: 
)

if not exist "%videoName%" (
    echo.
    echo Video Not Found
    echo Exiting...
    pause
    exit
)

endlocal & set "videoName=%videoName%"