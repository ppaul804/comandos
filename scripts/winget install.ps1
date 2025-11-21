# Configura para poder executar scripts na máquina
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "O script precisa ser executado como administrador. Execute o prompt de comando como administrador e execute o script novamente."
    exit
}
winget install IDRIX.VeraCrypt KeePassXCTeam.KeePassXC CPUID.CPU-Z CPUID.HWMonitor CrystalDewWorld.CrystalDiskInfo CrystalDewWorld.CrystalDiskMark Google.Chrome Mozilla.Firefox VideoLAN.VLC geeksoftwareGmbH.PDF24Creator Microsoft.PowerToys 7zip.7zip QBitTorrent.QBitTorrent --accept-package-agreements --accept-source-agreements --source winget
