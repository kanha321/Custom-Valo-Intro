@echo off

setlocal enabledelayedexpansion

call readvar menu_folder

if not %value%=="default" (
    if not %value%=="0"  ( 
        set "value=!value:~1,-1!"

        echo Found Custom Path: %value%
        echo.
        echo Going to your specified path... 

        for /f "tokens=1 delims=\" %%a in ("%value%") do set "driveLetter=%%a"

        %driveLetter%
        cd %value%
        goto :findVideo
    )
) else (
    echo.
    echo No Custom Path Found
    echo.
    echo Going to default path...
)

for /f "tokens=2 delims==" %%i in (
    'wmic process where "name='RiotClientServices.exe'" get ExecutablePath /value ^| find "="'
) do (
    set "riotClientPath=%%i"
)

echo This is location of your RiotClientServices.exe file: %riotClientPath%

for %%a in ("%riotClientPath%") do set "riotClientPath=%%~dpa"
for /f "tokens=1 delims=\" %%a in ("%riotClientPath%") do set "driveLetter=%%a"


%driveLetter%
cd %riotClientPath%
cd ..

if exist "VALORANT" (
    cd VALORANT
) else (
    echo.
    echo VALORANT folder not found
)

cd "live\ShooterGame\Content\Movies\Menu"

:findVideo
pause

echo.
echo finding HomeScreen*.mp4 in: %cd%

if exist "HomeScreen*.mp4" (
    echo Home Screen Video Found
    pause

    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "mp4File=%%i"
    )
) else (
    echo ERROR...
    color 04
    echo Home Screen Video Not Found
    echo Go to path.bat txt and add your custom path there
    pause
    exit
)

echo.
endlocal & set "videoFilePath=%cd%\%mp4File%"