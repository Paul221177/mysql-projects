-- CTES
with CTE_example as
(
select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender)
select *
FROM CTE_example;    
WITH CTE_example AS (
    SELECT gender, 
           AVG(salary)  avg_sal, 
           MAX(salary)  max_sal, 
           MIN(salary)  min_sal, 
           COUNT(salary)  count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT AVG(avg_sal) AS overall_avg_salary
FROM CTE_example;

select avg(avg_sal)
from (SELECT gender, 
           AVG(salary)  avg_sal, 
           MAX(salary)  max_sal, 
           MIN(salary)  min_sal, 
           COUNT(salary)  count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
) example_subquery
;
        
WITH CTE_example AS (
    SELECT employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date >= '1985-01-01'
),
CTE_example2 AS (
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary > 50000
)
SELECT e.employee_id, e.gender, e.birth_date, s.salary
FROM CTE_example e
JOIN CTE_example2 s
    ON e.employee_id = s.employee_id;
-- TEMPORARY table
create temporary table temp_table
( first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);
select *
from temp_table; 
insert into temp_table
values( 'alex', 'ferbrek', 'lord of the ring: two tower');
select *
from temp_table;
select * 
from employee_salary;
create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;
select *
from salary_over_50k;
