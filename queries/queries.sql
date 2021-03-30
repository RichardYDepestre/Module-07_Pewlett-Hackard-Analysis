-- do $$
-- declare 
-- 	from_date Date;
-- 	to_date Date;
-- begin
-- 	select min(birth_date) into from_date from public.employees;
-- 	select max(birth_date) into to_date from public.employees;
-- 	raise notice 'min birth date: %', from_date;
-- 	raise notice 'max birth date: %', to_date;


-- end; $$

select first_name, last_name
from public.employees
where birth_date between '1952-01-01' AND '1955-12-31';

-- SELECT first_name, last_name
-- FROM employees
-- WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- create new table with 'select into'
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select count(first_name) from retirement_info;
