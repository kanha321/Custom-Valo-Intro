@echo off

setlocal enabledelayedexpansion

echo at customMenu%cd%
pause

call readvar menu_folder

if not %value%=="default" (
    call setCustomPath.bat %value%
    goto :findVideo
)

if not %value%=="0" (
    call setCustomPath.bat %value%
    goto :findVideo
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

echo.
echo finding HomeScreen*.mp4 in: %cd%

if exist "HomeScreen*.mp4" (
    echo Home Screen Video Found

    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "mp4File=%%i"
    )
) else (
    echo ERROR...
    color 0c
    echo Home Screen Video Not Found
    echo Go to path.bat txt and add your custom path there
    pause
    exit
)

echo.
endlocal & set "videoFilePath=%cd%\%mp4File%"