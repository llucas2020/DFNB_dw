USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHier]    Script Date: 4/7/2021 8:25:40 PM ******/
DROP PROCEDURE [dbo].[usp_LoadOrgHier]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHier]    Script Date: 4/7/2021 8:25:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_LoadOrgHier] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadOrgHier
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
EXEC dbo.usp_LoadOrgHier 
   
******************************************************************************************************************/

   
BEGIN

    -- 1) Truncate existing data

    TRUNCATE TABLE dbo.tblOrgHierDim;

    -- 2) Reload data

    INSERT INTO dbo.tblOrgHierDim
           SELECT DISTINCT 
                  [branch_id], 
                  [branch_code], 
                  [branch_desc], 
                  [region_id], 
                  [region_desc], 
                  [area_id], 
                  [area_desc]
           FROM stg.ORG_HIER
           ORDER BY branch_id;
END;   
GO
