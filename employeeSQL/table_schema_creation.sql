-- create table for titles csv
create table titles (
	title_id varchar (10) not null primary key,
	title varchar (50) not null
);

-- display titles table with imported data from csv
select * from titles

-- create table for employees
create table employees (
	emp_no int not null primary key,
	emp_title_id varchar (10) not null,
	birth_date date,
	first_name varchar (50),
	last_name varchar (50),
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

-- display employees table with imported data from csv
select * from employees

-- create table for salaries
create table salaries (
	emp_no int not null,
	salary int,
	foreign key (emp_no) references employees(emp_no)
);

-- display salaries table with imported data from csv
select * from salaries

-- create table for departments
create table departments (
	dept_no varchar (10) not null primary key,
	dept_name varchar
);

-- display departments table with imported data from csv
select * from departments

-- create table for department employees
create table dept_emp (
	emp_no int not null,
	dept_no varchar (10) not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- display department employees table with imported data from csv
select * from dept_emp

-- create table for department managers
create table dept_manager (
	dept_no varchar (10) not null,
	emp_no int not null,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

-- display department managers table with imported data from csv
select * from dept_manager
