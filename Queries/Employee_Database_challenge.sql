-- deliverable 1
select e.emp_no, e.first_name, e.last_name,
	   t.title, t.from_date, t.to_date
into retirement_titles
from employees as e
inner join titles as t
	on (e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name, last_name, title

INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

select count(ut.emp_no), ut.title
into retiring_titles
from unique_titles as ut
group by title
order by count(title) desc;

-- deliverable 2

select distinct on(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, 
				   de.from_date, de.to_date, t.title
into mentorship_eligibility
from employees as e
left outer join dept_emp as de
	on (e.emp_no = de.emp_no)
left outer join titles as t
	on (e.emp_no = t.emp_no)
where (e.birth_date between '1965-01-01' and '1965-12-31')
order by emp_no;