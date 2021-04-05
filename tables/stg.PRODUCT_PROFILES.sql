/*****************************************************************************************************************
NAME:    stg.PRODUCT_PROFILES 
PURPOSE: Create the Product Profiles table


MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       04/05/2021   LLUCAS2020   1. Built this script for IT 243 & created table

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

USE [DFNB3]
GO

/****** Object:  Table [stg].[PRODUCT_PROFILES]    Script Date: 4/5/2021 4:48:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stg].[PRODUCT_PROFILES]') AND type in (N'U'))
DROP TABLE [stg].[PRODUCT_PROFILES]
GO

/****** Object:  Table [stg].[PRODUCT_PROFILES]    Script Date: 4/5/2021 4:48:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[PRODUCT_PROFILES](
	[prod_id] [smallint] NOT NULL,
	[prod_code] [varchar](10) NOT NULL,
	[prod_desc] [varchar](50) NOT NULL,
	[revolve_ind] [varchar](1) NOT NULL,
	[loan_amt_lmt] [numeric](20, 4) NOT NULL
) ON [PRIMARY]
GO


