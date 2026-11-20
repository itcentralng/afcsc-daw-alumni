@echo off
setlocal

rem Run once on the kiosk PC to create a Desktop shortcut.
set "SCRIPT_DIR=%~dp0"
set "TARGET_BAT=%SCRIPT_DIR%run.bat"
set "SHORTCUT_NAME=DAW Alumni.lnk"
set "SHORTCUT_PATH=%USERPROFILE%\Desktop\%SHORTCUT_NAME%"
set "VBS_PATH=%TEMP%\daw_alumni_shortcut.vbs"
set "EDGE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=C:\Program Files\Microsoft\Edge\Application\msedge.exe"

if not exist "%TARGET_BAT%" (
  echo.
  echo Could not find run.bat next to this script.
  echo Keep prepare.bat in the same folder as run.bat and try again.
  echo.
  pause
  exit /b 1
)

echo Creating a Desktop shortcut for DAW Alumni...
> "%VBS_PATH%" echo Set oWS = WScript.CreateObject("WScript.Shell")
>> "%VBS_PATH%" echo Set oLink = oWS.CreateShortcut("%SHORTCUT_PATH%")
>> "%VBS_PATH%" echo oLink.TargetPath = "%COMSPEC%"
>> "%VBS_PATH%" echo oLink.Arguments = "/C ""%TARGET_BAT%"""
>> "%VBS_PATH%" echo oLink.WorkingDirectory = "%SCRIPT_DIR%"
>> "%VBS_PATH%" echo oLink.WindowStyle = 7
>> "%VBS_PATH%" echo oLink.IconLocation = "%EDGE%"
>> "%VBS_PATH%" echo oLink.Description = "Launch the Department of Air Warfare alumni kiosk"
>> "%VBS_PATH%" echo oLink.Save

cscript //nologo "%VBS_PATH%"
del "%VBS_PATH%" >nul 2>&1

if exist "%SHORTCUT_PATH%" (
  echo.
  echo Done. A shortcut called "%SHORTCUT_NAME%" is now on the Desktop.
  echo.
  echo To keep it on the taskbar too, right-click that shortcut and choose
  echo "Pin to taskbar", or drag it onto the taskbar. Windows does not allow
  echo that last step to be done by a script, so it has to be one manual click.
) else (
  echo.
  echo Something went wrong and the shortcut was not created.
  echo You can still run the app directly by double-clicking run.bat.
)

echo.
pause
endlocal
