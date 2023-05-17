CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30)
);

CREATE TABLE employees (
	employee_no INT PRIMARY KEY,
	employee_title_id VARCHAR(30),
	birthdate DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(5),
	hire_date DATE,
	FOREIGN KEY (employee_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
	department_No VARCHAR(30) PRIMARY KEY,
	department_name VARCHAR(30)
);

CREATE TABLE salaries (
	employee_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no)
);

CREATE TABLE dept_managers (
	department_no VARCHAR(30),
	employee_no INT NOT NULL,
	PRIMARY KEY (department_no, employee_no),
	FOREIGN KEY (department_no) REFERENCES departments(department_no),
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no)
);

CREATE TABLE dept_employees (
	employee_no INT NOT NULL,
	department_no VARCHAR(30),
	PRIMARY KEY (employee_no, department_no),
	FOREIGN KEY (employee_no) REFERENCES employees(employee_no),
	FOREIGN KEY (department_no) REFERENCES departments(department_no)
);