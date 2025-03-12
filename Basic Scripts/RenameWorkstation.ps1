#Rename Workstation
$serialTag = (Get-WmiObject -class win32_bios).SerialNumber

if (((Get-Computerinfo).CsPCSystemType) -eq "Desktop") {
  Rename-Computer -NewName ("D" + $serialTag + "-D")
}
else {
	Rename-Computer -New Name ("D" + $serialTag + "-L")
}
