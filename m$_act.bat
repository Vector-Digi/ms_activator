@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
title m$_activator
:menu
cls
:::  __  __  _       _        _   _            _
::: |  \/  || |     / \   ___| |_(_)_   ____ _| |_ ___  _ __
::: | |\/| / __)   / _ \ / __| __| \ \ / / _` | __/ _ \| '__|
::: | |  | \__ \  / ___ \ (__| |_| |\ V / (_| | || (_) | |
::: |_|  |_(   / /_/   \_\___|\__|_| \_/ \__,_|\__\___/|_|
:::         |_|                       Powered by Vector Di-gi
::: =========================================================
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo 1.Windows 10 Pro
echo 2.MS Office 2016
echo 3.Quit
echo.
set /p sle=Select to activate:
if %sle%==1 goto win10
if %sle%==2 goto office16
if %sle%==3 goto end
else goto menu
:win10
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms vectordigi.tk
slmgr /ato
echo All done, enjoy!!
pause
goto menu
:office16
if exist C:\Program Files\Microsoft Office\Office16\ospp.vbs (
    cscript C:\Program Files\Microsoft Office\Office16\ospp.vbs /sethst:vectordigi.tk
    cscript C:\Program Files\Microsoft Office\Office16\ospp.vbs /act
) else ( echo Office is not installed correctly )
echo All done, enjoy!!
pause
goto menu