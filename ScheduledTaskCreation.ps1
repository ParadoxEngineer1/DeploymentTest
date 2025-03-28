#StartUpScript.ps1
#v0.1.6 - 3/27/2025
#Created by Jonathan Edwards
#Creates Scheduled Task that run on system startup.

#Create Deployment Scheduled Task
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"C:\StartUpScript.ps1`""
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask Deployment -InputObject $task

#Create Login Schedule Task
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"C:\LoginScript.ps1`""
$trigger = New-ScheduledTaskTrigger -AtLogon
$principal = New-ScheduledTaskPrincipal -UserID "$env:UserName" -LogonType Interactive -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask DeploymentLogin -InputObject $task

#Download StartUpScript.ps1
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ParadoxEngineer1/DeploymentTest/refs/heads/main/StartUpScript.ps1 -OutFile "C:\StartUpScript.ps1"

#Download LoginScript.ps1
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ParadoxEngineer1/DeploymentTest/refs/heads/main/LoginScript.ps1 -OutFile "C:\LoginScript.ps1"

#Wait for files to download
Start-Sleep -Seconds 5

#Run StartUpScript.ps1
& "C:\StartUpScript.ps1"
