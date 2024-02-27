@echo off

:: Stop AnyDesk service
sc stop AnyDesk

:: Delete file in Backup folder
del "C:\Users\Suparaja\Documents\Backup\Test 5.txt"


:: Start AnyDesk service
sc start AnyDesk
