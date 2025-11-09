@echo off
REM =========================================
REM DNI Utils Full Build Automation - Java
REM =========================================

REM
if exist out (
    echo Removing old 'out' folder...
    rmdir /s /q out
)
if exist docs\javadoc (
    echo Removing old 'docs/javadoc' folder...
    rmdir /s /q docs\javadoc
)

REM
echo.
echo Compiling DniUtils.java...
mkdir out
javac -d out lib\src\main\java\com\example\DNIUtils.java
if %errorlevel% neq 0 (
    echo ERROR: Compilation of DNIUtils.java failed!
    exit /b 1
)

REM
echo.
echo Compiling Main.java...
javac -d out -cp out client\Main.java
if %errorlevel% neq 0 (
    echo ERROR: Compilation of Main.java failed!
    exit /b 1
)

REM
echo.
echo Generating Javadoc...
mkdir docs\javadoc
javadoc -d docs\javadoc lib\src\main\java\com\example\DNIUtils.java client\Main.java
if %errorlevel% neq 0 (
    echo ERROR: Javadoc generation failed!
    exit /b 1
)

REM
set DOCS_PATH=%~dp0docs\javadoc\index.html
if exist "%DOCS_PATH%" (
    echo Opening Javadoc documentation...
    start "" "%DOCS_PATH%"
) else (
    echo WARNING: Javadoc index.html not found!
)

REM
echo.
echo Running client...
echo ================================
java -cp out Main
echo ================================

echo.
echo Build completed successfully!
pause
