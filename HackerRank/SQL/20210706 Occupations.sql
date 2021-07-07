/* Occupations */

-- 2021.07.06.Tue
-- https://www.hackerrank.com/challenges/occupations/problem
-- Advanced Select
-- Subquery, Pivot, 분석함수

SELECT Doctor, Professor, Singer, Actor
  FROM ( SELECT name, 
                occupation,
                ROW_NUMBER() OVER (PARTITION BY occupation
                                   ORDER BY name) rn
           FROM occupations)
  PIVOT (MIN(name) FOR occupation IN('Doctor' AS Doctor,
                                     'Professor' AS Professor,
                                     'Singer' AS Singer,
                                     'Actor' AS Actor))
  ORDER BY 1, 2, 3, 4;
  
  
  
  /* 1. PIVOT을 사용하려면 행의 기준과 열의 기준이 있어야 함
     2. ROW_NUMBER() 분석함수를 통해서 rn을 생성하지 않으면, PIVOT을 돌렸을때 행의 기준이 없기 때문에 모든 사람이 열거되지 않고, 한 줄만 출력됨
     3. PIVOT에서 값에 해당하는 expr은 무조건 집계 함수로 표현이 되어야 한다. -> 문자열의 경우 MIN()등을 사용하면 됨 */
