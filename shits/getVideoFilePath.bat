@echo off

setlocal enabledelayedexpansion

if not defined launchable (
    echo This file is not meant to be run directly
    pause
    goto :EOF
)

call readvar valorant_folder

if not %value%=="default" (
    if not %value%=="0"  ( 
        set "value=!value:~1,-1!"

        echo Found Custom Path: %value%
        echo.
        echo Going to your specified path... 

        cd /d %value%
        goto :findVideo
    )
)

for /f "tokens=2 delims==" %%i in (
    'wmic process where "name='RiotClientServices.exe'" get ExecutablePath /value ^| find "="'
) do (
    set "riotClientPath=%%i"
)

echo This is location of your RiotClientServices.exe file: %riotClientPath%

echo %riotClientPath%>riotClientPath.txt

for %%a in ("%riotClientPath%") do set "riotClientPath=%%~dpa"

cd /d %riotClientPath%
cd ..

if exist "VALORANT" (
    cd VALORANT
) else (
    echo is this your path?
)

:findVideo

cd "live\ShooterGame\Content\Movies\Menu"

echo.
echo finding HomeScreen*.mp4 in: %cd%
echo.

if exist "*HomeScreen*.mp4" (
    echo Home Screen Video Found

    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "mp4File=%%i"
    )
) else (
    color 04
    echo ERROR...
    echo Wrong Path
    echo.
    echo Opening path.txt file, add your path there "e.g. K:\...\VALORANT"
    pause
    start notepad %myDir%\path.txt
    exit
)

echo.
endlocal & set "videoFilePath=%cd%\%mp4File%"