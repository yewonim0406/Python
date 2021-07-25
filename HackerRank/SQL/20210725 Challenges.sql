/* Challenges */

-- 2021.07.25.Sun
-- Basic Join
-- Subquery, Agg function, Top n query

SELECT h.hacker_id, h.name, COUNT(*) cnt
  FROM hackers h
  JOIN challenges c
    ON h.hacker_id = c.hacker_id
 GROUP BY h.hacker_id, h.name
HAVING COUNT(*) = (SELECT cnt   -- 가장 많은 challenge를 성공한 사람은 모두 출력
                     FROM (SELECT COUNT(*) cnt 
                             FROM challenges 
                            GROUP BY hacker_id
                            ORDER BY COUNT(*) DESC)
               WHERE ROWNUM=1)
    OR COUNT(*) in (SELECT cnt  -- (성공한 challenge 수가 MAX보다 작으면) challenge 수가 unique한 사람만 출력
                      FROM (SELECT COUNT(*) cnt
                              FROM challenges 
                             GROUP BY hacker_id)
                     GROUP BY cnt
                    HAVING COUNT(cnt) = 1)
 ORDER BY cnt DESC, h.hacker_id;
 
 
 /* 1. challenge count가 MAX인 것은 모두 출력 
        -> cnt = MAX(cnts)는 모두 출력해야함  
        -> Subquery(ORDER BY DESC)와 WHERE ROWNUM = 1 이용
    2. challenge count가 MAX 보다 작으면, unique한 count만 출력해야 함
        -> COUNT(cnt) = 1인 cnt만 가져옴 */
    
