/*****************************************************************************************************************
NAME:    HowToCreateMS_Description.sql
PURPOSE: How to Create MS_Description
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/03/2021   llucas2020       1. Created MS_Descrption of Columns and tables.
RUNTIME: 
Approx. 0 sec
NOTES:
This is an example of how to create a custom propery named MS_Description which is widely used to
document schemas, tables, and fields in SQL Server. Can also be used to document contraints, indexes, 
and defualts. See any table in AdventureWorks for an example.
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


-- Q1: How to use dynamic SQL to write SQL for me?
-- A1: Here is a simple example...

-- This example is for the Tables

SELECT t.TABLE_SCHEMA 
      ,t.TABLE_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Position Dimension table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + t.TABLE_NAME + ''';' 
as sql1
  FROM INFORMATION_SCHEMA.TABLES as t
 WHERE t.TABLE_TYPE = 'BASE TABLE'
   AND t.TABLE_SCHEMA = 'dbo'
ORDER BY 1,2;


 -- Adapt the script above to use INFORMATION_SCHEMA.COLUMNS for the Columns

 SELECT c.TABLE_SCHEMA 
      ,c.TABLE_NAME
	  ,c.COLUMN_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Position Dimension table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + c.TABLE_NAME + ''', , @level2type=N''COLUMN'',@level2name=N''' + c.COLUMN_NAME + ''';' 
as sql1
  FROM INFORMATION_SCHEMA.COLUMNS as c
 WHERE c.TABLE_SCHEMA = 'dbo'
ORDER BY 1,2;

-- Q2: What does the final output look like for this stored procedure that I need to execute?
-- A2: Here it is - copy and paste from the data grid that results from the prior query

-- Tables
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Data for Project 1' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Data for Project 2' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2';

-- Columns
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Area ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_area_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Address ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_add_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Address Latitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_add_lat';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Address Longitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_add_lon';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Address Type' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_add_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Code' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Descending' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_desc';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Latitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_lat';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Branch Longitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_branch_lon';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Customer Role ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_cust_role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account ID2' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_id2';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account ID3' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_id3';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Region ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_region_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account Relationship ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'acct_rel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'As of Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'as_of_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Birth Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'birth_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Branch ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'branch_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Close Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'close_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Current Balance' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cur_bal';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Address ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_add_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Address Latitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_add_lat';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Address Longitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_add_lon';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Address Type' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_add_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer ID2' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_id2';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Latitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_lat';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Longitude' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_lon';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Primary Branch District' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_pri_branch_dist';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Relationship ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_rel_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Customer Since Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'cust_since_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'First Name' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'first_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Gender' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'gender';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Last Name' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'last_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Loan Amount' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'loan_amt';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Open Close Code' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'open_close_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Open Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'open_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Primary Branch ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'pri_branch_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Primary Customer ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'pri_cust_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Product ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p1',  @level2type=N'COLUMN',@level2name=N'prod_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Account ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'acct_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Branch ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'branch_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Current Customer Request Index' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'cur_cust_req_ind';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Amount' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_amt';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Date' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_date';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Fee Amount' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_fee_amt';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Fee Percent' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_fee_prct';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Time' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Type Code' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_type_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Type Descending' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_type_desc';
EXEC sys.sp_addextendedproperty @name=N'MS_Description',   @value=N'Transaction Type ID' ,   @level0type=N'SCHEMA',@level0name=N'dbo',   @level1type=N'TABLE',@level1name=N'stg_p2',  @level2type=N'COLUMN',@level2name=N'tran_type_id';