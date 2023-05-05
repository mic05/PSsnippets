# Write-Log
This powershell function writes an event in windows event log. You can use this to log anything in your scripts.

## Example
```powershell
Write-Log -Message "Start script at $(Get-Date)"