@echo off

setlocal EnableDelayedExpansion



@REM set "useCustomPath=1" to use a custom path else it will use the default path

set "useCustomPath=0" & @REM 0 is for false and 1 is for true (basic boolean stuff)

@REM copy and paste your custom path here
set "customPath=K:\Riot Games\VALORANT\live\ShooterGame\Content\Movies\Menu"

@REM example: set "customPath=C:\Riot Games\VALORANT\live\ShooterGame\Content\Movies\Menu"




@REM do not edit below this line

if "%useCustomPath%"=="1" (
    if "%customPath%"=="" (
        set "useCustomPath=0"
        set "path=null"
    ) else (
        set "path=%customPath%"
    )
) else (
    set "path=null"
)

endlocal & set "path=%useCustomPath%=%path%"