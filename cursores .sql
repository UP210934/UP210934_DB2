-- CURSORES 
--Recorre y aplica las sentencias row by row
/
set  SERVEROUTPUT ON
DECLARE
    CURSOR cursor_employees is 
    SELECT *  from employees where department_id=60;
    v_contador number:=0;
BEGIN 
 dbms_output.put_line('Number   ID     Last name');
    for c_emp in  cursor_employees LOOP 
        v_contador := v_contador+1;
        dbms_output.put_line(v_contador || '        ' || c_emp.employee_id|| '    '|| c_emp.Last_Name );
    end loop;
            dbms_output.put_line('Total:  ' || v_contador);        
end;
/
select * from employees;

execute cursor_employees;

--Funciones

CREATE OR REPLACE FUNCTION tomorrow(p_today IN DATE)
 RETURN DATE 
IS
 v_tomorrow DATE;
BEGIN
 SELECT p_today+1 INTO v_tomorrow FROM DUAL;
 RETURN v_tomorrow;
END;

Begin
 dbms_output.put_line(tomorrow(sysdate));
end
--Ejecutar funciones
/
SELECT TOMORROW(SYSDATE) FROM DUAL;
