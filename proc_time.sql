CREATE OR REPLACE PROCEDURE today_time AS
BEGIN
    dbms_output.put_line('Today is ' || TO_CHAR(SYSDATE, 'DL'));
END today_time;
/

BEGIN
    today_time();
END;
/