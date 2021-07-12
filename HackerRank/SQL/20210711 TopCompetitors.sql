/* Top Competitors */

-- 2021.07.11.Mon
-- https://www.hackerrank.com/challenges/full-score/problem
-- Basic Join
-- JOIN

ELECT b.hacker_id,
       b.name 
  FROM submissions a
  JOIN hackers b
    ON a.hacker_id = b.hacker_id
  JOIN challenges c
    ON a.challenge_id = c.challenge_id
  JOIN difficulty d
    ON c.difficulty_level = d.difficulty_level
 WHERE d.score = a.score
 GROUP BY b.hacker_id, b.name
 HAVING COUNT(*) > 1
 ORDER BY COUNT(*) DESC, hacker_id;
 
 /* join을 할 때는 조인 조건을 잘 생각해야 한다. 
    1. 처음에 submissions 테이블과 hacker_id 테이블을 연결할 때 아무생각없이 hacker_id로 연동을 함 -> challengers_id로 연결해야 했음*/
