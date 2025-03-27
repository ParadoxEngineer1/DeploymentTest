#StartUpScript.ps1
#v0.1.3 - 3/17/2025
#Created by Jonathan Edwards
#File to be loaded into non-login startup
#Checks existing logs, runs next script, cleans up and shutsdown

$LogFolder = "C:\Deployment"
$ScriptsRun = 0
$Company = "n\a"
$needsReboot = $false

function Run-Script {
	#Read log
	
	#Load $ScriptsRun and $Company
	
	#Load next script and check for reboot
	
	#Run script
}

#Check if Log folder exists
if (!(Test-Path -Path $LogFolder)) {
	#Create log and scripts
	New-Item -Path "C:\" -Name "Deployment" -ItemType "directory"
	New-Item -Path $LogFolder -Name "Scripts" -ItemType "directory"
	
	#Create status file with "0" for no scripts run
	Set-Content -Path "C:\Deployment\Status.txt" -Value "0"
	
	#Check which company needs to be use from user
	#Download script from GitHub & post in login startup for local VTech user
	Invoke-WebRequest -Uri https://raw.githubusercontent.com/ParadoxEngineer1/DeploymentTest/refs/heads/main/LoginScript.ps1 -OutFile "C:\Users\VTech\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\LoginScript.ps1"
	
	#User can now login to activate Login Startup script
} else {
	#doWhile reboot is not needed
	DO {
		$TotalScripts = (Get-ChildItem C:\Deployment\Scripts | Measure-Object).Count
		
		#Check if all scripts have run
		if ($ScriptsRun -ge $TotalScripts) {
			#Delete Deployement files
			#Remove-Item -Recurse -Force C:\Deployment
		
			#Final Shutdown Command
			#shutdown /s /t 0
		}
		
		#Load ScriptsRun
		$ScriptsRun = [Int](Get-Content -Path "C:\Deployment\ScriptLog.txt")[0]
	
		Run-Script | Out-file -FilePath ("C:\Deployment\ScriptLog\" + $ScriptsRun + ".txt")
		
		#TODO:Update ScriptsRun
		$ScriptsRun++
		Set-Content -Path "C:\Deployment\Status.txt" -Value $ScriptsRun
	} While (!($needsReboot))
	
 	#Reboot
 	#shutdown /s /r /t 10
}
