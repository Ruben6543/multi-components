@echo off
REM ==============================================
REM Script para configurar proyecto DNI y generar docs
REM ==============================================

REM 
if not exist venv (
    python -m venv venv
    echo Entorno virtual creado
) else (
    echo Entorno virtual ya existe
)

REM 
call venv\Scripts\activate.bat

REM
pip install -r requirements.txt

REM 
if not exist docs (
    mkdir docs
)

REM 
start /B "" cmd /c "uvicorn app.main:app --reload > server.log 2>&1"

REM 
echo Esperando 5 segundos a que el servidor arranque...
timeout /t 5 > nul

REM
curl -o docs/openapi.json http://127.0.0.1:8000/openapi.json
echo JSON descargado en docs/openapi.json

REM
python app/convert.py

echo.
echo Proceso completado. Revisa la carpeta docs y el servidor sigue corriendo.
pause
