@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
title Super3DXPlus-NX - Nintendo Switch Builder

echo ========================================================
echo         Super3DXPlus-NX - Nintendo Switch Setup
echo ========================================================
echo.

:: 1. Check Python
set "PY="
python --version >nul 2>&1 && set "PY=python"
if not defined PY py -3 --version >nul 2>&1 && set "PY=py -3"
if not defined PY if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set PY="%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
if not defined PY (
    echo [ERROR] Python 3 not found in PATH.
    echo Please install Python 3 from https://www.python.org/ ^(tick "Add python.exe to PATH"^)
    pause
    exit /b 1
)

:: 2. Check devkitPro
if not exist "C:\devkitPro\msys2\usr\bin\bash.exe" (
    echo [ERROR] devkitPro not found at C:\devkitPro\
    echo Make sure devkitPro is installed along with these packages:
    echo   switch-dev, switch-sdl2, switch-mesa, switch-zlib
    pause
    exit /b 1
)

:: 3. Get WMMT 3DX+ dump folder (supports drag-and-drop onto the .bat or into the window)
set "DUMP_DIR=%~1"
if defined DUMP_DIR goto CHECK_DUMP

:ASK_DUMP
echo Enter the path to your WMMT 3DX+ arcade dump folder ^(contains 'main' and 'data'^)
echo Tip: You can DRAG ^& DROP the folder into this window and press Enter.
echo.
set /p "DUMP_DIR=Dump Folder: "
set "DUMP_DIR=%DUMP_DIR:"=%"

:CHECK_DUMP
if "%DUMP_DIR%"=="" goto ASK_DUMP
if not exist "%DUMP_DIR%\main" (
    echo.
    echo [ERROR] 'main' file not found in: "%DUMP_DIR%"
    echo Please make sure you selected a valid WMMT 3DX+ dump folder.
    echo.
    set "DUMP_DIR="
    goto ASK_DUMP
)

echo.
echo [1/4] Checking Zig ^(C++ demangler for physics recompiler^)...
if not exist ".super3dx\zig\zig.exe" (
    %PY% build.py setup-zig
    if errorlevel 1 (
        echo [ERROR] Failed to install Zig.
        pause
        exit /b 1
    )
) else (
    echo Zig is already installed, continuing...
)

echo.
echo [2/4] Generating assets and physics ^(--phys^)...
echo ^(This may take a few minutes, please wait^)
%PY% tools/pipeline.py gen "%DUMP_DIR%" --phys
if errorlevel 1 (
    echo [ERROR] Failed at pipeline.py gen --phys.
    pause
    exit /b 1
)

echo.
echo [3/4] Compiling Nintendo Switch NRO...
%PY% build.py switch
if errorlevel 1 (
    echo [ERROR] Failed to compile Switch NRO.
    pause
    exit /b 1
)

echo.
echo [4/4] Preparing SD Card output folder...
set "OUT_DIR=output-switch\switch\super3dx+nx"
if not exist "%OUT_DIR%\data" mkdir "%OUT_DIR%\data"

if not exist "platform\switch\super3dx+nx.nro" (
    echo [ERROR] Compiled NRO not found at platform\switch\super3dx+nx.nro
    pause
    exit /b 1
)

copy /Y "platform\switch\super3dx+nx.nro" "%OUT_DIR%\super3dx+nx.nro" >nul
xcopy /E /I /Y "data" "%OUT_DIR%\data" >nul

if not exist "%OUT_DIR%\data\menu.bin" (
    echo.
    echo [WARNING] data\menu.bin was not found in the output folder!
    echo           The game will not boot without menu.bin from a complete 3DX+ dump.
)

echo.
echo ========================================================
echo DONE! Nintendo Switch build completed successfully.
echo.
echo Copy the contents of:
echo   %CD%\output-switch\
echo directly to the root of your Switch SD Card ^(sdmc:/^).
echo ========================================================
echo.
pause
