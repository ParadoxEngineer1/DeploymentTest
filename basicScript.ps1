#basicScript.ps1
#v0.1 - 3/7/2025
#Created by Jonathan Edwards
#Purpose is to collect and run basic scripts that should be run on all workstation inedependent of 
#company or parameters. Then to ask for company and call further scripts.

#Rename Workstation
$serialTag = (Get-WmiObject -class win32_bios).SerialNumber

if (((Get-Computerinfo).CsPCSystemType) -eq "Desktop")
{
	Rename-Computer -NewName ("D" + $serialTag + "-D")
}
else
{
	Rename-Computer -New Name ("D" + $serialTag + "-L")
}

#Turn off BitLocker
manage-bde C: -off

#Final shutdown to mark script completion.
shutdown /s /t 60
