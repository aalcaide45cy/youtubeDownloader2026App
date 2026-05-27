@echo off
title YT Downloader Premium - Compilador EXE
echo ===================================================
echo   COMPILANDO YT DOWNLOADER PREMIUM A EJECUTABLE
echo ===================================================
echo.

:: 1. Activar el entorno virtual
if not exist .venv (
    echo [ERROR] No se encontro el entorno virtual .venv. 
    echo Por favor, ejecuta primero 'run.bat' para inicializarlo.
    echo.
    pause
    exit /b 1
)

call .venv\Scripts\activate
if %errorlevel% neq 0 (
    echo [ERROR] No se pudo activar el entorno virtual .venv.
    echo.
    pause
    exit /b 1
)

:: 2. Compilar con PyInstaller
echo [INFO] Iniciando la compilacion con PyInstaller...
echo Esto empaquetara el codigo y los archivos estaticos en un solo archivo .exe
echo.

pyinstaller --noconsole --onefile --add-data "static;static" --name "YT_Downloader_Premium" main.py

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Ocurrio un fallo durante la compilacion.
    echo.
    pause
    exit /b 1
)

echo.
echo ===================================================
echo   [EXITO] Compilacion completada con exito.
echo   El archivo ejecutable 'YT_Downloader_Premium.exe' 
echo   se encuentra en la carpeta 'dist/'.
echo ===================================================
echo.
pause
