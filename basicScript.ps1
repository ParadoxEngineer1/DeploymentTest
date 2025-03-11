#basicScript.ps1
#v0.2.1 - 3/11/2025
#Created by Jonathan Edwards
#Purpose is to collect and run basic scripts that should be run on all workstation inedependent of 
#company or parameters. Then to ask for company and call further scripts.

#Log file for testing
Set-Content -Path "C:\ProvisioningTest.txt" -Value "Hello World"

#Rename Workstation
function set-WorkstationName {
	$serialTag = (Get-WmiObject -class win32_bios).SerialNumber

	if (((Get-Computerinfo).CsPCSystemType) -eq "Desktop") {
		Rename-Computer -NewName ("D" + $serialTag + "-D")
	}
	else {
		Rename-Computer -New Name ("D" + $serialTag + "-L")
	}
}

#Turn off BitLocker
function set-BitLocker {
	if ((Get-Service -Name "BFE).Status -eq "Running") {
 		manage-bde C: -off
	}
}

#Power settings
function set-PowerOptions {
	#Sleep after 60 minutes on battery
	powercfg /change standby-timeout-dc 60

	#Don't sleep on AC
	powercfg /change standby-timeout-ac 0

	#Don't timeout on battery
	powercfg /change monitor-timeout-dc 0

	#Timeout monitor after 60 minutes on AC
	powercfg /change monitor-timeout-ac 60
}

#Create Directory for Logs
New-Item -Path "C:\" -Name "Deployment" -ItemType "directory"

#Run Functions
set-WorkstationName | Out-file -FilePath "C:\Deployment\DeploymentLog1.txt"
set-BitLocker | Out-file -FilePath "C:\Deployment\DeploymentLog2.txt"
set-PowerOptions | Out-file -FilePath "C:\Deployment\DeploymentLog3.txt"

#Final shutdown to mark script completion.
shutdown /s /t 0
