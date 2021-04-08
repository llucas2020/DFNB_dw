/*****************************************************************************************************************
NAME:    dbo.tblAccountFact
PURPOSE: Create the dbo.tblAccountFact table

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

ALTER TABLE [dbo].[tblAccountFact] DROP CONSTRAINT [FK_tblAccountFact_acct_id_tblAccountDim_acct_id]
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 4/7/2021 3:59:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccountFact]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccountFact]
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 4/7/2021 3:59:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountFact](
	[as_of_date] [date] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblAccountFact] PRIMARY KEY CLUSTERED 
(
	[as_of_date] ASC,
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAccountFact]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountFact_acct_id_tblAccountDim_acct_id] FOREIGN KEY([acct_id])
REFERENCES [dbo].[tblAccountDim] ([acct_id])
GO

ALTER TABLE [dbo].[tblAccountFact] CHECK CONSTRAINT [FK_tblAccountFact_acct_id_tblAccountDim_acct_id]
GO


