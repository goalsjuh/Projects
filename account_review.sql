-- Read-only Oracle account review
SET LINESIZE 220
SET PAGESIZE 100
COLUMN username FORMAT A30
COLUMN account_status FORMAT A25
COLUMN profile FORMAT A25

SELECT username,
       account_status,
       profile,
       created,
       expiry_date,
       last_login
FROM   dba_users
ORDER  BY account_status, username;
