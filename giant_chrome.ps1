#$chromePath = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
#$params = '/high-dpi-support=1.75 /force-device-scale-factor=1.75'

#$params = $params.Split(" ")
#& "$chromePath" $Prms

$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)

$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Desktop”,$true)