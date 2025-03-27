#StartUpScript.ps1
#v0.1.2 - 3/27/2025
#Created by Jonathan Edwards
#Creates Scheduled Task that run on system startup.

#Create Scheduled Task
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"C:\StartUpScript.ps1`""
$trigger = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask Deployment -InputObject $task

#Download StartUpScript.ps1
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ParadoxEngineer1/DeploymentTest/refs/heads/main/StartUpScript.ps1 -OutFile "C:\StartUpScript.ps1"

#Run StartUpScript.ps1
& "C:\StartUpScript.ps1"
