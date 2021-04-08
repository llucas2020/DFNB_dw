/*****************************************************************************************************************
NAME:    dbo.tblAddressDim
PURPOSE: Create the dbo.tblAddressDim table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/07/2021   LLUCAS2020    1. Built this table for IT 243


RUNTIME: 

NOTES:
NAICS Code Hierarchy


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE [DFNB3]
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 4/7/2021 4:00:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAddressDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblAddressDim]
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 4/7/2021 4:00:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAddressDim](
	[add_id] [int] NOT NULL,
	[add_lat] [decimal](16, 12) NOT NULL,
	[add_lon] [decimal](16, 12) NOT NULL,
	[add_type] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblAddressDim] PRIMARY KEY CLUSTERED 
(
	[add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


