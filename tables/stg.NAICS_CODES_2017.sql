
USE [DFNB3]
GO

--DROP TABLE [stg].[NAICS_CODES_2017]
--GO
/****** Object:  Table [stg].[NAICS_CODES_2017]    Script Date: 3/27/2021 6:53:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[NAICS_CODES_2017] (
    [seq_no] [float] NULL,
    [2017_NAICS_US_Code] [float] NULL,
    [2017_NAICS_US_Title] [nvarchar](500) NULL	
) ON [PRIMARY]
GO

