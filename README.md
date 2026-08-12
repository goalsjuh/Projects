# PowerShell Threat Hunting

## Objective

Build a defensive workflow for identifying suspicious PowerShell behavior without treating every administrative PowerShell command as malicious.

## Primary Telemetry

- PowerShell Operational logs
- Event ID 4104 - Script Block Logging
- Sysmon Event ID 1 - Process Creation
- EDR process telemetry
- Network telemetry
- SIEM correlation

## Behaviors of Interest

- `-EncodedCommand` / `-enc`
- `Invoke-Expression` / `IEX`
- remote download behavior
- suspicious parent-child process relationships
- hidden or bypass execution patterns
- unexpected network connections from PowerShell

## Hunting Principle

A suspicious keyword is a lead, not a verdict. Correlate the command with user context, parent process, destination, file activity, endpoint history, and surrounding events.

## Included Examples

- [PowerShell collection script](scripts/get-powershell-events.ps1)
- [KQL hunting examples](queries/powershell-hunting.kql)

## Defensive Controls

- Script Block Logging
- AMSI
- least privilege
- signed scripts where appropriate
- Constrained Language Mode
- WDAC / AppLocker
- EDR behavioral detection
