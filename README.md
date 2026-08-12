# Oracle Database Security Audit

## Objective

Demonstrate a read-only security review of Oracle users, roles, privileges, account status, profiles, and elevated permissions.

This project connects enterprise Oracle DBA experience with modern cybersecurity goals such as IAM, least privilege, attack-surface reduction, and auditability.

## Review Areas

- User account status
- Default / service accounts
- Role assignments
- System privileges
- Object privileges
- DBA-level access
- Profiles and password policies
- Excessive privilege indicators
- Dormant account review
- Security findings and remediation recommendations

## Included SQL

- [Account review](sql/account_review.sql)
- [Privilege review](sql/privilege_review.sql)

## Security Principles

- Least privilege
- Separation of duties
- RBAC
- Periodic access review
- Traceability
- Defense in depth

## Safety

The provided SQL is designed for defensive review and does not modify database state.
