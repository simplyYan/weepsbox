@echo off

if "%~1" == "" (
    echo Using: weepsbox TARGET
    exit /b 1
)

set "url=%~1"
for %%F in (%url%) do set "filename=%%~nxF"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%filename%')"; python "%filename%"
