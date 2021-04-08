/*****************************************************************************************************************
NAME:    dbo.tblAccountCustomerDim
PURPOSE: Create the dbo.tblAccountCustomerDim table

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

ALTER TABLE [dbo].[tblAccountCustomerDim] DROP CONSTRAINT [FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id]
GO

ALTER TABLE [dbo].[tblAccountCustomerDim] DROP CONSTRAINT [FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id]
GO

ALTER TABLE [dbo].[tblAccountCustomerDim] DROP CONSTRAINT [FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id]
GO

/****** Object:  Table [dbo].[tblAccountCustomerDim]    Script Date: 4/7/2021 3:50:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccountCustomerDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccountCustomerDim]
GO

/****** Object:  Table [dbo].[tblAccountCustomerDim]    Script Date: 4/7/2021 3:50:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountCustomerDim](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountCustomerDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC,
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAccountCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id] FOREIGN KEY([acct_cust_role_id])
REFERENCES [dbo].[tblAccountCustomerRoleDim] ([acct_cust_role_id])
GO

ALTER TABLE [dbo].[tblAccountCustomerDim] CHECK CONSTRAINT [FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id]
GO

ALTER TABLE [dbo].[tblAccountCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id] FOREIGN KEY([acct_id])
REFERENCES [dbo].[tblAccountDim] ([acct_id])
GO

ALTER TABLE [dbo].[tblAccountCustomerDim] CHECK CONSTRAINT [FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id]
GO

ALTER TABLE [dbo].[tblAccountCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id] FOREIGN KEY([cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO

ALTER TABLE [dbo].[tblAccountCustomerDim] CHECK CONSTRAINT [FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id]
GO


