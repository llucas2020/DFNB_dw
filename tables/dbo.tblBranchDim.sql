/*****************************************************************************************************************
NAME:    dbo.tblBranchDim
PURPOSE: Create the dbo.tblBranchDim table

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

ALTER TABLE [dbo].[tblBranchDim] DROP CONSTRAINT [FK_tblBranchDim_region_id_tblRegionDim_region_id]
GO

ALTER TABLE [dbo].[tblBranchDim] DROP CONSTRAINT [FK_tblBranchDim_branch_add_id_tblAddressDim_add_id]
GO

ALTER TABLE [dbo].[tblBranchDim] DROP CONSTRAINT [FK_tblBranchDim_area_id_tblAreaDim_area_id]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 4/7/2021 4:01:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblBranchDim]') AND type in (N'U'))
DROP TABLE [dbo].[tblBranchDim]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 4/7/2021 4:01:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBranchDim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[branch_add_id] [int] NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
 CONSTRAINT [PK_tblBranchDim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_area_id_tblAreaDim_area_id] FOREIGN KEY([area_id])
REFERENCES [dbo].[tblAreaDim] ([area_id])
GO

ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_area_id_tblAreaDim_area_id]
GO

ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_branch_add_id_tblAddressDim_add_id] FOREIGN KEY([branch_add_id])
REFERENCES [dbo].[tblAddressDim] ([add_id])
GO

ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_branch_add_id_tblAddressDim_add_id]
GO

ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_region_id_tblRegionDim_region_id] FOREIGN KEY([region_id])
REFERENCES [dbo].[tblRegionDim] ([region_id])
GO

ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_region_id_tblRegionDim_region_id]
GO


