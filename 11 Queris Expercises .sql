-- User_table  Tabla de systema que contiene las tablas generadas


5--### Ej 5  Problem: ?Create a list of all tables whose first two characters in the  name of the table is JO
--?The tables must be owned by the current Oracle User
where table_name like 'JO%';

select * from tab
where tname LIKE 'JO%';

6--6 Create a list that includes the first initial of every employee's first name, a space, and the last name of the employee
select (substr(first_name,1,1)||' '|| last_name) as "Employee Name" from employees ;

7--7 Create a list of every employee's first name concatenated to a space and the employee's last name,
--and the email of all employees where the email address contains the string 'IN'
select *from employees;
select (substr(first_name,1,1)||' '|| last_name) as "Employee Name" , email from employees 
where UPPER(email) like '%IN%';

8--8 Create a list of 'smallest'  last name and the  'highest' last name from the employees table
select min(upper(last_name)) as "First Last Name",max(upper(last_name)) as "Last Last Name" from employees;

9-- Create a list of weekly salaries from the employees table where the weekly salary is 
  --between 700 and 3000 
  --? The salaries should be formatted to include a $-sign and have two 
    --decimal points like:  $9999.99

select to_char((salary*12)/52, '$9999.99') as weekly_salary 
from employees
where (salary*12)/52 between 700 and 3000;

10--Create a list of every employee and his related job title sorted by job_title

select (SUBSTR(e.first_name,1,1)|| ' ' ||last_name) as "Employee Name", j.job_title as "Job"
from  employees e 
 inner join jobs j on e.job_id = j.job_id
 order by (j.job_title);

11-- Create a list of every employee’s job, the salary ranges within the job, and the employee's salary 
--List the lowest and highest salary range within each job with a dash to separate the salaries like this: 100 – 200
select (SUBSTR(e.first_name,1,1)|| ' ' ||last_name) as "Employee Name", j.job_title Job,(j.min_salary || ' - '|| j.max_salary) as "Salary Range",
e.salary as "Employee's Salary"
from  employees e 
 inner join jobs j on e.job_id = j.job_id
 order by (j.job_title);

12--Using an ANSII join method, create a list of every employee's first initial and last name, and department name 
    --? Make sure the tables are joined on all of the  foreign keys declared between the two tables
select (SUBSTR(e.first_name,1,1)||' '|| e.last_name)as "Employee Name", d.department_name 
from employees e 
natural jOIN departments d 
natural join jobs j;

13-- Ejercicio 
--Change the previous listing to join only on the department_id column
select (SUBSTR(e.first_name,1,1)||' '|| e.last_name) as Employee_Name, d.department_name
from employees e
INNER join departments d on d.department_id = e.department_id;

14-- Create a list of every employee's last name, and the word nobody or somebody depending on 
     --whether or not the employee has a manager
    --? Use the Oracle DECODE  function to create the list
select DECODE(manager_id, '','Nobody','Somebody') as "Works For",last_name 
from employees;

15-- Create a list of every employee's first initial and last name, salary, and a yes or no to show whether or not an 
   --employee makes a commission
   --? Fix this query to produce the result
SELECT (SUBSTR(first_name,1,1)||' '||last_name) as "Employee Name", salary as "Salary",DECODE(COMMISSION_PCT, NULL, 'No', 'Yes' ) AS "Commission"
from employees;


16--  Create a list of every employee's last name, department name, city, and state_province
--? Include departments without employees? An outer join is required
select e.last_name, d.department_name, l.city,l.state_province 
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on l.location_id = d.location_id;


17  /*Create a list of every employee's first and last names, and the first occurrence 
--of: commission_pct, manager_id, or -1 
?If an employee gets commission, display the commission_pct column; if no 
commission, then display his manager_id; if he has neither commission nor manager, then the number -1
*/
select first_name "First Name", last_name "Last Name" ,COALESCE (COMMISSION_PCT, manager_id, -1) "Wich Function"
from employees;

18-- Create a list of every employee's last name, salary, and job_grade for all employees working in departments with a department_id greater than 50


select e.last_name,e.salary,j.grade_level  from employees e, job_grades j
where department_id >50 and  (salary BETWEEN j.lowest_sal AND j.highest_sal)
order by salary;

19--  Produce a list of every employee's last name and department name
-- Include both employees without departments, and department

select NVL(e.last_name,'-') Last_Name, NVL(d.department_name,'-') Department_Name
from employees e
full outer join Departments d on  e.department_id = d.department_id
order by d.Department_Name,Last_Name;

20-- Create a treewalking list of every employee's last name, his manager?s last name, and his position in the company
--The top level manager has position 1, this manager's subordinates position 2, their subordinates position 3, and so on
--Start the listing with employee number 100

SELECT LEVEL AS "Position", e.last_name, PRIOR e.last_name AS "Manager name"
FROM employees e START WITH e.employee_id = 100 
CONNECT BY PRIOR e.employee_id = e.manager_id;


21-- Produce a list of the earliest hire date, the latest hire date, and the number of employees from the employees table

select min(hire_date) Lowest ,max(hire_date) Highest ,count(last_name) "No of Employees" from employees;

22-- Create a list of department names and the departmental costs (salaries added up) 
--? Include only departments whose salary costs are between 15000 and 31000, and sort the listing by the cost

select d.department_name,sum(e.salary) salaries from departments d
inner join employees e on e.department_id = d.department_id
having sum(e.salary) BETWEEN 15000 and 31000 
group by d.department_name
order by salaries;


23-- Create a list of department names, the manager id, manager name (employee last name) of that department, and the 
--average salary in each department


select d.department_name, d.manager_id,e.last_name Manager_Name, T1.AVG_Dept_Salary  from departments d 
inner join (select department_id,floor(avg(salary)) as AVG_Dept_Salary from employees
group by department_id)T1 
    on d.department_id = T1.department_id
inner join employees e on d.manager_id = e.employee_id
order by (T1.AVG_Dept_Salary)
;

24--Show the highest average salary for the departments in the employees table 
--? Round the result to the nearest whole number

select round(max(avg(salary) )) AS "Highest Avg Sal for Depts"
from employees
group by department_id;

25--? Create a list of department names and their monthly costs 
--(salaries added up)
select d.department_name,sum (e.salary) as "Monthly Cost" 
from  departments d, employees e 
where d.department_id = e.department_id
group by d.department_name
order by 1 ;

26--Create a list of department names, and job_ids
--Calculate the monthly salary cost for each job_id within a department, for each department, and for all 
--departments added together

select NVL(d.department_name,'-') as "Department Name", NVL(e.job_id, '-' ) as "JOB TITLE", sum(e.salary) AS "MONTHLY COST"
from employees e inner join departments d on e.department_id = d.department_id
where e.department_id is not null 
group by ROLLUP (d.department_name,e.job_id)
order by d.department_name;


27--Create a list of department names, and job_ids
--?Calculate the monthly salary cost for each job_id within a department, for each department, for each group of 
--job_ids irrespective of the department, and for all departments added together (Hint: Cube)

select NVL(d.department_name,'-') as "Department Name", NVL(e.job_id, '-' ) as "JOB TITLE", sum(e.salary) AS "MONTHLY COST"
from employees e inner join departments d using (department_id)
where department_id is not null
group by cube (d.department_name,e.job_id)
order by d.department_name;

28/*Calculate the monthly salary cost for each job_id within a department, for each department, for each group of
job_ids irrespective of the department, and for all departments added together
also show if the department_id or job_id was used to create the subtotals shown in the output*/

select NVL(d.department_name,'-') AS "Department Name", NVL(e.job_id,'-') as "Job Title", sum(e.salary) "Monthly Cost", 
DECODE (GROUPING(department_name),'1','NO','YES') AS "Dept id used", 
DECODE(GROUPING(job_id),1,'NO','YES') AS "Job id used"
from employees e inner join departments d using (department_id)
where department_id is not null
group by cube (d.department_name,e.job_id)
order by d.department_name;

29-- Create a list that includes  the monthly salary costs for each job title within a department 


select d.department_name,t1.job_id,t1.Monthly from departments d 
 inner join (select department_id,job_id,floor(sum(salary)) as Monthly from employees
        group by job_id,department_id) t1
 on d.department_id = t1.department_id
 order by (t1.job_id);
select * from locations;

    
SELECT NVL(d.department_name,'-'), nvl(e.job_id,'-'),nvl(l.city,'-'), SUM(e.salary) DSum
    FROM employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on l.location_id = d.location_id
    where e.department_id is not null
    GROUP BY Grouping Sets((d.department_name,e.job_id),(l.city))
    order by d.department_name,e.job_id desc,l.city;
    
30--  Create a list of employee names as shown and department ids 
--?In the same report, list the department ids and department names. And finally, list the cities 
-- The rows should not be joined, just listed in the same report. (Hint: Union)

select (substr(e.first_name,1,1)||' '|| e.last_name) as "Employee",to_char(department_id) as "Department ID"  , '-' as "Department Name", '-' as city
from employees e
union
select '-' as "Employee",to_char(department_id) as "Department ID"  , department_name as "Department Name", '-' as city
from departments d
union
select '-' as "Employee",'-' as "Department ID" , '-' as "Department Name", city
from Locations
;


31-- Create a list of each employee's first initial and last name, salary, 
--and department name for each employee earning more than the 
--average for his department

select (substr(first_name,1,1)||' '|| last_name) as "Employee" ,e.salary,d.department_name as "Department Name"
from employees e
inner join (select department_id,avg(salary) average from employees 
            group by department_id) av 
      on e.department_id = av.department_id
    inner  join  departments d on e.department_id = d.department_id
where e.salary > av.average;

