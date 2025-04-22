


# Define the Domain that is being joined
$Domain = "BergDrywall.local"
$Username = "BergDrywall\\TBGAdmin"
$Password = "Eltorito01!"

# Create secure credential object for user
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force  # Securing your $Password variable
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)

# Path of joined computer to Active Directory
$OUPath = "OU=Computers,OU=The Berg Group,DC=BergDrywall,DC=local"  # Put your path here where the device will be assigned to

# Join the Domain with current name of device hostname created
try {
    Add-Computer -DomainName $Domain -Credential $Credential -OUPath $OUPath -Restart -Force
    Write-Output "You've succesfully joined $env:COMPUTERNAME to $Domain. Your computer will now reboot"
}
catch {
    Write-Output "Failed to join the domain: $($_.Exception.Message)"
}
