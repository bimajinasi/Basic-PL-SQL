--SET SESSION ON
alter session set "_ORACLE_SCRIPT"=TRUE;
/

--SET DBMSOUTPUT
SET SERVEROUTPUT ON;
/

--CREATE NEW USER
create user name_user identified by password_user;
/

--GIVE PRIVILEGES
grant all privileges to name_user;
/

--CREATE NEW USER FOR CONNECTION
grant connect, resource to IMPORT_EMPLOYEE identified by oracle;
/

