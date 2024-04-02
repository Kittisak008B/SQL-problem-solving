-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

-- Example 1:
-- Input: 
-- Users table:
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | aLice |
-- | 2       | bOB   |
-- +---------+-------+
-- Output: 
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | Alice |
-- | 2       | Bob   |
-- +---------+-------+

-- Write your PostgreSQL query statement below
SELECT user_id, UPPER(SUBSTRING(name, 1, 1)) || LOWER(SUBSTRING(name, 2, LENGTH(name))) as name
FROM Users
ORDER BY user_id 
