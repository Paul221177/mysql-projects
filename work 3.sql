-- GROUP BY
select *
FROM employee_demographics;

select gender, avg(age), max(age), min(age), count(age)
FROM employee_demographics
GROUP BY GENDER;

select occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

-- order by
select *
FROM employee_demographics
order by gender, age desc;