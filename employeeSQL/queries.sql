-- list the employee number, last name, first name, sex, and salary of each employee
SELECT
	employees.emp_no AS emp_no,
	employees.last_name AS last_name,
	employees.first_name AS first_name,
	employees.sex AS sex,
	salaries.salary AS salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
LIMIT(10);

-- list the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1986-01-01' AND hire_date < '1986-12-31'
LIMIT(10);

-- list the manager of each department with their department number, department name, employee number, last name, and first name.
SELECT
	departments.dept_no AS department_number,
	departments.dept_name AS department_name,
	dept_manager.emp_no AS employee_number,
	employees.last_name AS last_name,
	employees.first_name AS first_name
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
LIMIT(10);

-- list the department number for each employee with that employee’s number, last name, first name, and department name
SELECT
	employees.emp_no AS employee_number,
	employees.last_name AS last_name,
	employees.first_name AS first_name,
	dept_emp.dept_no AS department_number,
	departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
LIMIT (10);

-- list first name, last name, and sex of each employee whose first name is Hercules and last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- list each employee in the Sales department, including their employee number, last name, and first name
SELECT
	employees.emp_no AS employee_number,
	employees.last_name AS last_name,
	employees.first_name AS first_name,
	departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
LIMIT(10);

-- list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	employees.emp_no AS employee_number,
	employees.last_name AS last_name,
	employees.first_name AS first_name,
	departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
LIMIT(10);

-- list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC
LIMIT(10);
