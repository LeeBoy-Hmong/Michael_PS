$svc1 = 'CatoNetworksVPNService'
$svc2 = 'CatoNetworksDNSService'

Set-Service -Name $svc1 -StartupType Automatic
Set-Service -Name $svc2 -StartupType Automatic
Start-Service -Name $svc1
Start-Service -Name $svc2
