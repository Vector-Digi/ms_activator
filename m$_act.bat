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
set /p kms_server=Set KMS Server:
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo 1.Windows 10 Pro
echo 2.Windows Server 2019 Datacenter
echo 3.MS Office 2016
echo 4.Quit
echo.
set /p sle=Select to activate:
if %sle%==1 goto win10
if %sle%==2 goto winserver2019
if %sle%==3 goto office16
if %sle%==4 goto end
else goto menu
:win10
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms %kms_server%
slmgr /ato
echo All done, enjoy!!
pause
goto menu
:winserver2019
slmgr /ipk WMDGN-G9PQG-XVVXX-R3X43-63DFG
slmgr /skms  %kms_server%
slmgr /ato
echo All done, enjoy!!
:office16
if exist C:\Program Files\Microsoft Office\Office16\ospp.vbs (
    cd C:\Program Files\Microsoft Office\Office16\
    cscript ospp.vbs /sethst: %kms_server%
    cscript ospp.vbs /act
    echo All done, enjoy!!
) else ( echo Office is not installed correctly )
pause
goto menu
