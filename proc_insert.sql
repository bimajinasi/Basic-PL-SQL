--create table
create table CUSTOMER (  
NAME VARCHAR2(20),   
GENDER VARCHAR2(7),   
ADDRESS VARCHAR2(100));
/

--create procedur
CREATE OR REPLACE PROCEDURE INSERTcustomer (  
p_name CUSTOMER.NAME%TYPE,  
p_gender CUSTOMER.GENDER%TYPE,  
p_address CUSTOMER.ADDRESS%TYPE)    
IS  
BEGIN  
INSERT INTO CUSTOMER (NAME, GENDER, ADDRESS)  
VALUES (p_name, p_gender, p_address);  
COMMIT;  
END;  
/ 

--check data
select * from customer;
/

--insert data
begin
INSERTcustomer('Yoga','MALE','CONDET');
dbms_output.put_line('record inserted successfully');
end;
/

--check data
select * from customer;
/

--drop procedure
drop procedure INSERTCustomer;
/