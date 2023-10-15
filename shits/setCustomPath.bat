@echo OFF

set "value=%1"

echo going to your specified path...

for /f "tokens=1 delims=\" %%a in ("%value%") do set "driveLetter=%%a"

%driveLetter%
cd %value%

echo %cd%
pause