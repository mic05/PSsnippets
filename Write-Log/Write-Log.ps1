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
        New-EventLog -LogName $Logname -Source $Source
    }
    Write-EventLog -LogName $Logname -Source $Source -EntryType $Type -EventId $EventId -Message $Message
}