-- 2021.07.06.Tue
-- https://www.hackerrank.com/challenges/occupations/problem
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
