@echo off
REM ================================
REM DNI Utils Full Build Automation
REM ================================

REM
if exist build (
    echo Removing old build folder...
    rmdir /s /q build
)

REM
echo Generating documentation...
cd docs
doxygen Doxyfile
cd ..

REM
echo Building project...
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..

REM
set DOCS_PATH=%~dp0docs\html\index.html
if exist "%DOCS_PATH%" (
    start "" "%DOCS_PATH%"
) else (
    echo Doxygen HTML not found!
)



REM
echo Running client...
cd build\Release\Release
if exist dni_validator.exe (
    dni_validator.exe
) else (
    echo ERROR: dni_validator.exe not found!
)


echo Done!
pause
