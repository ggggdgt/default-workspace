@echo off
rem Launcher for install-gh-cli.sh (the /wizard script).
rem This box has no system bash, so we locate a usable shell first.
chcp 65001 >nul
title GitHub CLI (gh) installer wizard
setlocal EnableExtensions

set "SCRIPT=%~dp0install-gh-cli.sh"
if not exist "%SCRIPT%" (
  echo Cannot find "%SCRIPT%"
  pause
  exit /b 1
)

set "SH="
if not defined SH if exist "%ProgramFiles%\Git\bin\bash.exe" set "SH=%ProgramFiles%\Git\bin\bash.exe"
if not defined SH if exist "%ProgramFiles(x86)%\Git\bin\bash.exe" set "SH=%ProgramFiles(x86)%\Git\bin\bash.exe"
if not defined SH if exist "%ProgramFiles%\Git\usr\bin\bash.exe" set "SH=%ProgramFiles%\Git\usr\bin\bash.exe"
if not defined SH if exist "%LOCALAPPDATA%\Programs\Git\bin\bash.exe" set "SH=%LOCALAPPDATA%\Programs\Git\bin\bash.exe"
if not defined SH if exist "%LOCALAPPDATA%\OpenClaw\deps\portable-git\usr\bin\sh.exe" set "SH=%LOCALAPPDATA%\OpenClaw\deps\portable-git\usr\bin\sh.exe"

if not defined SH (
  echo No bash/sh found on this machine.
  echo Install Git for Windows first:  winget install --id Git.Git -e
  echo Then run this file again.
  pause
  exit /b 1
)

echo Using shell: %SH%
echo.
"%SH%" "%SCRIPT%"
echo.
pause
