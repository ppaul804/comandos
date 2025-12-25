@echo off
echo Atualizando todos os aplicativos via winget...
winget upgrade --all --silent --include-unknown --accept-source-agreements --accept-package-agreements
echo.