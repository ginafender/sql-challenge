CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

CREATE TABLE employees (
	employee_no INT PRIMARY KEY,
	employee_title_id VARCHAR,
	birthdate DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (employee_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
	department_no VARCHAR PRIMARY KEY,
	department_name VARCHAR
);

CREATE TABLE salaries (
	employee_no VARCHAR,
	salary INT,
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no)
);

CREATE TABLE dept_managers (
	department_no VARCHAR,
	employee_no INT,
	FOREIGN KEY (department_no) REFERENCES departments(department_no),
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no)
);

CREATE TABLE dept_employees (
	employee_no INT,
	department_no VARCHAR,
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no),
	FOREIGN KEY (department_no) REFERENCES departments(department_no)
);