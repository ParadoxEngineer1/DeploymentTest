#This can be deleted with no issues

New-Item -ItemType File -Name "ProvisioningTest.txt" -Path "C:\"
Set-Content -Path "C:\ProvisioningTest.txt" -Value "Hello World"
