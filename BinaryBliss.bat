@echo off

color 0a

echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo "      _______  _               ______   _                                   "
echo "     (_______)| |             (____  \ (_)                                  "
echo "         _    | |__   _____    ____)  ) _  ____   _____   ____  _   _       "
echo "        | |   |  _ \ | ___ |  |  __  ( | ||  _ \ (____ | / ___)| | | |      "
echo "        | |   | | | || ____|  | |__)  )| || | | |/ ___ || |    | |_| |      "
echo "        |_|   |_| |_||_____)  |______/ |_||_| |_|\_____||_|     \__  |      "
echo "                                                               (____/       "
echo "                         ______   _   _                                     "
echo "                        (____  \ | | (_)                                    "
echo "                         ____)  )| |  _   ___   ___                         "
echo "                        |  __  ( | | | | /___) /___)                        "
echo "                        | |__)  )| | | ||___ ||___ |                        "
echo "                        |______/  \_)|_|(___/ (___/                         "
echo "                                                                            "
echo """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set launchable=1

set "processName=RiotClientServices.exe"

tasklist /fi "ImageName eq %processName%" /fo csv 2>NUL | find /I "%processName%">NUL

if not "%ERRORLEVEL%"=="0" (
    echo.
    call shits\launchRiotClient.bat
)

for /f "delims=" %%i in ('dir /b /a-d *.mp4 ^| find /v /c ""') do (
    set "count=%%i"
)

set "myDir=%cd%"
set "myShits=%cd%\shits"

cd shits
echo.
call getVideoFilePath.bat

cd ..
call shits\setNewVideo.bat %count%

echo %myDir%\%videoName%

copy "%myDir%\%videoName%" "%videoFilePath%"
echo.
echo Done!!!
echo.

call shits\findValorant.bat