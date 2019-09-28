if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Host "Not an admin, launching admin shell"
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File ""$PSCommandPath""")
    exit
}

Write-Host ""
Write-Host "Creating Shortcuts in:" $PSScriptRoot


$powerShellDir = '"%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe"'
$powerShellArgs = '-ExecutionPolicy Bypass -File'
$shortcutPrefix = 'yyy_link_'

function createShortcut($name, $hotkey, $target, $arguments){
    $shell = New-Object -COM WScript.Shell
    $shortcut = $shell.CreateShortcut("$PSScriptRoot\$name")
    $shortcut.TargetPath = $target
    $shortcut.Arguments = $arguments
    $shortcut.Description = “Autogenerated Shortcut to make Hotkeys possible”
    $shortcut.HotKey = $hotkey
    $shortcut.Save()
}
function createPowershellShortcut($target, $hotkey){
    $name = "$shortcutPrefix$target.lnk"
    Write-Host "creating" $name
    $target = """$PSScriptRoot\$target.ps1"""

    createShortcut $name $hotkey $powerShellDir "$powerShellArgs $target"
}

createPowershellShortcut "couchmode_off" "CTRL+8"




Write-Host "Finished! For Errors see above."
Write-Host ""
pause