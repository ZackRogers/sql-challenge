-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries on salaries.emp_no= employees.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select * 
  from employees 
 where hire_date > '1985-12-31' 
       and hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

 SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
 FROM departments
 JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
 JOIN employees ON employees.emp_no = dept_emp.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

 SELECT first_name, last_name, sex
 FROM employees
 WHERE first_name LIKE '%Hercules%'
 AND last_name LIKE '%B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

 SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
 FROM dept_emp
 JOIN departments on departments.dept_no = dept_emp.dept_no
 JOIN employees ON employees.emp_no = dept_emp.emp_no
 AND departments.dept_no = 'd007' ;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

 SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
 FROM dept_emp
 JOIN departments on departments.dept_no = dept_emp.dept_no
 JOIN employees ON employees.emp_no = dept_emp.emp_no
 WHERE departments.dept_no = 'd007'
 OR departments.dept_no = 'd005';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

 SELECT last_name, COUNT(last_name)AS Frequency
FROM employees
GROUP BY last_name
ORDER BY 
COUNT(last_name) DESC