CREATE TABLE employees (
         employee_id INT, 
         employee_name VARCHAR(100)
     );
     CREATE TABLE training_sessions (
         session_id INT, 
         employee_id INT, 
         training_date DATE
     );
     CREATE TABLE projects (
         project_id INT, 
         employee_id INT
     );
     INSERT INTO employees VALUES 
         (1, 'John'), 
         (2, 'Jane'), 
         (3, 'Mark'), 
         (4, 'Lucy');
     INSERT INTO training_sessions VALUES 
         (1, 1, '2022-01-10'), 
         (2, 1, '2021-06-15'), 
         (3, 2, '2023-02-20'), 
         (4, 2, '2021-11-01');
     INSERT INTO projects VALUES 
         (1, 1), 
         (2, 1), 
         (3, 2), 
         (4, 3);


SELECT * FROM EMPLOYEES
SELECT * FROM TRAINING_SESSIONS
SELECT * FROM PROJECTS

/*
Find all employees who have not taken any training sessions in the last year and the number of projects they are currently assigned to.
*/


SELECT e.employee_id, 
       e.employee_name, 
       COUNT(p.project_id) AS current_projects
FROM employees e
LEFT JOIN training_sessions t 
    ON e.employee_id = t.employee_id
LEFT JOIN projects p 
    ON e.employee_id = p.employee_id
WHERE t.training_date < CURRENT_DATE - INTERVAL '1 year'
      OR t.training_date IS NULL
GROUP BY e.employee_id, e.employee_name
HAVING COUNT(DISTINCT p.project_id) > 0;


