USE memory.default;

WITH RECURSIVE working(employee_id, last_visited, approvers, cycle_det) AS (
  SELECT 
    employee_id, 
    manager_id, 
    ARRAY[employee_id], 
    FALSE 
  FROM employee
  UNION ALL
  SELECT 
    e.employee_id, 
    e.manager_id, 
    w.approvers || ARRAY[e.employee_id], 
    contains(w.approvers, e.employee_id)
  FROM employee e
  JOIN working w ON w.last_visited = e.employee_id
  WHERE w.cycle_det = FALSE
)
SELECT approvers[1] as employee_id, approvers 
FROM working 
WHERE cycle_det = TRUE
ORDER BY employee_id;
