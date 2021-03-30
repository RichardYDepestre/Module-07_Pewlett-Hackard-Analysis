-- Creating tables for PH-EmployeeDB
drop table if exists departments;
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),	--means that the dept_no column is used as 
							--the primary key for this table
     UNIQUE (dept_name) 	--adds the unique constraint to the dept_name column.
);
--#
drop table if exists employees;
create table employees(
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
--#
drop table if exists dept_manager;
create table dept_manager(
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
--#
drop table if exists salaries;
CREATE TABLE salaries (
  	emp_no INT NOT NULL,
  	salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no)
);
--#
drop table if exists titles;
create table titles(
	emp_no int not null,
	title varchar(40) not null,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
	
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no, title, from_date)
	--unique (title)
);
--#
drop table if exists dept_emp;
create table dept_emp(
    emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--#	verify that all tables have been populated. good!
select count(*) from public.departments;
select count(*) from public.dept_emp;
select count(*) from public.dept_manager;
select count(*) from public.employees;
select count(*) from public.salaries;
select count(*) from public.titles;
