@echo off &setlocal

if not defined launchable (
    echo This file is not meant to be run directly
    pause
    goto :EOF
)

set "search=%1"
set "replace=%2"
set "textfile=path.txt"
set "newfile=Output.txt"
(for /f "delims=" %%i in (%textfile%) do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    echo(!line!
    endlocal
))>"%newfile%"
del %textfile%
rename %newfile%  %textfile%
