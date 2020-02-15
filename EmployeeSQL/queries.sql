--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.gender as "Gender", (
	select s.salary
	from salaries as s
	where e.emp_no = s.emp_no
) as "Salary"
from employees as e;

--List employees who were hired in 1986.
select * from employees
where hire_date like '1986%';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select m.dept_no as "Department Number", (
	select d.dept_name
	from departments as d
	where d.dept_no = m.dept_no
) as "Department Name", m.emp_no as "Employee Number", (
	select e.last_name
	from employees as e
	where e.emp_no = m.emp_no
) as "Last Name", (
	select e.first_name
	from employees as e
	where e.emp_no = m.emp_no
) as "First Name", m.from_date as "Employment Start Date", m.to_date as "Employment End Date"
from dept_manager as m;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select i.emp_no as "Employee Number", (
	select e.last_name
	from employees as e
	where i.emp_no = e.emp_no
) as "Last Name", (
	select e.first_name
	from employees as e
	where i.emp_no = e.emp_no
) as "First Name", (
	select d.dept_name
	from departments as d
	where d.dept_no = i.dept_no
) as "Department Name"
from dept_emp as i;

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select i.emp_no as "Employee Number", (
	select e.last_name
	from employees as e
	where e.emp_no = i.emp_no
) as "Last Name", (
	select e.first_name
	from employees as e
	where e.emp_no = i.emp_no
) as "First Name", (
	select d.dept_name
	from departments as d
	where d.dept_no = i.dept_no
) as "Department Name"
from dept_emp as i
where i.dept_no in (
	select d.dept_no
	from departments as d
	where d.dept_name = 'Sales'
);

--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
select i.emp_no as "Employee Number", (
	select e.last_name
	from employees as e
	where e.emp_no = i.emp_no
) as "Last Name", (
	select e.first_name
	from employees as e
	where e.emp_no = i.emp_no
) as "First Name", (
	select d.dept_name
	from departments as d
	where d.dept_no = i.dept_no
) as "Department Name"
from dept_emp as i
where i.dept_no in (
	select d.dept_no
	from departments as d
	where d.dept_name = 'Sales' or d.dept_name = 'Development'
);

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name as "Last Name", count(last_name) as "Count"
from employees
group by last_name
order by "Count" desc;