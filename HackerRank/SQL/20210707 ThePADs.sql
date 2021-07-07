/* The PADs */

-- 2021.07.07.Wed
-- https://www.hackerrank.com/challenges/the-pads/problem
-- Advanced Select
-- UNION ALL(UNION), Subqueary, 집계 함수, CONCAT(||)

SELECT *
  FROM (SELECT name||'('||SUBSTR(occupation, 1, 1)||')' occ
          FROM occupations
         ORDER BY 1)
 UNION ALL
SELECT *
  FROM (SELECT 'There are a total of '||COUNT(*)||
               ' '||LOWER(occupation)||'s.' occ
          FROM occupations
         GROUP BY occupation
         ORDER BY 1);
 
 /* 1. CONCAT을 사용해서 문자를 합치려고 했으나, CONCAT은 두개의 결합밖에 지원하지 않음 -> || 를 사용해서 결합을 진행함
    2. 집계 함수를 사용할때 SELECT 절에 들어가 있는 집계 함수를 제외한 나머지 컬럼은 모두 GROUP BY 절에 포함되어야 하지만, SELECT 절에 없는 컬럼을 GROUP BY에 사용하는 것은 가능함 
    3. 집합 쿼리를 작성할때 ORDER BY절은 마지막에 한번 사용할 수 있다. 이때 정렬하는 컬럼명은 가장 위에 있는 SELECT문의 변수명을 따르게 되어 있음
       -> 위의 SELECT문에 대해서도 정렬이 필요하고, 하래의 SELECT문에 대해서도 정렬이 필요한 상황 => 각각 정렬한 결과까지 묶어서 Sub query로 사용해야 함 */
