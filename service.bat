@echo off

:: Stop AnyDesk service if it's running
sc query AnyDesk | find "STATE" | find "RUNNING" > nul
if %errorlevel% equ 0 (
    sc stop AnyDesk
)

:: Path to AnyDesk executable
set "AnyDeskPath=C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

pause

:: Delete file in Backup folder
del "C:\Users\Suparaja\Documents\Backup\Test 5.txt"


REM :: Start AnyDesk service
REM sc start AnyDesk
