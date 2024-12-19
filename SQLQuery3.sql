
SELECT * FROM EMPLOYEES ----- Parent Table-----
SELECT * FROM DEPARTMENTS -----CHILD Table-----

INSERT INTO EMPLOYEES VALUES (104, 'Aman', '2023-02-09', 39900, 'Chennai' ), (105, 'Oliver', '2023-03-09',45000, 'Texas'), (106,'Steve' ,'2023-03-25',54000, 'Tokyo')

INSERT INTO DEPARTMENTS VALUES (10, 'HR', 'GOA', 101),
 (20, 'ADMIN', 'MUMBAI',102),
 (30, 'FINANCE', ' PUNE',103),
 (40, 'SALES', 'CHANDIGARH',104),
 (50, 'MEDIA', 'DELHI', 105),
 (60, 'DATA', 'NOIDA', 106)

 ----salary < 50000, 5% bonus
 ----salary > 50000, 7% bonus
 ----Dept_Name = FINANCE, 10% Bonus

 select EMP_ID,EMP_ID,SALARY,
 case
 when SALARY < 50000 then SALARY * 1.05
 when  SALARY> 50000 then SALARY * 1.07
 when EMP_ID = 103 then SALARY * 1.1
 end as New_Salary
 from EMPLOYEES