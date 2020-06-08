$dir = 'C:\_Windows_FU\packages'
mkdir $dir
$webClient = New-Object System.Net.WebClient
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
$file = "$dir\Win10Upgrade.exe"
$webClient.DownloadFile($url,$file)
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /NoReboot /copylogs $dir /showoobe none'

#Create scheduled task for cleanup
$action = New-ScheduledTaskAction -Execute .\cleanup.ps1 
$trigger = New-ScheduledTaskTrigger -Once -At 3am

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Cleanup Windows Upgrade Files" -Description "One time cleanup of the files that were downloaded to upgrade Windows 10"