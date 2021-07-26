SELECT h.hacker_id, h.name, SUM(s.score)
  FROM hackers h
  JOIN submissions s
    ON h.hacker_id = s.hacker_id
 WHERE s.score = (SELECT MAX(score)
                    FROM submissions
                   WHERE h.hacker_id = hacker_id
                     AND s.challenge_id = challenge_id
                   GROUP BY hacker_id, challenge_id)
 GROUP BY h.hacker_id, h.name                   
HAVING SUM(s.score) > 0                   
 ORDER BY 3 DESC, 1;  
 
 
 SELECT h.hacker_id, h.name, SUM(s.max_score)
  FROM hackers h
  JOIN (SELECT hacker_id, MAX(score) max_score
          FROM submissions
         GROUP BY hacker_id, challenge_id) s
    ON h.hacker_id = s.hacker_id
 GROUP BY h.hacker_id, h.name                   
HAVING SUM(s.max_score) > 0                   
 ORDER BY 3 DESC, 1;  
