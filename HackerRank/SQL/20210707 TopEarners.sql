/* TopEarners */

-- 2021.07.07.Wed
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem
-- Top n query, Subquery, 집계 함수

SELECT total_earning, cnt
  FROM (SELECT salary * months total_earning, COUNT(*) cnt
          FROM employee
         GROUP BY salary * months
         ORDER BY 2 DESC)
  WHERE ROWNUM = 1;
  
  
/* 1. Top n qeury를 작성하는 방법은 subquery를 이용하는 방법, FETCH FIRST n ROWS ONLY를 사용하는 방법이 있음
   2. SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY 순서 */
