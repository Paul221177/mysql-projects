-- WHERE CLAUSE
select * 
from employee_salary
where salary >=50000
;
select *
from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male';
select *
from parks_and_recreation.employee_demographics;
select first_name, last_name, birth_date, age, (age + 10 * 10 + 10) 
from parks_and_recreation.employee_demographics;
# PEMDAS
select distinct gender, first_name
from parks_and_recreation.employee_demographics;