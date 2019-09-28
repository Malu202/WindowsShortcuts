if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Host "Not an admin, launching admin shell"
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File ""$PSCommandPath""")
    exit
}

Write-Host ""
Write-Host "Creating Shortcuts in:" $PSScriptRoot


$powerShellDir = '"%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe"'
$powerShellArgs = '-NoProfile -ExecutionPolicy Bypass -File'
$shortcutPrefix = 'yyy_link_'

function createShortcut($name, $hotkey, $target, $arguments){
    Write-Host "creating" $name

    $name = "$shortcutPrefix$name"
    $shell = New-Object -COM WScript.Shell
    $shortcut = $shell.CreateShortcut("$PSScriptRoot\$name.lnk")
    $shortcut.TargetPath = $target
    $shortcut.Arguments = $arguments
    $shortcut.Description = “Autogenerated Shortcut to make Hotkeys possible”
    $shortcut.HotKey = $hotkey
    $Shortcut.WorkingDirectory ='%HOMEDRIVE%%HOMEPATH%'
    $shortcut.Save()
}
function createPowershellShortcut($target, $hotkey){
    $name = "$target"
    $target = """$PSScriptRoot\$target.ps1"""

    createShortcut $name $hotkey $powerShellDir "$powerShellArgs $target"
}

createPowershellShortcut "couchmode_on" "CTRL+ALT+C"
createPowershellShortcut "couchmode_off" "CTRL+ALT+D"
createShortcut "Monitor" "CTRL+ALT+1" "C:\Windows\System32\DisplaySwitch.exe" "/external"
createShortcut "TV" "CTRL+ALT+2" "C:\Windows\System32\DisplaySwitch.exe" "/internal"
createShortcut "Monitor&TV" "CTRL+ALT+3" "C:\Windows\System32\DisplaySwitch.exe" "/extend"
createShortcut "Clone" "CTRL+ALT+4" "C:\Windows\System32\DisplaySwitch.exe" "/clone"
createShortcut "powerShell" "CTRL+ALT+T" "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe" ""



Write-Host "Finished! For Errors see above."
Write-Host ""
pause