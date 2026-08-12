# Cloud IAM Security Review

## Objective

Provide a repeatable review framework for cloud identity and access risks using least privilege and Zero Trust principles.

## Review Checklist

1. Identify human and service identities.
2. Find inactive or stale accounts.
3. Review MFA coverage.
4. Identify broad administrative roles.
5. Review long-lived credentials and access keys.
6. Validate service-account permissions.
7. Inspect cross-account / trust relationships.
8. Review privileged access paths.
9. Prioritize findings by business impact and exploitability.
10. Define remediation and ownership.

## Example Findings

| Finding | Risk | Recommended action |
|---|---|---|
| User with broad admin role | High | Replace with task-specific role and JIT elevation |
| Long-lived access key | High | Rotate/remove key and prefer short-lived credentials |
| Account without MFA | Medium/High | Enforce MFA based on identity risk |
| Dormant privileged account | High | Disable pending owner validation |
| Excessive service-role permissions | High | Reduce policy scope to required actions/resources |

## Skills Demonstrated

Cloud security, IAM, RBAC, least privilege, risk prioritization, remediation planning, security governance.
