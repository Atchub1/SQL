-- 1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name,
e.gender, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;


-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name,
EXTRACT (YEAR FROM hire_date) AS YEAR 
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments as d
LEFT JOIN dept_manager as m ON
m.dept_no = d.dept_no
LEFT JOIN employees as e ON
e.emp_no = m.emp_no;


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments as d
LEFT JOIN dept_emp as de ON
de.dept_no = d.dept_no 
LEFT JOIN employees as e ON
e.emp_no = de.emp_no
ORDER BY dept_name, last_name, first_name;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d_e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp as d_e
INNER JOIN employees as e ON 
e.emp_no = d_e.emp_no
INNER JOIN departments as d ON 
d.dept_no = d_e.dept_no 
WHERE dept_name = 'Sales'
;


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d_e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp as d_e
INNER JOIN employees as e ON 
e.emp_no = d_e.emp_no
INNER JOIN departments as d ON 
d.dept_no = d_e.dept_no 
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
;


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
Order by count DESC;



