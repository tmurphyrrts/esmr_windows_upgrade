$tempDirZip = "C:\Windows\Temp\Win10Upgrade.zip"
$tempDir = "C:\Windows\Temp\Win10Upgrade"
$fuDir = "C:\_Windows_FU"

if (Test-Path $tempDirZip) {
    Remove-Item -Path $tempDirZip -Recurse -Force
}

if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force
}

if (Test-Path $fuDir) {
    Remove-Item -Path $fuDir -Recurse -Force
}
Unregister-ScheduledTask -TaskName "Cleanup Windows Upgrade Files"
Set-ExecutionPolicy Restricted