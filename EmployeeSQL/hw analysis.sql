--1. 
select a.emp_no, a.first_name, a.last_name, a.sex, b.salary from employees a
LEFT JOIN salaries b on a.emp_no = b.emp_no;

--2.
select first_name, last_name, hire_date from employees
where hire_date like '%1986';

--3.
select a.dept_no, a.dept_name, b.emp_no, c.first_name, c.last_name from departments a
LEFT JOIN dept_manager b on b.emp_no = b.emp_no
LEFT JOIN employees c on b.emp_no = c.emp_no;

--4.
WITH a AS 
	(SELECT dept_no, emp_no FROM dept_manager
	UNION
	SELECT dept_no, emp_no FROM dept_emp)
	SELECT b.emp_no, b.last_name, b.first_name, c.dept_name FROM employees b
	
LEFT JOIN a ON a.emp_no = b.emp_no
LEFT JOIN departments c ON a.dept_no = c.dept_no;

--5.
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--6.
WITH a AS 
	(SELECT dept_no, emp_no FROM dept_manager
	UNION
	SELECT dept_no, emp_no FROM dept_emp)
	SELECT b.emp_no, b.last_name, b.first_name, c.dept_name FROM employees b
	
LEFT JOIN a ON a.emp_no = b.emp_no
LEFT JOIN departments c ON a.dept_no = c.dept_no
where c.dept_name = 'Sales';

--7.
WITH a AS 
	(SELECT dept_no, emp_no FROM dept_manager
	UNION
	SELECT dept_no, emp_no FROM dept_emp)
	SELECT b.emp_no, b.last_name, b.first_name, c.dept_name FROM employees b
	
LEFT JOIN a ON a.emp_no = b.emp_no
LEFT JOIN departments c ON a.dept_no = c.dept_no
where c.dept_name = 'Sales' or c.dept_name = 'Development';

--8.
SELECT last_name, COUNT(last_name) as "name_count" FROM employees 
GROUP BY last_name
ORDER BY "name_count"
DESC;
