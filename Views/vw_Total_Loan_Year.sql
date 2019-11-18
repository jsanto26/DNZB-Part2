/********************************************************************************************
NAME: [dbo].[vw_Total_Loan_Year]
PURPOSE: Create the view [dbo].[vw_Total_Loan_Year]
SUPPORT: Jose Santos
	  
MODIFICATION LOG:
Ver   Date        Author    Description
----  ----------  -------   -----------------------------------------------------------------
1.0   11/03/2019  JoseSantos  1. Built this script to create the view [dbo].[vw_Total_Loan_Year].
RUNTIME: 
1 min
NOTES: 
How much are the loans in years (2019, 2018, 2017, 2016)?
LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
********************************************************************************************/

--1) How much are the loans in years (2019, 2018, 2017, 2016)?

CREATE VIEW vw_Total_Loan_Year
AS
     SELECT DISTINCT 
            ad.branch_id
          , b.branch_desc AS Branch_desc
          , SUM(ad.loan_amt) AS Total_Loan
          , YEAR(as_of_date) AS Year
       FROM tblAccountDim AS ad
            INNER JOIN
            dbo.tblBranchDim AS b ON b.branch_id = ad.branch_id
            INNER JOIN
            dbo.tblAccountFact AS af ON ad.acct_id = af.acct_id
      WHERE YEAR(af.as_of_date) IN
                                  (
                                   2019
                                 , 2018
                                 , 2017
                                 , 2016
                                  )
      GROUP BY branch_desc
             , YEAR(as_of_date)
             , ad.branch_id;



