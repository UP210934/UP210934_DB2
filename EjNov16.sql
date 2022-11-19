set SERVEROUTPUT on;
create or replace function reviewEtapa(emp_bday DATE)
return  varchar2
is
 v_edad number:= floor(MONTHS_BETWEEN(sysdate,emp_bday)/12);
 v_returned varchar2(50);
begin
    case
        WHEN v_edad < 30 THEN  v_returned := 'Primera Edad';
        WHEN v_edad < 60 THEN v_returned := 'Segunda Edad';
        WHEN v_edad  < 90 THEN v_returned :='Tercera Edad';
        else v_returned :='Horas Extra' ;
        END case;
    RETURN v_returned;
end;
/
--call(reviewEtapa(sysdate));
select hire_date,reviewEtapa(hire_date) as "Edad",floor(MONTHS_BETWEEN(sysdate,hire_date)/12) as Edad from employees
where employee_id=100;

--Anio biciesto
create or replace function  biciesto(v_year number)
return varchar2
is 
 v_is_bisciesto varchar2(25) default 'No es Biciesto'; 
begin
    if mod(v_year,4) = 0 then  v_is_bisciesto := 'Biciesto';
    END IF;
    return v_is_bisciesto;
end;
/
select biciesto(2015) from dual;

--3
/

select * from departments;
select max(department_id) from departments;
/
Declare 
 cursor list_departments is
    select * from departments;
    highest_dept departments.department_id%TYPE ;
begin 
    select max(department_id) into highest_dept from departments;
    for v_dept in highest_dept loop
        if vept.department_id -
        DBMS_OUTPUT.PUT_LINE(v_dept.department_id);
    EXIT WHEN i >= 10;
    i := i + 1; 
end;

/
--- Doble Procedire
set SERVEROUTPUT ON
DECLARE
 CURSOR cur_dep IS 
 SELECT * FROM departments;
 CURSOR cur_emp (p_dep NUMBER) IS
 SELECT * FROM employees WHERE department_id = p_dep;
BEGIN
 FOR r_dep IN cur_dep LOOP
 DBMS_OUTPUT.PUT_LINE(upper(r_dep.department_name));
 FOR r_emp IN cur_emp (r_dep.department_id) LOOP
 DBMS_OUTPUT.PUT_LINE(r_emp.last_name);
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('');
 END LOOP;
END;
/
---Triple procedure
set SERVEROUTPUT ON
DECLARE
 CURSOR cur_dep IS 
 SELECT * FROM regions;
 CURSOR cur_country (p_dep NUMBER) IS
 SELECT * FROM countries WHERE  region_id = p_dep;
 CURSOR cur_city (p_coun countries.country_id%TYPE) IS
 SELECT * FROM locations WHERE COUNTRY_ID = p_coun;
 BEGIN
 FOR r_dep IN cur_dep LOOP
 DBMS_OUTPUT.PUT_LINE(upper(r_dep.region_name));
    FOR r_count IN cur_country (r_dep.region_id) LOOP
    DBMS_OUTPUT.PUT_LINE(' ' || r_count.country_name);
        FOR r_city IN cur_city (r_count.COUNTRY_ID) LOOP
        DBMS_OUTPUT.PUT_LINE('    ' || r_city.city);
        END LOOP;
    END LOOP;
  DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
END;
/
select * from LOCATIONS;

