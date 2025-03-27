#RenameWorkstation.ps1
#v0.1.2 - 3/27/2025
#Created by Jonathan Edwards
#Renames workstation for Dell computers based on laptop v desktop and serialnumber.


#Rename Workstation
$serialTag = (Get-WmiObject -class win32_bios).SerialNumber

if (((Get-Computerinfo).CsPCSystemType) -eq "Desktop") {
	Rename-Computer -NewName ("D" + $serialTag + "-D")

  	#TEST
  	Set-Content -Path "C:\Deployment\RenameWorkstationAttempt.txt" -Value ("We tried to rename the workstation: D" + $serialTag + "-D")
}
else {
	Rename-Computer -New Name ("D" + $serialTag + "-L")

 	#Test
  	Set-Content -Path "C:\Deployment\RenameWorkstationAttempt.txt" -Value ("We tried to rename the workstation: D" + $serialTag + "-L")
}
