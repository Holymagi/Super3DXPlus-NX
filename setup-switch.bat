@echo off
setlocal enabledelayedexpansion
title Super3DX+ NX - Nintendo Switch Builder

echo ========================================================
echo          Super3DX+ NX - Nintendo Switch Setup
echo ========================================================
echo.

:: 1. Cek Python
where python >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python tidak ditemukan di PATH.
    echo Silakan install Python 3 terlebih dahulu dari https://www.python.org/
    pause
    exit /b 1
)

:: 2. Cek devkitPro
if not exist "C:\devkitPro\msys2\usr\bin\bash.exe" (
    echo [ERROR] devkitPro tidak ditemukan di C:\devkitPro\
    echo Pastikan devkitPro sudah terinstall beserta paket:
    echo   switch-dev, switch-sdl2, switch-mesa, switch-zlib
    pause
    exit /b 1
)

:: 3. Minta folder dump WMMT 3DX+
:ASK_DUMP
echo Masukkan path folder dump WMMT 3DX+ (yang berisi file 'main' dan folder 'data')
echo Tips: Kamu bisa langsung DRAG ^& DROP foldernya ke jendela ini lalu tekan Enter.
echo.
set /p "DUMP_DIR=Folder Dump: "
set "DUMP_DIR=%DUMP_DIR:"=%"

if "%DUMP_DIR%"=="" goto ASK_DUMP
if not exist "%DUMP_DIR%\main" (
    echo.
    echo [ERROR] File 'main' tidak ditemukan di: "%DUMP_DIR%"
    echo Pastikan kamu memilih folder dump 3DX+ yang benar.
    echo.
    goto ASK_DUMP
)

echo.
echo [1/4] Mengecek Zig (C++ demangler untuk recompiler fisika)...
if not exist ".super3dx\zig\zig.exe" (
    python build.py setup-zig
    if errorlevel 1 (
        echo [ERROR] Gagal menginstall Zig.
        pause
        exit /b 1
    )
) else (
    echo Zig sudah terinstall, lanjut...
)

echo.
echo [2/4] Men-generate aset dan fisika (--phys)...
echo (Proses ini memakan waktu beberapa menit, mohon tunggu)
python tools/pipeline.py gen "%DUMP_DIR%" --phys
if errorlevel 1 (
    echo [ERROR] Gagal pada tahap pipeline.py gen --phys.
    pause
    exit /b 1
)

echo.
echo [3/4] Meng-compile Nintendo Switch NRO...
python build.py switch
if errorlevel 1 (
    echo [ERROR] Gagal compile Switch NRO.
    pause
    exit /b 1
)

echo.
echo [4/4] Menyiapkan folder siap salin ke SD Card...
set "OUT_DIR=output-switch\switch\super3dx+nx"
if not exist "%OUT_DIR%\data" mkdir "%OUT_DIR%\data"

copy /Y "platform\switch\super3dx+nx.nro" "%OUT_DIR%\super3dx+nx.nro" >nul
xcopy /E /I /Y "data" "%OUT_DIR%\data" >nul

echo.
echo ========================================================
echo SELESAI! Build Nintendo Switch berhasil dibuat.
echo.
echo Salin isi folder:
echo   %CD%\output-switch\
echo langsung ke root SD Card Switch kamu (sdmc:/).
echo ========================================================
echo.
pause