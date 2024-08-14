use Bank_Loan;

select * from bank_data;

                     /* Total loan Application */

select count(id) as total_Loan_application from bank_data;

                     /* Total loan Application MTD(Month to Date) */

select count(id) as MTD_total_Loan_application from bank_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

 --Note -- MOM (Month over Month) diffrence between previos month and recent   MTD-PMTD/PMTD --

 --Total Funded Amount--

 select sum(loan_amount) as MTD_Total_funded_amount from bank_data
 where month(issue_date)=12 and year(issue_date)=2021

 
 select sum(loan_amount) as PMTD_Total_funded_amount from bank_data --PREVIOUS MONTH TO DATE--
 where month(issue_date)=11 and year(issue_date)=2021


--TOTAL AMOUNT RECEIVED--

SELECT SUM(total_payment) as MTD_Total_Amount_received from bank_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date )=2021;

--AVG INTREST RATE--

SELECT round(AVG(int_rate),4) * 100 as PMTD_intrest_rate from bank_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date )=2021;

--AVG DTI--
Select round(avg(dti),4) * 100 as avg_dti from bank_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date )=2021;


--Good Loan Percentage--

select
    (COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then loan_amount END)*100)
	/
	count(id) as Good_loan_percentage from bank_data

--GOOD lOAN APPLICATION --

select
    (COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then loan_amount END)) as Good_loan_percentage from bank_data

--OR--
SELECT COUNT(LOAN_STATUS) AS GOOD_lOAN_APPLICATION
FROM bank_data WHERE loan_status = 'Fully Paid' or loan_status = 'Current';


--Bad Loan Percentage--

select
    (COUNT(case when loan_status = 'Charged Off' then loan_amount END )*100)
	/
	count(id) as Good_loan_percentage from bank_data;





select * from bank_data;

--Good Loan Amount Funded --

SELECT sum(loan_amount) as Good_loan_funded from 
bank_data  WHERE loan_status = 'Fully Paid' or loan_status = 'Current';

--Good Loan Amount Received --

SELECT sum(total_payment) as Good_loan_Received from 
bank_data  WHERE loan_status = 'Fully Paid' or loan_status = 'Current';

--Bad Loan Amount Funded --


SELECT sum(loan_amount) as Good_loan_funded from 
bank_data  WHERE loan_status = 'Charged Off';

--Bad Loan Amount Received --

SELECT sum(total_payment) as Good_loan_Received from 
bank_data  WHERE loan_status ='Charged Off' ;


                  --LOAN STATUS--
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_data
	WHERE month(issue_date) = 12
    GROUP BY
        loan_status;


		--BANK LOAN REPORT | OVERVIEW--

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



               --STATE--
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY address_state
ORDER BY address_state


               --TERM--
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY term
ORDER BY term


		         
--EMPLOYEE LENGTH--
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY emp_length
ORDER BY emp_length


            --PURPOSE--
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY purpose
ORDER BY purpose


  
--HOME OWNERSHIP--
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
GROUP BY home_ownership
ORDER BY home_ownership


--See the results when we hit the Grade A in the filters for dashboards.--
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose


