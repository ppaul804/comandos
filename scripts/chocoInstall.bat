@echo off
chcp 65001

@REM Checagem por permissões
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo ===============================================================================
    echo Requisitando privilégios de administrador...
    echo ===============================================================================
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

WHERE choco
IF %ERRORLEVEL% NEQ 0 (
    echo ===============================================================================
    echo Você não tem instalado o Chocolatey em sua máquina. Continue para instalar.
    echo ===============================================================================
    pause
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    echo ===============================================================================
    echo Reexecute o script para continuar com a instalação
    echo ===============================================================================
    pause 
) ELSE (
    goto chocoInstall
)

:chocoInstall
    @REM ---Dev---
    @REM choco install openjdk8 openjdk vscode -vy
    @REM choco install nodejs nvm microsoft-teams forticlientvpn git docker-desktop robo3t postman notepadplusplus -vy
    @REM ---Informática---
    @REM choco install cpu-z hwmonitor crystaldiskinfo crystaldiskmark easybcd -vy
    @REM ---Banco de Dados---
    @REM choco install mysql mysql.workbench -vy
    @REM ---Navegadores---
    @REM choco install googlechrome firefox -vy
    @REM ---Mídia---
    @REM choco install k-litecodecpackfull mkvtoolnix vlc kdenlive obs-studio anyvideoconverter spotify -vy
    @REM ---Utilitários---
    @REM choco install 7zip revo-uninstaller bleachbit ccleaner defraggler speccy recuva k-litecodecpackfull kvirc keepassxc speedtest jdownloader whatsapp discord telegram zoom imgburn veracrypt megasync google-backup-and-sync protonvpn comicrack renamer utorrent dupeguru treesizefree aegisub screentogif -vy
    @REM ---Jogos---
    @REM choco install steam -vy
    choco upgrade all -vy
    echo ===============================================================================
    echo Lista de programas instalados:
    choco find -l
    echo ===============================================================================
    pause
