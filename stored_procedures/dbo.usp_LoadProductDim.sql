USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 4/7/2021 7:22:23 PM ******/
DROP PROCEDURE [dbo].[usp_LoadProductDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 4/7/2021 7:22:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadProductDim] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadProductDim
PURPOSE: Create and Load the dbo.Nums table
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/07/2021   llucas2020     1. Built this table for LDS BC IT243
RUNTIME: 
Approx. 1 sec
NOTES: 
LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
Example usage...
EXEC dbo.usp_LoadProductDim 
   
******************************************************************************************************************/

    BEGIN

        -- 1) Truncate existing data

		TRUNCATE TABLE dbo.tblProductDim;

        -- 2) Reload data

		INSERT INTO dbo.tblProductDim
		SELECT DISTINCT 
       s.prod_id
     , 'Unknown' AS prod_desc
	FROM dbo.stg_p1 AS s
	ORDER BY 1;

        END;

GO


