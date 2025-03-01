  
/********************************************************************************************
NAME: DataOutput
PURPOSE: Creating Reports by Output Data
SUPPORT: Jose Santos
	    
MODIFICATION LOG:
Ver   Date        Author    Description
----  ----------  -------   -----------------------------------------------------------------
1.0   11/18/2019  Jose Santos   1. Build Output Data.
RUNTIME: 
1 min
NOTES: 

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
********************************************************************************************/

--1)
SELECT DISTINCT 
       tran_id
     , tran_date
     , tran_time
     , tran_fee_prct
     , tran_fee_amt
     , branch_id
     , acct_id
     , tran_type_id
     , tran_type_code
     , tran_type_desc
     , cur_cust_req_ind
  FROM DFNB2.dbo.vw_Transbranchtotal
 WHERE MONTH(tran_date) IN(06)
 ORDER BY tran_date ASC;

 /********************************************************************************************/
--2)
 SELECT DISTINCT 
       acct_id
     , cust_id
     , last_name
     , gender
     , Branch_id
     , branch_desc
     , region_id
     , area_id
     , Start_Year
     , Status_Account
     , Birth_month
     , Years_Client
     , Age
     , tran_type_id
     , tran_type_code
     , tran_type_desc
     , cur_cust_req_ind
     , tran_id
     , tran_date
     , tran_time
     , tran_fee_prct
     , tran_amt
     , tran_fee_amt
  FROM DFNB2.dbo.vw_Custtransbranch
 ORDER BY tran_id ASC;