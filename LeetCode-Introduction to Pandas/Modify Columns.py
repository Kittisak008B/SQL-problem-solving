# Write a solution to modify the salary column by multiplying each salary by 2.
# The result format is in the following example.

# Example 1:
# Input:
# DataFrame employees
# +---------+--------+
# | name    | salary |
# +---------+--------+
# | Jack    | 19666  |
# | Piper   | 74754  |
# | Mia     | 62509  |
# | Ulysses | 54866  |
# +---------+--------+
# Output:
# +---------+--------+
# | name    | salary |
# +---------+--------+
# | Jack    | 39332  |
# | Piper   | 149508 |
# | Mia     | 125018 |
# | Ulysses | 109732 |
# +---------+--------+
# Explanation:
# Every salary has been doubled.
import pandas as pd

def modifySalaryColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['salary'] = employees['salary']*2
    return employees
  
