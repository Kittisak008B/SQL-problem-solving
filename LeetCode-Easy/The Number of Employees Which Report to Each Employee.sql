-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.

-- Example 1:
-- Input: 
-- Employees table:
-- +-------------+---------+------------+-----+
-- | employee_id | name    | reports_to | age |
-- +-------------+---------+------------+-----+
-- | 9           | Hercy   | null       | 43  |
-- | 6           | Alice   | 9          | 41  |
-- | 4           | Bob     | 9          | 36  |
-- | 2           | Winston | null       | 37  |
-- +-------------+---------+------------+-----+
-- Output: 
-- +-------------+-------+---------------+-------------+
-- | employee_id | name  | reports_count | average_age |
-- +-------------+-------+---------------+-------------+
-- | 9           | Hercy | 2             | 39          |
-- +-------------+-------+---------------+-------------+
-- Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
-- Example 2:
-- Input: 
-- Employees table:
-- +-------------+---------+------------+-----+ 
-- | employee_id | name    | reports_to | age |
-- |-------------|---------|------------|-----|
-- | 1           | Michael | null       | 45  |
-- | 2           | Alice   | 1          | 38  |
-- | 3           | Bob     | 1          | 42  |
-- | 4           | Charlie | 2          | 34  |
-- | 5           | David   | 2          | 40  |
-- | 6           | Eve     | 3          | 37  |
-- | 7           | Frank   | null       | 50  |
-- | 8           | Grace   | null       | 48  |
-- +-------------+---------+------------+-----+ 
-- Output: 
-- +-------------+---------+---------------+-------------+
-- | employee_id | name    | reports_count | average_age |
-- | ----------- | ------- | ------------- | ----------- |
-- | 1           | Michael | 2             | 40          |
-- | 2           | Alice   | 2             | 37          |
-- | 3           | Bob     | 1             | 37          |
-- +-------------+---------+---------------+-------------+

-- Write your PostgreSQL query statement below
SELECT t1.reports_to employee_id, t2.name name, COUNT(t2.employee_id ) reports_count , 
        ROUND(AVG(t1.age),0) average_age 
FROM Employees t1
JOIN Employees t2
ON t1.reports_to = t2.employee_id 
GROUP BY t1.reports_to , t2.name  
ORDER BY employee_id
