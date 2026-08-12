# Ransomware Incident Investigation

## Objective

Demonstrate a structured Blue Team investigation of a suspicious attack chain involving a document process, encoded PowerShell execution, outbound HTTPS communication, `rundll32`, a DLL artifact, and large-scale file modification.

## Scenario

Synthetic attack chain:

```text
WINWORD
  -> PowerShell -EncodedCommand
  -> HTTPS connection
  -> rundll32.exe
  -> update.dll
  -> 734 files modified with .locked extension
```

The behavior is strongly consistent with ransomware activity, but the investigation deliberately separates **hypothesis from confirmed evidence**.

## Investigation Workflow

1. Validate the alert and affected endpoint.
2. Build the process tree.
3. Capture full command lines and parent-child relationships.
4. Hash suspicious artifacts and verify digital signatures.
5. Review EDR timeline and Windows telemetry.
6. Analyze Sysmon process and network events.
7. Review DNS / HTTP(S) connections.
8. Validate file-system impact using MFT and USN Journal artifacts.
9. Check for lateral movement or additional impacted endpoints.
10. Map confirmed behavior to MITRE ATT&CK.
11. Contain while preserving evidence.

## Evidence Checklist

See [evidence-checklist.md](evidence-checklist.md).

## MITRE ATT&CK Mapping

| Behavior | Technique |
|---|---|
| PowerShell execution | T1059.001 - PowerShell |
| Rundll32 execution | T1218.011 - Rundll32 |
| Web protocol communication | T1071.001 - Web Protocols |
| File encryption for impact | T1486 - Data Encrypted for Impact |

## Important Analytical Notes

- `-EncodedCommand` is not malicious by itself.
- `rundll32.exe` loading a DLL does not prove DLL injection.
- Credential dumping tools should not be attributed without evidence.
- Every conclusion should trace back to telemetry or an artifact.

## Containment

- Isolate the affected endpoint.
- Preserve relevant evidence.
- Block validated indicators of compromise.
- Hunt for the same indicators across the environment.
- Validate whether lateral movement occurred.
- Begin recovery only after containment scope is understood.

## Skills Demonstrated

SOC triage, incident investigation, process-tree analysis, Windows telemetry, EDR workflow, file-system forensics, MITRE ATT&CK mapping, evidence-based reasoning, incident containment.
