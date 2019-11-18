/********************************************************************************************
NAME: [dbo].[vw_Custtransbranch]
PURPOSE: Create the view [dbo].[vw_Custtransbranch]
SUPPORT: Jose Santos
	  
MODIFICATION LOG:
Ver   Date        Author    Description
----  ----------  -------   -----------------------------------------------------------------
1.0   11/18/2019  Jose Santos  1. Built this script to create the view [dbo].[vw_Custtransbranch].
RUNTIME: 
1 min
NOTES: 
This view connect branch, account, custumer, and differents types of transactions.
LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
********************************************************************************************/
CREATE VIEW vw_Custtransbranch
AS
     SELECT DISTINCT 
            ad.acct_id
          , c.cust_id
          , c.last_name
          , c.gender
          , b.Branch_id
          , b.branch_desc
          , b.region_id
          , b.area_id
          , a.area_desc
          , r.Region_name
          , YEAR(ad.open_date) AS Start_Year
          , ad.open_close_code AS Status_Account
          , DATENAME(M, c.birth_date) AS Birth_month
          , DATEDIFF(Month, c.cust_since_date, GETDATE()) / 12 AS Years_Client
          , DATEDIFF(Month, c.birth_date, GETDATE()) / 12 AS Age
          , tt.tran_type_id
          , tt.tran_type_code
          , tt.tran_type_desc
          , tt.cur_cust_req_ind
          , tf.tran_id
          , tf.tran_date
          , tf.tran_time
          , tf.tran_fee_prct
          , tf.tran_amt
          , tf.tran_fee_amt
       FROM dbo.tblTransactionFact AS tf
            INNER JOIN
            dbo.tblBranchDim AS b ON tf.branch_id = b.branch_id
            INNER JOIN
            dbo.tblTransaction_typeDim AS tt ON tt.tran_type_id = tf.tran_type_id
            INNER JOIN
            dbo.tblAccountDim AS ad ON ad.acct_id = tf.acct_id
            INNER JOIN
            dbo.tblAreaDim AS a ON a.area_id = b.branch_id
            INNER JOIN
            dbo.tblRegionDim AS r ON r.region_id = b.branch_id
            INNER JOIN
            dbo.tblCustomerDim AS c ON c.cust_id = tf.branch_id
      GROUP BY ad.acct_id
             , c.cust_id
             , c.last_name
             , c.gender
             , ad.open_date
             , ad.open_close_code
             , c.birth_date
             , c.cust_since_date
             , c.birth_date
             , b.Branch_id
             , b.branch_desc
             , b.region_id
             , b.area_id
             , a.area_desc
             , r.Region_name
             , tt.tran_type_id
             , tt.tran_type_code
             , tt.tran_type_desc
             , tt.cur_cust_req_ind
             , tf.tran_id
             , tf.tran_date
             , tf.tran_time
             , tf.tran_fee_prct
             , tf.tran_amt
             , tf.tran_fee_amt;