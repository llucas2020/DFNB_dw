USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerDim]    Script Date: 4/7/2021 7:31:35 PM ******/
DROP PROCEDURE [dbo].[usp_LoadAccountCustomerDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerDim]    Script Date: 4/7/2021 7:31:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadAccountCustomerDim] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadAccountCustomerDim
PURPOSE: Create and Load the dbo.Nums table
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/07/2021   llucas2020    1. Built this table for LDS BC IT243
RUNTIME: 
Approx. 1 sec
NOTES: 
LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
Example usage...
EXEC dbo.usp_LoadAccountCustomerDim 
   
******************************************************************************************************************/

    BEGIN

        -- 1) Truncate existing data

		TRUNCATE TABLE dbo.tblAccountCustomerDim;

        -- 2) Reload data

		INSERT INTO dbo.tblAccountCustomerDim
		SELECT DISTINCT 
       s.acct_id
     , s.cust_id
     , s.acct_cust_role_id
	FROM dbo.stg_p1 AS s
	ORDER BY 1
        , 2;

        END;

GO


