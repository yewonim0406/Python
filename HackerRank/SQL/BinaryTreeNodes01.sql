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
