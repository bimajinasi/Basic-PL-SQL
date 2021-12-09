--db tanpa index, maka kinerja server dapat menurun dratis, karena resource cpu di gunakan secara table-scan

--fungsi : meningkatkan kecepatan get data

/*perlu index : 
-field sering menggunakan kondisi where (search by id)
-data yg sangat banyak (bilion)
-field banyak nilai null
*/

--INDEX
--create INDEX
CREATE INDEX data_pasien_idx ON DATA_PASIEN(PASIEN_ID) NOLOGGING COMPUTE STATISTICS;

--when search by ID before index (time : 18.332 s)
SELECT * FROM DATA_PASIEN WHERE PASIEN_ID = 33
/

--when search by ID after index (time : 1.781 s)
SELECT * FROM DATA_PASIEN WHERE PASIEN_ID = 33
/

--UNIQUE INDEX
--block if emp_name && salary same value 
CREATE UNIQUE INDEX emp_name_unique ON employee(emp_name, salary);
/

--VIEW INDEX
SELECT index_name FROM user_indexes where table_name='EMPLOYEE';
/

--change name index
ALTER INDEX emp_name_unique RENAME TO emp_name_pk;
/

--delete index
DROP INDEX emp_name_pk;
/

