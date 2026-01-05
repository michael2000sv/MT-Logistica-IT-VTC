@echo off
SETLOCAL

:: Aggiungi Node.js portatile al PATH
set "PATH=c:\Users\bagni\Desktop\node-v25.2.1-win-x64;%PATH%"

:: Controlla se Node.js e installato
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ERRORE: Node.js non trovato! Installalo da https://nodejs.org/it/download/
    pause
    exit /b
)

:: Vai nella cartella del client
cd /d "%~dp0"

:: Installa dipendenze
echo Installazione dipendenze...
call npm install

:: Chiedi cosa fare
echo.
echo Seleziona opzione:
echo 1. Avvia client in modalita sviluppo
echo 2. Genera installer .exe
set /p scelta=Digita 1 o 2 e premi Invio:

IF "%scelta%"=="1" (
    echo Avvio client in modalita sviluppo...
    call npm start
) ELSE IF "%scelta%"=="2" (
    echo Generazione installer .exe...
    call npm run dist
) ELSE (
    echo Opzione non valida.
)

pause
ENDLOCAL
