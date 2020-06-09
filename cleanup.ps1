$tempDirZip = "C:\Windows\Temp\Win10Upgrade.zip"
$tempDir = "C:\Windows\Temp\Win10Upgrade"
$fuDir = "C:\_Windows_FU"

#Remove directories and all files in them that were created as part of the update
if (Test-Path $tempDirZip) {
    Remove-Item -Path $tempDirZip -Recurse -Force
}

if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force
}

if (Test-Path $fuDir) {
    Remove-Item -Path $fuDir -Recurse -Force
}

Unregister-ScheduledJob -Name "Cleanup Windows Upgrade Files" #Remove the scheduled cleanup job
Set-ExecutionPolicy Restricted #Sets the Powershell script execution policy back to 'restricted'