/* Binary Tree Nodes 01 */

-- 2021.07.06.Tue
-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem
-- Advanced Select
-- Subquery, CASE WHEN, CONCAT

SELECT CASE WHEN p IS NULL THEN CONCAT(n, ' Root')
            WHEN n IN (SELECT DISTINCT p FROM bst) 
                 THEN CONCAT(n, ' Inner')
            ELSE CONCAT(n, ' Leaf')
        END
  FROM bst
 ORDER BY n;


/* 1. p가 null인 값은 결국 위에 parent node가 없다는 것 -> Root
   2. 만약 n의 값이 p에도 존재한다면 -> Inner
   3. 그 외의 것 -> Leaf */
