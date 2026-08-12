-- Read-only review of elevated role and system privilege assignments
SET LINESIZE 220
SET PAGESIZE 200

PROMPT === DBA ROLE ASSIGNMENTS ===
SELECT grantee, granted_role, admin_option, default_role
FROM   dba_role_privs
WHERE  granted_role = 'DBA'
ORDER  BY grantee;

PROMPT === HIGH-RISK SYSTEM PRIVILEGES ===
SELECT grantee, privilege, admin_option
FROM   dba_sys_privs
WHERE  privilege IN (
  'ALTER SYSTEM',
  'ALTER DATABASE',
  'CREATE ANY PROCEDURE',
  'EXECUTE ANY PROCEDURE',
  'SELECT ANY TABLE',
  'GRANT ANY PRIVILEGE',
  'GRANT ANY ROLE'
)
ORDER BY privilege, grantee;
