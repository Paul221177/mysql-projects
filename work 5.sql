-- limit & aliasing
select *
from employee_demographics
order by age desc
limit 2, 1;

-- aliasing 

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
having avg(age)> 40;
-- joins
select * 
from employee_demographics;
select * 
from employee_salary;
select ED.employee_id, AGE, occupation
from employee_demographics as ED
inner join employee_salary as ES
	on ED.employee_id = ES.employee_id;
-- OUTER JOIN
select*
from employee_demographics as ED
right join employee_salary as ES
	on ED.employee_id = ES.employee_id;
    
    -- self join
    select emp1.employee_id as emp_santa,
    emp1.first_name as first_name_santa,
    emp1.last_name as last_name_santal,
    emp2.employee_id as emp_name,
    emp2.first_name as first_name_emp,
    emp2.last_name as last_name_emp
    from employee_salary EMP1
    join employee_salary EMP2
		ON EMP1.employee_id + 1 = EMP2.employee_id
        ;
    -- joining multiple table together
    select *
from employee_demographics as ED
inner join employee_salary as ES
	on ED.employee_id = ES.employee_id
inner join parks_departments pd
on es.dept_id = pd.department_id; 
    select *
    from parks_departments;
    
-- unions 
SELECT first_name, last_name
FROM employee_demographics
UNION all
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'old MAN' as lebel
FROM employee_demographics
where age > 40 AND gender = 'MALE' 
union
SELECT first_name, last_name, 'old LADY' as lebel
FROM employee_demographics
where age > 40 AND gender = 'female'
UNION 
SELECT first_name, last_name, 'HIGLY PAID EMPLOYEE' as lebel
FROM employee_salary
where salary > 70000
order by first_name, last_name;
-- string function
select length('skyfall');
select first_name, length(first_name)
from employee_demographics
order by 2;
select upper('sky');
select lower('sky'); 
select first_name, upper(first_name)
from employee_demographics
;
select Rtrim('									sky											');
SELECT 
    first_name,
    LEFT(first_name, 4),
    RIGHT(first_name, 4),
    SUBSTRING(first_name, 3, 2),
    birth_date,
    SUBSTRING(birth_date, 6, 2) as bith_month
FROM employee_demographics;

select first_name, replace(first_name, 'a', 'z')
FROM employee_demographics;
select first_name, locate('A',first_name)
FROM employee_demographics;
select FIRST_NAME, LAST_NAME,
concat(FIRST_NAME,'   ', LAST_NAME)
FROM employee_demographics;
-- case statement
select first_name, last_name, age,
case
	when age <=30 then 'young'
    when age between 31 and  50 then 'old'
    when age >= 50 then 'on death door'
end as 'age bracket'
from employee_demographics;
-- pay increase and bonus
-- <50000 =5%
-- >50000 =7%
-- finance =10% bonus
select first_name, last_name, salary,
case
	when salary < 50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as new_salary
from employee_salary;    
	




    
    
