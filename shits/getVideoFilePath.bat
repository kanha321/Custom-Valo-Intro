@echo off

setlocal enabledelayedexpansion

for /f "tokens=2 delims==" %%i in (
    'wmic process where "name='RiotClientServices.exe'" get ExecutablePath /value ^| find "="'
) do (
    set "riotClientPath=%%i"
)

for %%a in ("%riotClientPath%") do set "riotClientPath=%%~dpa"
for /f "tokens=1 delims=\" %%a in ("%riotClientPath%") do set "driveLetter=%%a"


%driveLetter%
cd %riotClientPath%
cd ..
cd "VALORANT\live\ShooterGame\Content\Movies\Menu"

if exist "HomeScreen*.mp4" (
    echo Home Screen Video Found

    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "mp4File=%%i"
    )
) else (
    echo Home Screen Video Not Found
    echo Something's Wrong!! Exiting...
    timeout /t 5
    exit
)

echo.
endlocal & set "videoFilePath=%cd%\%mp4File%"