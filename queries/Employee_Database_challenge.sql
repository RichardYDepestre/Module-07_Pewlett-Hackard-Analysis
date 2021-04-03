select * from public.employees;

drop table if exists public.retirement_titles;

select
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.title,
	t.from_date,
	t.to_date
	into retirement_titles
	from public.employees emp
	inner join Titles t
		on emp.emp_no = t.emp_no
		where emp.birth_date between '1952-01-01' and '1955-12-31'
	order by emp.emp_no;
-- select * from public.retirement_titles;
COPY (select * from public.retirement_titles) TO 'L:\data-engineering@ColumbiaUnv\Analysis Projects Folder\Pewlett-Hackard-analysis\data\retirement_titles.csv' DELIMITER ',' CSV HEADER;

-- Use Dictinct with Orderby to remove duplicate rows
drop table if exists public.unique_titles;
SELECT DISTINCT ON (rt.emp_no) emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM public.retirement_titles rt
ORDER BY emp_no asc, rt.to_date DESC;
-- select * from unique_titles;
COPY (select * from public.unique_titles) TO 'L:\data-engineering@ColumbiaUnv\Analysis Projects Folder\Pewlett-Hackard-analysis\data\unique_titles.csv' DELIMITER ',' CSV HEADER;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT count(rt.title) count, rt.title
INTO retiring_titles
FROM unique_titles rt
group by rt.title
ORDER BY count desc, rt.title;
-- select * from retiring_titles;
COPY (select * from public.retiring_titles) TO 'L:\data-engineering@ColumbiaUnv\Analysis Projects Folder\Pewlett-Hackard-analysis\data\retiring_titles.csv' DELIMITER ',' CSV HEADER;
-- 
drop table if exists public.mentorship_eligibility;
SELECT distinct on (emp.emp_no) emp.emp_no,
 	emp.first_name, emp.last_name,	emp.birth_date,
 	dpt_emp.from_date, dpt_emp.to_date
	, t.title
 	into public.mentorship_eligibility
from public.employees emp
	inner join public.dept_emp dpt_emp
		on emp.emp_no = dpt_emp.emp_no
  	inner join public.titles t
 		on emp.emp_no = t.emp_no
	where dpt_emp.to_date = '9999-01-01'
 		and emp.birth_date between '1965-01-01' and '1965-12-31'
	order by emp.emp_no asc --dpt_emp.from_date;

-- select * from public.mentorship_eligibility;
COPY (select * from public.mentorship_eligibility) TO 'L:\data-engineering@ColumbiaUnv\Analysis Projects Folder\Pewlett-Hackard-analysis\data\mentorship_eligibility.csv' DELIMITER ',' CSV HEADER;
