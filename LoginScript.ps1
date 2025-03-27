#LoginScript.ps1
#v0.2 - 3/20/2025
#Created by Jonathan Edwards
#Runs from Login Startup folder, checks company from user
#then downloads needed scripts.

#Company list to prompt user with

Add-Type -AssemblyName System.Windows.Forms
# Create Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Choose a Company"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"
# Create Label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Select an Company:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(90,20)
$form.Controls.Add($label)
# Create Buttons
$button1 = New-Object System.Windows.Forms.Button
$button1.Text = "Airstreams"
$button1.Location = New-Object System.Drawing.Point(50,60)
$button1.Add_Click({ $form.Tag = 1; $form.Close() })
$form.Controls.Add($button1)
$button2 = New-Object System.Windows.Forms.Button
$button2.Text = "St. John`'s"
$button2.Location = New-Object System.Drawing.Point(150,60)
$button2.Add_Click({ $form.Tag = 2; $form.Close() })
$form.Controls.Add($button2)
$button3 = New-Object System.Windows.Forms.Button
$button3.Text = "VTech"
$button3.Location = New-Object System.Drawing.Point(100,100)
$button3.Add_Click({ $form.Tag = 3; $form.Close() })
$form.Controls.Add($button3)
# Show Form
$form.ShowDialog()
# Output the selected option
Write-Host "You selected: $($form.Tag)"

$Company = $($form.Tag)


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
