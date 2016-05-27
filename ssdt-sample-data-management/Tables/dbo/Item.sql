CREATE TABLE [dbo].[Item]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[Name] NVARCHAR(255) NOT NULL, 
	[ItemCategoryId] INT NOT NULL, 
	[Color] NVARCHAR(50) NULL, 
	CONSTRAINT [PK_dbo_Item] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [FK_dbo_Item_ItemCategory_ItemCategoryId] FOREIGN KEY ([ItemCategoryId]) REFERENCES [dbo].[ItemCategory]([Id])
)
