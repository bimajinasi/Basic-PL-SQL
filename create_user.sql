--SET SESSION ON
alter session set "_ORACLE_SCRIPT"=TRUE;
/

--SET DBMSOUTPUT
SET SERVEROUTPUT ON;
/

--CREATE NEW USER
create user name_user identified by password_user;
/

--when create user any error
-->>ORA-65096 : invalid common user or role name_user
--The solution is to set session
alter session set "_ORACLE_SCRIPT"=TRUE;
/


--GIVE PRIVILEGES
grant all privileges to name_user;
/

--CREATE NEW USER FOR CONNECTION
grant connect, resource to IMPORT_EMPLOYEE identified by oracle;
/

--view ALL USER
select username from all_users
/

