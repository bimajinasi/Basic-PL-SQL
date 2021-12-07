--DUMPING DB
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

@5 exit from ORACLE
exit

@6 export full DB
expdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=expdpDB10G.log

@7 import full DB
impdp system/tiger full=Y directory=orcl_full dumpfile=DB10G.dmp logfile=impdpDB11G.log

--import 2 table
impdp system/tiger TABLES=EMPLOYEE directory=orcl_full dumpfile=DB10G.dmp logfile=impdpDB11G.log 