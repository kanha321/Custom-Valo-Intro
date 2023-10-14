@echo off

setlocal enabledelayedexpansion

cd ..
call path.bat

set "vidPath=%path%"
cd shits

for /f "tokens=1,2 delims==" %%i in ("%vidPath%") do (
    set "useCustomPath=%%i"
    set "path=%%j"
)

if "%useCustomPath%"=="0" (

    for /f "tokens=2 delims==" %%i in ('wmic process where "name='RiotClientServices.exe'" get ExecutablePath /value ^| find "="') do (
        set "riotClientPath=%%i"
    )

    for %%a in ("%riotClientPath%") do set "riotClientPath=%%~dpa"
    for /f "tokens=1 delims=\" %%a in ("%riotClientPath%") do set "driveLetter=%%a"

    set "path1=VALORANT\live\ShooterGame\Content\Movies\Menu\" 
    set "path2=live\ShooterGame\Content\Movies\Menu\" 

    %driveLetter%
    cd %riotClientPath%
    cd ..

    if exist "VALORANT\live\ShooterGame\Content\Movies\Menu\HomeScreen*.mp4" (
        echo Home Screen Video Found in path1

        for /f "delims=" %%i in ('dir /b *.mp4') do (
            set "mp4File=%%i"
        )
    ) else if exist "live\ShooterGame\Content\Movies\Menu\HomeScreen*.mp4" (

        echo Home Screen Video Found in path2

        for /f "delims=" %%i in ('dir /b *.mp4') do (
            set "mp4File=%%i"
        )
    ) else (
        echo Home Screen Video Not Found
        echo Something went wrong!! Exiting...
        pause
        exit
    )
) else (
    cd %path%
    if exist "HomeScreen*.mp4" (
        echo Home Screen Video Found in custom path

        for /f "delims=" %%i in ('dir /b *.mp4') do (
            set "mp4File=%%i"
        )
    ) else (
        echo Home Screen Video Not Found
        echo Something went wrong!! Exiting...
        pause
        exit
    )
)

echo.
endlocal & set "videoFilePath=%cd%\%mp4File%"