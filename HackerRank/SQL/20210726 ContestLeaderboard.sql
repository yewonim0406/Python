/* Contest Leaderboard */

-- 2021.07.26. Mon
-- Basic Join
-- Subquery, 집계 함수

SELECT h.hacker_id, h.name, SUM(s.score) total_score
  FROM hackers h
  JOIN (SELECT hacker_id, MAX(score) score
          FROM submissions s
         GROUP BY hacker_id, challenge_id) s
    ON h.hacker_id = s.hacker_id
 GROUP BY h.hacker_id, h.name
HAVING SUM(s.score) > 0
 ORDER BY 3 DESC, 1;
 
 /* 1. 각 챌린지별 가장 높은 점수를 해당 챌린지의 대표 점수로 잡아야 함 */
