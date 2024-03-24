-- Table: Logs
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 
-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.
  
-- Example 1:
-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.

-- Write your PostgreSQL query statement below
WITH t1 AS (SELECT num , LAG(num) OVER(ORDER BY id ASC) AS lag , 
                   LEAD(num) OVER(ORDER BY id ASC) AS lead
            FROM Logs
           )
SELECT DISTINCT(num) AS ConsecutiveNums
FROM t1 
WHERE num = lag AND lag = lead

--solution2
-- SELECT DISTINCT(a2.num) AS ConsecutiveNums
-- FROM Logs a1 , Logs a2 , Logs a3
-- WHERE a2.id = a1.id -1 AND
--       a2.id = a3.id +1 AND
--       a2.num = a1.num AND
--       a1.num = a3.num
  
