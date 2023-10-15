@echo off

call shits\readvar valorant_shortcut

set "path=%value%"
if not %path%=="default" (
    if not %path%=="0"  (
        set "path=!path:~1,-1!"

        echo Found Custom Shortcut Path: %path%
        echo.
        if exist %path%\VALORANT.lnk (
            set "shortCutPath=%path%\VALORANT.lnk"
            goto :launchValorant
        ) else (
            echo.
            echo VALORANT shortCut not found
            echo.
            echo Please set the correct path
            pause
            start notepad %myDir%\path.txt
            exit
        )
    )
)

echo Finding VALORANT shortCut...
echo.
if exist "C:\Users\%username%\Desktop\VALORANT.lnk" (
    @REM echo VALORANT shortCut found at admin desktop
    set "shortCutPath=C:\Users\%username%\Desktop\VALORANT.lnk"
) else if exist "C:\Users\Public\Desktop\VALORANT.lnk" (
    @REM echo VALORANT shortCut found at public desktop
    set "shortCutPath=C:\Users\Public\Desktop\VALORANT.lnk"
) else (
    echo VALORANT shortCut not found
    echo.
    echo Unable to launch valorant 
    echo You can do this mannually by "play" button on riot client or from shortcut
    echo.
    pause
    exit
)

:launchValorant

echo Launching VALORANT...
pause
start "" "%shortCutPath%"