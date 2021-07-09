/* The Report */

-- 2021.07.09.Fri
-- https://www.hackerrank.com/challenges/the-report/problem
-- Basic Join
-- CASE WHEN, LEFT JOIN

SELECT CASE WHEN grade >= 8 THEN name
       END student_name,
       grade,
       marks
  FROM (SELECT a.name name, 
               CASE WHEN a.marks = 100 THEN 10
                    ELSE b.grade 
                END grade, 
               a.marks marks
          FROM students a
          LEFT JOIN grades b
            ON TRUNC(a.marks, -1) = b.min_mark)
 ORDER BY grade DESC, name, marks; 
 
 /* 1. JOIN의 ON 조건을 세울 때 특별히 서로 연결된 PK가 없기 때문에 stuedents의 marks를 1의 자리에서 버림하여 grades의 min_mark와 조인을 하였다.
    2. 이때 100점 학생의 grade를 가져오지 못해 오류가 발생했다.
    3. INNER JOIN이 아닌 LEFT JOIN을 활용하여 100점 짜리 학생의 grade를 null 처리 하게끔 하고, CASE WHEN을 사용하여 10으로 채워주면 된다. */
    
