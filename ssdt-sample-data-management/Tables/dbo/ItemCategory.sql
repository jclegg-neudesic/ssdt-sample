﻿CREATE TABLE [dbo].[ItemCategory]
(
	[Id] INT NOT NULL IDENTITY(1,1), 
    [Name] NVARCHAR(255) NOT NULL,
	CONSTRAINT [PK_dbo_ItemCategory] PRIMARY KEY CLUSTERED ([Id])
)
