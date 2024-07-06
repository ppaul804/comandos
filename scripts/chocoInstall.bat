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
    @REM choco install jdk8 oraclejdk maven vscode jmeter -y
    @REM choco install intellijidea-ultimate -y
    @REM choco install openshift-cli jq minishift -y
    @REM choco install nodejs-lts nvm yarn -y
    @REM choco install dotnet visualstudio2019community -y
    @REM choco install jetbrains-rider -y
    @REM choco install microsoft-teams forticlientvpn vmware-horizon-client git git-fork docker-desktop robo3t studio3t postman soapui notepadplusplus drawio virtualbox -y
    @REM choco install awscli -y
    @REM ---Informática---
    @REM choco install cpu-z hwmonitor crystaldiskinfo crystaldiskmark easybcd rufus yumi h2testw reflect-free speedtest -y
    @REM ---Banco de Dados---
    @REM choco install datagrip -y
    @REM choco install dbeaver mysql.workbench -y
    @REM ---Navegadores---
    @REM choco install googlechrome firefox -y
    @REM ---Mídia---
    @REM choco install k-litecodecpackfull mkvtoolnix vlc kdenlive gimp obs-studio anyvideoconverter spotify scrcpy -y
    @REM ---Escritório---
    @REM choco adobereader pdf24 libreoffice MailViewer -y
    @REM ---Utilitários---
    @REM choco install powertoys 7zip revo-uninstaller qbittorrent teracopy bleachbit ccleaner defraggler speccy recuva kvirc keepassxc jdownloader whatsapp discord telegram zoom imgburn veracrypt googledrive protonvpn comicrack renamer utorrent dupeguru treesizefree aegisub screentogif balabolka macrocreator spacedesk-server eartrumpet -y
    @REM ---Jogos---
    @REM choco install steam msiafterburner lghub -y
    choco upgrade all -y
    echo ===============================================================================
    echo Lista de programas instalados:
    choco find -l
    echo ===============================================================================
    pause
