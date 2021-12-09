--VIEW mengurangi penulisan query join

--view all view
SELECT view_name FROM user_views;
/

--create view
CREATE VIEW nama_view AS
    query_select
/

--execute view
select * from vw_emp_salary;
/

--select from view
select emp_name from vw_emp_salary;
/

--insert to view
insert into nama_view(field1, fieldn) values ('', '');
select * from nama_view;
select * from nama_table_main;
--insert to main table but other field is null

--update view
update nama_view set field = 'isi field' where

--delete view without from 
delete nama_view where

--create view READ ONLY (only for select)
CREATE OR REPLACE VIEW nama_view AS
    SELECT .. FROM nama_tabel
    WITH READ ONLY;

--


