@echo off
set source_folder=C:\Users\Suparaja\Documents\Test01
set backup_folder=Backup1
set zip_file=backup.zip

echo Source folder: %source_folder%
echo Backup folder: %backup_folder%

rem Check if source folder exists
if not exist "%source_folder%" (
  echo Source folder "%source_folder%" does not exist.
  exit /b 1
)

rem Create backup folder if it doesn't exist
if not exist "%backup_folder%" mkdir "%backup_folder%"

echo Copying files from source folder to backup folder...

rem Copy all files from source folder to backup folder
xcopy /s /e /i "%source_folder%\*" "%backup_folder%"

echo Files copied successfully.

rem Zip the backup folder using .NET Framework classes
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('%backup_folder%', '%zip_file%')"

echo Backup created and zipped successfully.

