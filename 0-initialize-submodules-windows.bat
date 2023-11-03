@echo off
setlocal

REM Initialize submodules
git submodule init

REM Update submodules
git submodule update

echo Script has been completed successfully
pause
