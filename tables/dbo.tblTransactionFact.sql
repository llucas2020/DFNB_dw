/*****************************************************************************************************************
NAME:    dbo.tblTransactionFact
PURPOSE: Create the dbo.tblTransactionFact table

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

ALTER TABLE [dbo].[tblTransactionFact] DROP CONSTRAINT [FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id]
GO

ALTER TABLE [dbo].[tblTransactionFact] DROP CONSTRAINT [FK_tblTransactionFact_branch_id_tblBranchDim_branch_id]
GO

/****** Object:  Table [dbo].[tblTransactionFact]    Script Date: 4/7/2021 5:16:01 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTransactionFact]') AND type in (N'U'))
DROP TABLE [dbo].[tblTransactionFact]
GO

/****** Object:  Table [dbo].[tblTransactionFact]    Script Date: 4/7/2021 5:16:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTransactionFact](
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL,
	[tran_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tblTransactionFact] PRIMARY KEY CLUSTERED 
(
	[tran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblTransactionFact]  WITH CHECK ADD  CONSTRAINT [FK_tblTransactionFact_branch_id_tblBranchDim_branch_id] FOREIGN KEY([branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO

ALTER TABLE [dbo].[tblTransactionFact] CHECK CONSTRAINT [FK_tblTransactionFact_branch_id_tblBranchDim_branch_id]
GO

ALTER TABLE [dbo].[tblTransactionFact]  WITH CHECK ADD  CONSTRAINT [FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id] FOREIGN KEY([tran_type_id])
REFERENCES [dbo].[tblTransactionTypeDim] ([tran_type_id])
GO

ALTER TABLE [dbo].[tblTransactionFact] CHECK CONSTRAINT [FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id]
GO


