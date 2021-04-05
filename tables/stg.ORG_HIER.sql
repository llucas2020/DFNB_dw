/*****************************************************************************************************************
NAME:    stg.ORG_HIER
PURPOSE: Create the Organizational Hierarchy table


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

/****** Object:  Table [stg].[ORG_HIER]    Script Date: 4/5/2021 5:07:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stg].[ORG_HIER]') AND type in (N'U'))
DROP TABLE [stg].[ORG_HIER]
GO

/****** Object:  Table [stg].[ORG_HIER]    Script Date: 4/5/2021 5:07:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[ORG_HIER](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](25) NOT NULL,
	[region_id] [smallint] NOT NULL,
	[region_desc] [varchar](25) NOT NULL,
	[area_id] [smallint] NOT NULL,
	[area_desc] [varchar](25) NOT NULL
) ON [PRIMARY]
GO


