USE [DFNB3]
GO

/****** Object:  Table [dbo].[Nums]    Script Date: 4/7/2021 3:49:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nums]') AND type in (N'U'))
DROP TABLE [dbo].[Nums]
GO

/****** Object:  Table [dbo].[Nums]    Script Date: 4/7/2021 3:49:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nums](
	[n] [int] NOT NULL,
 CONSTRAINT [PK_Nums] PRIMARY KEY CLUSTERED 
(
	[n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


