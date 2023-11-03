@echo off

if not defined launchable (
    echo This file is not meant to be run directly
    pause
    goto :EOF
)

del %1

echo // This is a simple txt file where you can specify your paths if you are having some trouble with the script>>%1
echo // Set "default" or "0" for default values>>%1
echo // Don't remove the quotes write the path between those quotes>>%1
echo.>>%1
echo // Example: valorant_folder="C:\Riot Games\VALORANT">>%1
echo valorant_folder="default">>%1
echo.>>%1
echo valorant_shortcut="default">>%1
echo.>>%1
echo // there is no need of adding valorant_shortcut if you have shortcut on your desktop>>%1