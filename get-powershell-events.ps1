# Defensive lab script: collect recent PowerShell Script Block Logging events.
# Run only in systems you are authorized to administer.

$StartTime = (Get-Date).AddHours(-24)

Get-WinEvent -FilterHashtable @{
    LogName   = 'Microsoft-Windows-PowerShell/Operational'
    Id        = 4104
    StartTime = $StartTime
} -ErrorAction SilentlyContinue |
Select-Object TimeCreated, Id, MachineName, Message |
Sort-Object TimeCreated -Descending
