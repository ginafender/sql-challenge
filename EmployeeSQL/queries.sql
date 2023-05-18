SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_employees;
SELECT * FROM dept_managers;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.employee_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries
	ON employees.employee_no = salaries.employee_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT dept_managers.employee_no,
	dept_managers.department_no,
	departments.department_name,
	employees.last_name,
	employees.first_name
FROM dept_managers
INNER JOIN departments
	ON dept_managers.department_no = departments.department_no
INNER JOIN employees
	ON dept_managers.employee_no = employees.employee_no

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT dept_employees.employee_no,
	dept_employees.department_no,
	employees.last_name,
	employees.first_name,
	departments.department_name
FROM dept_employees
INNER JOIN departments
	ON dept_employees.department_no = departments.department_no
INNER JOIN employees
	ON dept_employees.employee_no = employees.employee_no

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND
	last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_employees.employee_no,
	employees.last_name,
	employees.first_name
FROM dept_employees
INNER JOIN employees
ON dept_employees.employee_no = employees.employee_no
WHERE department_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT dept_employees.employee_no,
	employees.last_name,
	employees.first_name,
	departments.department_name
FROM dept_employees
INNER JOIN employees
ON dept_employees.employee_no = employees.employee_no
INNER JOIN departments
ON dept_employees.department_no = departments.department_no
WHERE dept_employees.department_no = 'd007' OR dept_employees.department_no = 'd005';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name,
	COUNT(*) AS number
FROM employees
GROUP BY last_name
ORDER BY number DESC;