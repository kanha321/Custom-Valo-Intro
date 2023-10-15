@echo off
setlocal enabledelayedexpansion

set "variable=%1"
cd ..
set "file=%cd%\path.txt"

set "found="
for /f "tokens=1,2 delims==""" %%a in ('findstr /i %variable% %file%') do (
    if /i "%%a"=="%variable%" (
        set "value=%%b"
        set "found=1"
        echo !value!
    )
)

if not defined found (
    echo.
    echo you probably messed up with the path.txt file
    echo recreating path.txt file...
    echo.
    echo try again, and this time dont change variable name
    call shits/recreatePathTxt.bat %file%
    pause
    exit
)
cd shits
endlocal & set "value=%value%"