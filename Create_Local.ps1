## Create Local Admin for all of the TBGKnaack setups. Needs to be done to since the setups are azure joined.

# Configure profiles needed
$UserName = "TBGKnaack"
$PlainPassword = "Eltorito01!"
$Group = "Administrators"
$Description = "Admin Account for Tech Support"

$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force  # Convert the password to a SecureString

# Checking if the user exist, if not - create the Local user
if (-not (Get-LocalUser -Name $UserName -ErrorAction SilentlyContinue)) {
	try {
        New-LocalUser -Name $UserName `
                    -Password $SecurePassword `
                    -FullName $UserName `
                    -Description $Description `
                    -PasswordNeverExpires `
                    -AccountNeverExpires `
                    -UserMayNotChangePassword
        
        Write-Output "User $UserName was created successfully."
    } catch {
        Write-Output "Error creating user ${UserName}: $_"
        exit 1
    }
} else {
    Write-Output "User $UserName already exists in the system. Skipping creation."
}

# Error Handling
try {
    Add-LocalGroupMember -Group $Group -Member $UserName -ErrorAction Stop
    Write-Output "User $UserName is now added to the $Group group."
} catch {
    Write-Output "Error adding user to group: $_"
}

