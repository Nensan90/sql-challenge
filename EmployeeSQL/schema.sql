DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE titles (
	title_id VARCHAR(6) NOT NULL,
	PRIMARY KEY(title_id),
	title VARCHAR(20)
);

CREATE TABLE employees (
	emp_no VARCHAR(10) NOT NULL,
	PRIMARY KEY(emp_no),
	emp_title_id VARCHAR(6),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(10),  
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(5),  
	hire_date VARCHAR(10) 
);

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY(dept_no),
	dept_name VARCHAR(20)
);

CREATE TABLE salaries (
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary DECIMAL(9,2)
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no VARCHAR(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
