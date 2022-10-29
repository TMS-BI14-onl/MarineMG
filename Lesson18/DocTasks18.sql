--1.	Покажите всех менеджеров, которые имеют в подчинении больше 6-ти сотрудников.
SELECT a.MANAGER_ID, b.FIRS_NAME, b.LAST_NAME, COUNT(a.EMPLOYEE_ID) as cnt_employees
FROM EMPLOYEES a JOIN EMPLOYEES b ON a.MANAGER_ID=b.EMPLOYEE_ID
GROUP BY a.MANAGER_ID, b.FIRS_NAME, b.LAST_NAME
HAVING cnt_employees > 6

--2.	Вывести min и max зарплату с вычетом commission_pct для каждого департамента. (commission_pct на базе указывается в процентах). 


SELECT MIN(salary) as min_salary,  MAX(salary) as max_salary
FROM (SELECT(SALARY-(COMMISSION_PCT*SALARY/100)) as salary
FROM EMLOYEES) as T


--3.	Вывести только регион, где работают больше всего людей.

SELECT d.REGION_NAME
FROM (SELECT TOP 1 COUNT([MANAGER_ID]) AS cnt, b.COUNTRY_ID
FROM DEPARTMENTS a JOIN LOCATIONS b ON a.LOCATION_ID=b.LOCATION_ID
GROUP BY b.COUNTRY_ID
ORDER BY cnt DESC) ab JOIN COUNRIES c ON ab.COUNTRY_ID=c.COUNTRY_ID
						JOIN REGIONS d ON c.REGION_ID=d.REGION_ID

--4.	Найдите разницу в процентах между средней зп по каждому департаменту от общей средней (по всем департаментам).


CREATE VIEW V_avg_deP
AS
SELECT AVG(SALARY) avg_dep
FROM EMLOYEES 
GROUP BY DepartmentID
GO
DECLARE @_avg_salary money;
SET @_avg_salary=(SELECT AVG(SALARY)
FROM EMLOYEES )
GO
SELECT ((@_avg_salary - avg_dep)*100/@_avg_salary) as difference_
FROM V_avg_deP



-- 5 Найдите людей, кто проработал больше, чем 10 лет в одном департаменте. 

SELECT FIRST_NAME, LAST_NAME
FROM JOB_HISTORY a JOIN EMLOYEES b ON a.EMLOYEE_ID=b.EMLOYEE_ID
WHERE DATEDIFF(YEAR, [START-DATE, [END_DATE]) > 10


--6.	Найдите людей, кто занимает 5-10 место по размеру зарплаты.  

SELECT FIRST_NAME, LAST_NAME
FROM (SELECT FIRST_NAME, LAST_NAME, SALARY, DENSE_RANK () OVER (ORDER BY SALARY DESC) as d_rnk
FROM EMLOYEES) t
WHERE d_rnk BETWEEN 5 and 10
