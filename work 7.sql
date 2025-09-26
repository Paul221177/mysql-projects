-- window function
select gender, avg(salary)
from employee_demographics dm
join employee_salary sal
	on dm.employee_id= sal.employee_id
group by gender;
select gender, avg(salary) over()
from employee_demographics dm
join employee_salary sal
	on dm.employee_id= sal.employee_id;
select dm.first_name, dm.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics dm
join employee_salary sal
	on dm.employee_id= sal.employee_id;
select dm.first_name, dm.last_name, gender, gender, avg(salary) as avg_salary
from employee_demographics dm
join employee_salary sal
	on dm.employee_id= sal.employee_id
group by dm.first_name, dm.last_name, gender;         
SELECT dm.first_name, 
       dm.last_name, 
       dm.gender,
       salary,
       SUM(sal.salary) OVER (
           PARTITION BY dm.gender 
           ORDER BY dm.employee_id
       ) AS running_total_salary
FROM employee_demographics dm
JOIN employee_salary sal
    ON dm.employee_id = sal.employee_id;
    
SELECT 
    dm.first_name, 
    dm.last_name, 
    dm.gender,
    sal.salary,
    ROW_NUMBER() OVER (
        PARTITION BY dm.gender 
        ORDER BY sal.salary DESC
    ) AS row_num,
    RANK() OVER (
        PARTITION BY dm.gender 
        ORDER BY sal.salary DESC
    ) AS rank_num,
    dense_rank() OVER (
        PARTITION BY dm.gender 
        ORDER BY sal.salary DESC
    ) AS dense_rank_num
FROM employee_demographics dm
JOIN employee_salary sal
    ON dm.employee_id = sal.employee_id;
            
     
