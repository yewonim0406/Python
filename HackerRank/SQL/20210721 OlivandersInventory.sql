/* Olivander's Inventory */

-- 2021.07.21. Wed
-- Basic Join
-- Sub query, JOIN

SELECT w1.id, wp1.age, w1.coins_needed, w1.power
  FROM wands w1
  JOIN wands_property wp1
    ON w1.code = wp1.code
 WHERE wp1.is_evil=0
   AND w1.coins_needed = (SELECT MIN(w.coins_needed) key_coins
                             FROM wands w
                             JOIN wands_property wp
                               ON w.code = wp.code
                            WHERE wp.is_evil = 0
                              AND wp1.age = wp.age
                              AND w1.power = w.power
                            GROUP BY wp.age, w.power)
 ORDER BY w1.power DESC, wp1.age DESC; 
 
 
 
 /* 1. non_evil이면서, age, power 조합이 같은 지팡이 중에서 가장 싼 지팡이를 선택하는 것
    2. 테이블을 만드는 서브쿼리가 아닌 하나의 값(같은 age, power 조합 내에서 가장 싼 지팡이 가격)을 출력하는 서브쿼리가 필요함
    3. WHERE 절에 서브쿼리를 작성할때 메인 쿼리의 테이블의 컬럼을 사용할 수 있음 */
