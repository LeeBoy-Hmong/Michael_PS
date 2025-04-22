# Stopping all of the services that run Windows Update
Stop-Service -Name BITS
Stop-Service -Name CryptSvc
Stop-Service -Name wuauserv
Stop-Service -Name AppIDSvc
Stop-Service -Name wscsvc
Stop-Service -Name TrustedInstaller -Force -ErrorAction SilentlyContinue  # For services that may not exist in all builds

# Removing the Update Cache

Remove-Item -Path "C:\Windows\SoftwareDistribution\*" -Recurse -Force
Remove-Item -Path "C:\Wndows\System32\catroot2\*" -Recurse -Force

# Starting all of the services that run Windows Update
Start-Service -Name BITS
Start-Service -Name CryptSvc
Start-Service -Name wuauserv
Start-Service -Name AppIDSvc
Start-Service -Name wscsvc
Start-Service -Name TrustedInstaller -ErrorAction SilentlyContinue