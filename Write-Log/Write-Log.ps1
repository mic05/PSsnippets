function Write-Log {
    param(
        [Parameter(Mandatory)]
        $Message,
        $Type = "Information",
        $EventId = 30000,
        $Source = "Source",
        $Logname = "Application"
    )
    
    if (!([system.diagnostics.eventlog]::SourceExists($Source))) {
        if((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            New-EventLog -LogName $Logname -Source $Source
        } else {
            Write-Host "Source doesn't exist and can't be created without admin rights." -ForegroundColor Red
        }
    }
    Write-EventLog -LogName $Logname -Source $Source -EntryType $Type -EventId $EventId -Message $Message
}