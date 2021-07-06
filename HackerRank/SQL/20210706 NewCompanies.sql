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
