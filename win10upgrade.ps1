$dir = 'C:\_Windows_FU\packages'
mkdir $dir
$webClient = New-Object System.Net.WebClient
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
$file = "$dir\Win10Upgrade.exe"
$webClient.DownloadFile($url,$file)
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /NoReboot /copylogs $dir /showoobe none'

#Create scheduled job for cleanup
$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
$options = New-ScheduledJobOption -RunElevated
Register-ScheduledJob -Filepath "C:\Windows\Temp\Win10Upgrade\esmr_windows_upgrade-master\cleanup.ps1" -Trigger $trigger -ScheduledJobOption $options -Name "Cleanup Windows Upgrade Files"