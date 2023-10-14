@echo off

echo Finding VALORANT shortCut...
echo.
if exist "C:\Users\%username%\Desktop\VALORANT.lnk" (
    echo VALORANT shortCut found at admin desktop
    set "shortCutPath=C:\Users\%username%\Desktop\VALORANT.lnk"
    echo.
) else if exist "C:\Users\Public\Desktop\VALORANT.lnk" (
    echo VALORANT shortCut found at public desktop
    set "shortCutPath=C:\Users\Public\Desktop\VALORANT.lnk"
    echo.
) else (
    echo VALORANT shortCut not found
    echo.
    echo Unable to launch valorant 
    echo You can do this mannually by "play" button on riot client or from shortcut
    echo.
    pause
    exit
)

echo launching VALORANT...
timeout /t 5
start "" "%shortCutPath%"