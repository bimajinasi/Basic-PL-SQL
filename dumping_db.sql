--DUMPING DB
--Preparation
@1 Create directory at OS 
mkdir DATADUMP
>mkdir <NAME_DIR>

@2 Create directory datapump
create directory datadump_schema AS 'D:\DATADUMP';
>create directory <NAME_DIR_DATAPUMP> AS '<NAME_DIR>';

--Export DB Schema
@1 export schema
expdp directory=orcl_dp_full dumpfile=DBDATAEMPSCH.dmp logfile=expdpDB11SCH.log schemas='emp'
>expdp directory=<NAME_DIR> dumpfile=<NAME_DMP_FILE>.DMP logfile=<NAME_LOG>.log schemas='<NAME_SCHEMA_EXPORT>'

@2 login with sysdba
/ as sysdba

--Import DB Schema
@0 give grant to user import
GRANT DBA to <NAME_USER>;
/

@1 import schema
impdp directory=orcl_dp_full dumpfile=DBDATAEMPSCH.dmp logfile=impdpDB11G.log remap_schema='emp:bima_orcl'
>impdp directory=<NAME_DIR> dumpfile=<NAME_DMP_FILE>.DMP logfile=<NAME_LOG>.log schemas='<NAME_SCHEMA_EXPORT>:<NAME_SCHEMA_IMPORT>'

@2 login with sysdba
/ as sysdba












--EXPORT & IMPORT FULL
--export
expdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=expdpDB10G.log

--import
impdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=impdpDB11G.log

=======================
DumpingDB using DataPump
=======================
@1 login sysdba
sqlplus / as sysdba

@2 create directory from folder has been created
create directory NAME_DIR AS 'D:\DATA PUMP';

@3 give grant to user want to export
grant read,write on directory orcl_full to NAME_USER;

@4 give grant datapump 
grant datapump_exp_full_database to NAME_USER;

@4A give grant dba 
GRANT DBA to <NAME_USER>;
/

@5 exit from ORACLE
exit

@6 export full DB
expdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=expdpDB10G.log

@7 import full DB
impdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=impdpDB11G.log

--import 2 table
impdp system/tiger TABLES=EMPLOYEE directory=orcl_full dumpfile=DB10G.dmp logfile=impdpDB11G.log 