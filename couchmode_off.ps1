$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)

$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)

$RegCursors.SetValue(“”,””)

$RegCursors.SetValue(“AppStarting”,””)

$RegCursors.SetValue(“Arrow”,””)

$RegCursors.SetValue(“Crosshair”,””)

$RegCursors.SetValue(“Hand”,””)

$RegCursors.SetValue(“Help”,””)

$RegCursors.SetValue(“IBeam”,””)

$RegCursors.SetValue(“No”,””)

$RegCursors.SetValue(“NWPen”,””)

$RegCursors.SetValue(“SizeAll”,””)

$RegCursors.SetValue(“SizeNESW”,””)

$RegCursors.SetValue(“SizeNS”,””)

$RegCursors.SetValue(“SizeNWSE”,””)

$RegCursors.SetValue(“SizeWE”,””)

$RegCursors.SetValue(“UpArrow”,””)

$RegCursors.SetValue(“Wait”,””)

$RegCursors.Close()

$RegConnect.Close()


$CSharpSig = @'
	[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
	public static extern bool SystemParametersInfo(
	                 uint uiAction,
	                 uint uiParam,
	                 uint pvParam,
	                 uint fWinIni);
'@

$CursorRefresh = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru

$CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)