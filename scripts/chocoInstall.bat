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
    @REM choco install jdk8 oraclejdk maven vscode jmeter -y7
    @REM choco install intellijidea-ultimate -y7
    @REM choco install openshift-cli jq minishift -y7
    @REM choco install nodejs-lts nvm yarn -y7
    @REM choco install dotnet visualstudio2019community -y7
    @REM choco install jetbrains-rider -y7
    @REM choco install microsoft-teams forticlientvpn vmware-horizon-client git git-fork docker-desktop robo3t studio3t postman soapui notepadplusplus drawio virtualbox -y7
    @REM choco install awscli -y7
    @REM ---Informática---7
    @REM choco install cpu-z hwmonitor crystaldiskinfo crystaldiskmark easybcd rufus yumi h2testw reflect-free speedtest -y7
    @REM ---Banco de Dados---7
    @REM choco install datagrip -y7
    @REM choco install dbeaver mysql.workbench -y7
    @REM ---Navegadores---7
    @REM choco install googlechrome firefox -y7
    @REM ---Mídia---7
    @REM choco install k-litecodecpackfull mkvtoolnix vlc kdenlive gimp obs-studio anyvideoconverter spotify scrcpy -y7
    @REM ---Escritório---7
    @REM choco adobereader pdf24 libreoffice MailViewer -y7
    @REM ---Utilitários---7
    @REM choco install 7zip revo-uninstaller qbittorrent teracopy bleachbit ccleaner defraggler speccy recuva kvirc keepassxc jdownloader whatsapp discord telegram zoom imgburn veracrypt google-backup-and-sync protonvpn comicrack renamer utorrent dupeguru treesizefree aegisub screentogif balabolka macrocreator spacedesk-server eartrumpet -y7
    @REM ---Jogos---7
    @REM choco install steam -y7
    choco upgrade all -y
    echo ===============================================================================
    echo Lista de programas instalados:
    choco find -l
    echo ===============================================================================
    pause
