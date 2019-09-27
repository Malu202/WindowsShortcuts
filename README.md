# WindowsShortcuts


powershell scripts erlauben (als Admin):
```PowerShell
Set-ExecutionPolicy Unrestricted
```
dann eine Verknüpfung erstellen mit:
```PowerShell
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "SCRIPT_DATEIPFAD"
```
