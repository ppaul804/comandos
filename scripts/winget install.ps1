# Configura para poder executar scripts na máquina
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "O script precisa ser executado como administrador. Execute o prompt de comando como administrador e execute o script novamente."
    exit
}
winget install CPUID.CPU-Z
winget install CPUID.HWMonitor
winget install CrystalDewWorld.CrystalDiskInfo
winget install CrystalDewWorld.CrystalDiskMark
winget install Google.Chrome
winget install Mozilla.Firefox
winget install VideoLAN.VLC
winget install Adobe.Acrobat.Reader.64-bit
winget install Microsoft.PowerToys
winget install 7zip.7zip
winget install QBitTorrent.QBitTorrent
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey não está instalado. Instalando..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco install -y veracrypt
choco install -y keepassxc 