if ( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}
$timeout = [datetime]::Now.AddMinutes( 5 );
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

while ( $true ) {
    if ( $exe | Test-Path ) {
        & $exe install Google.GoogleDrive Google.Chrome Mozilla.Firefox.pt-BR VideoLAN.VLC geeksoftwareGmbH.PDF24Creator 7zip.7zip JAMSoftware.TreeSize.Free KeePassXCTeam.KeePassXC --accept-package-agreements --accept-source-agreements --source winget --scope machine;
        return;
    }
    if ( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    Start-Sleep -Seconds 1;
}