 /* New Companies */
 
 -- 2021.07.06.Tue
 -- https://www.hackerrank.com/challenges/the-company/problem
 -- Advanced Select
 -- COUNT(DISTINCT), (INNTER) JOIN
 
 SELECT a.company_code, a.founder,
        b.cnt_lead_managers,
        b.cnt_senior_managers,
        b.cnt_managers,
        b.cnt_employees
  FROM company a
  JOIN (SELECT company_code, 
               COUNT(DISTINCT lead_manager_code) cnt_lead_managers,
               COUNT(DISTINCT senior_manager_code) cnt_senior_managers,
               COUNT(DISTINCT manager_code) cnt_managers,
               COUNT(DISTINCT employee_code) cnt_employees
          FROM employee
         GROUP BY company_code) b
    ON a.company_code = b.company_code
 ORDER BY a.company_code;
 
 
 /* 1. 총 5개의 Table이 존재하지만, 제일 마지막 테이블인 Employee 테이블에 lead manager, senior manager, manager에 대한 정보도 모두 담겨 있다. 
    2. company 테이블과 employee 테이블로 원하는 결과를 도출할 수 있음. 
    3. COUNT를 그대로 사용하게 되면, 각 매니저들의 고유한 코드를 카운팅하는 것이 아닌 전체 row의 수를 카운트 하기 때문에 COUNT(DISTINCT)를 사용해주어야 함 */
