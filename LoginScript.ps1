#LoginScript.ps1
#v0.1 - 3/20/2025
#Created by Jonathan Edwards
#Runs from Login Startup folder, checks company from user
#then downloads needed scripts.

#Company list to prompt user with
$prompt = @(
	"1. Airstreams"
	"2. St. John`'s"
	"3. VTech"
) -join " "

#Check user for company with full list of companies
$Company = Read-Host $prompt

#Download all basic scripts

#Workstation Rename Script
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ParadoxEngineer1/DeploymentTest/refs/heads/main/Basic%20Scripts/RenameWorkstation.ps1 -OutFile C:\Deployment\Scripts\0.ps1

#Download all company scripts
switch ($Company) {
		#Airstreams
		1 {
			#Invoke-WebRequest -Uri https://raw.githubwhatever -OutFile C:\Deployement\Scripts\1.ps1
		}
		#St. John's
		2 {
			#Invoke-WebRequest -Uri https://raw.githubwhatever -OutFile C:\Deployement\Scripts\1.ps1
		}
		#VTech
		3 {
			#Invoke-WebRequest -Uri https://raw.githubwhatever -OutFile C:\Deployement\Scripts\1.ps1
		}
}

#Wipe this file and place StartUpScript.ps1 into non-login place
#Remove-Item -Path "C:\Users\VTech\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\LoginScript.ps1"

#shutdown /s /f /r /t 0
