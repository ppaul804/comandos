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
    @REM choco install openjdk8 openjdk maven vscode jmeter -y
    @REM choco install openshift-cli minishift -y
    @REM choco install nodejs-lts nvm yarn -y
    @REM choco install microsoft-teams forticlientvpn git git-fork docker-desktop robo3t postman notepadplusplus drawio virtualbox -y
    @REM choco install XAMPP-73 -y
    @REM ---Informática---
    @REM choco install cpu-z hwmonitor crystaldiskinfo crystaldiskmark easybcd rufus yumi h2testw -y
    @REM ---Banco de Dados---
    @REM choco install datagrip mysql.workbench -y
    @REM ---Navegadores---
    @REM choco install googlechrome firefox -y
    @REM ---Mídia---
    @REM choco install k-litecodecpackfull mkvtoolnix vlc kdenlive obs-studio anyvideoconverter spotify scrcpy -y
    @REM ---Utilitários---
    @REM choco install 7zip revo-uninstaller qbittorrent teracopy bleachbit ccleaner defraggler speccy recuva kvirc keepassxc jdownloader whatsapp discord telegram zoom imgburn veracrypt megasync google-backup-and-sync protonvpn comicrack renamer utorrent dupeguru treesizefree aegisub screentogif balabolka macrocreator -y
    @REM ---Jogos---
    @REM choco install steam -y
    choco upgrade all -vy
    echo ===============================================================================
    echo Lista de programas instalados:
    choco find -l
    echo ===============================================================================
    pause
