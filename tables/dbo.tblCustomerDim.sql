/*****************************************************************************************************************
NAME:    dbo.tblCustomerDim
PURPOSE: Create the dbo.tblCustomerDim table

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

ALTER TABLE [dbo].[tblCustomerDim] DROP CONSTRAINT [FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id]
GO

ALTER TABLE [dbo].[tblCustomerDim] DROP CONSTRAINT [FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id]
GO

/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 4/7/2021 5:12:24 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCustomerDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblCustomerDim]
GO

/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 4/7/2021 5:12:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomerDim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[pri_branch_id] [smallint] NOT NULL,
	[cust_pri_branch_dist] [decimal](7, 2) NOT NULL,
	[cust_add_id] [int] NOT NULL,
	[cust_lat] [decimal](16, 12) NOT NULL,
	[cust_lon] [decimal](16, 12) NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblCustomerDim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id] FOREIGN KEY([cust_add_id])
REFERENCES [dbo].[tblAddressDim] ([add_id])
GO

ALTER TABLE [dbo].[tblCustomerDim] CHECK CONSTRAINT [FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id]
GO

ALTER TABLE [dbo].[tblCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id] FOREIGN KEY([pri_branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO

ALTER TABLE [dbo].[tblCustomerDim] CHECK CONSTRAINT [FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id]
GO


