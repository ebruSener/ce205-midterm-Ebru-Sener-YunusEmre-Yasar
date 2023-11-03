@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

setlocal enableextensions enabledelayedexpansion

cd /d "%~dp0"

:: Check if Chocolatey is installed
echo Checking if Chocolatey is installed...
if exist "%ProgramData%\Chocolatey\bin\choco.exe" (
    echo Chocolatey is already installed.
) else (
    echo Installing Chocolatey...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    if errorlevel 1 (
        echo Failed to install Chocolatey.
        goto :end
    )
    echo Chocolatey installed successfully.
)

:: Check if Scoop is installed
echo Checking if Scoop is installed...
where scoop >nul 2>&1
if !errorlevel! == 0 (
    echo Scoop is already installed.
) else (
    echo Scoop is not installed. Installing Scoop...
    powershell -Command "Set-ExecutionPolicy RemoteSigned -scope CurrentUser"
    powershell -Command "irm get.scoop.sh -outfile 'install.ps1'"
    powershell -Command ".\install.ps1 -RunAsAdmin"
    if errorlevel 1 (
        echo Failed to install Scoop.
        goto :end
    )
    del install.ps1
    echo Scoop installed successfully.
)

:end
pause
