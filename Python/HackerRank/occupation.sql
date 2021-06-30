-- PIVOT, 분석함수(ROW_NUMBER()

SELECT Doctor, Professor, Singer, Actor
  FROM ( SELECT name,
                occupation,
                ROW_NUMBER() OVER ( PARTITION BY occupation
                                        ORDER BY name) rn )
 PIVOT (MIN(name)
        FOR occupation IN('Doctor' AS Doctor,
                          'Professor' AS Professor,
                          'Singer' AS Singer,
                          'Actor' AS Actor))
 ORDER BY 1, 2, 3, 4;
