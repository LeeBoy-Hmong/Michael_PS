$svc = 'CatoNetworksVPNServices'
Set-Service -Name $svc -StartupType Automatic
Start-Service -Name $svc
