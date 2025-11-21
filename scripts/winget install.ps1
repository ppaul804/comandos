# Configura para poder executar scripts na máquina
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "O script precisa ser executado como administrador. Execute o prompt de comando como administrador e execute o script novamente."
    exit
}
winget install IDRIX.VeraCrypt KeePassXCTeam.KeePassXC CPUID.CPU-Z CPUID.HWMonitor CrystalDewWorld.CrystalDiskInfo CrystalDewWorld.CrystalDiskMark Google.Chrome Mozilla.Firefox VideoLAN.VLC geeksoftwareGmbH.PDF24Creator Microsoft.PowerToys 7zip.7zip QBitTorrent.QBitTorrent --accept-package-agreements --accept-source-agreements --source winget
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey não está instalado. Instalando..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
choco install -y veracrypt
choco install -y keepassxc 