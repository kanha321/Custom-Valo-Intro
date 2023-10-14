@echo off

for /f "delims=" %%i in ('dir /b /a-d *.mp4 ^| find /v /c ""') do (
    set "count=%%i"
)

echo number of mp4 files found: %count%

if %count%==0 (
    echo no mp4 files found
    echo exiting
    goto :EOF
) else if %count%==1 (
    for /f "delims=" %%i in ('dir /b *.mp4') do (
        set "video=%%i"
    )
) else (
    @REM echo multiple video files found, Exiting!!!
    @REM pause
    @REM goto :EOF
    @REM echo.
    echo found %count% videos
    echo.
    echo please enter the name of the video you want to use
    echo.

    call getVideoName.bat

    echo video name: %videoName%
    pause

    @REM for /f "delims=" %%i in ('dir /b *.mp4') do (
    @REM     echo %%i
    @REM )

    @REM echo.

    @REM video name might contain spaces
    @REM set /p video= video name: 
    
    @REM echo %video%
    @REM pause
    @REM exit

    if not exist "%video%" (
        echo.
        echo video not found
        echo exiting
        pause
        goto :EOF
    ) else (
        echo.
        echo video found
        pause
        set "videoPath=%cd%\%video%"
    )
)



for /f "skip=1 tokens=*" %%i in ('wmic process where "name='RiotClientServices.exe'" get ExecutablePath') do (
    set "path=%%i"
    goto :done
)

:done

set videoPath=%cd%\%video%

@REM echo %path%
@REM pause
@REM exit

for %%a in ("%path%") do set "path=%%~dpa"
for /f "tokens=1 delims=\" %%a in ("%path%") do set "driveLetter=%%a"

%driveLetter%
cd %path%
cd ..
cd "VALORANT\live\ShooterGame\Content\Movies\Menu"


for /f "delims=" %%i in ('dir /b *.mp4') do (
    set "mp4File=%%i"
)

@REM rename "%mp4File%" "%mp4File%.bak"

echo copying "%videoPath%" "%cd%\%mp4File%"
pause

copy "%videoPath%" "%cd%\%mp4File%"
pause