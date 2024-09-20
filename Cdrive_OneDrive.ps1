# Selecting all the variables that'll move to OneDrive
$Main_dir = @{
    Desktop = "Env:\USERPROFILE\Desktop"  # Env: is utilize to keep directories universal
    Documents = "Env:\USERPROFILE\Documents"
    Downloads = "Env:\USERPROFILE\Downloads"
}

$OneDrive = "Env:OneDrive"

# Running a loop that'll iterate through each of the directories and the values
ForEach ($dir in $Main_dir.GetEnumerator()) {
    $sources = $dir.Value  # The sources that are moving are the values within the three main directories above
    $destination = "$OneDrive\$($dir.Key)"  # The final destination is going to be at OneDrive (Key = label of )
}

# Initiating Robocopy with "Start-Process" cmdlet to my script
Start-Process Robocopy "$sources" "$destination" /e /copyall  # Utilizing Robocopy like '/e' copies all subdirectories including empty ones, '/copyall/ ensures all file information is copied
