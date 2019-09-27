$chromePath = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
$params = '/high-dpi-support=1.75 /force-device-scale-factor=1.75'

$params = $params.Split(" ")
& "$chromePath" $Prms