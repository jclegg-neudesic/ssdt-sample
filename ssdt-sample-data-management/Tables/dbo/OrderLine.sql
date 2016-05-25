CREATE TABLE [dbo].[OrderLine]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[OrderId] INT NULL,
	[Line] INT NOT NULL, 
    [ItemId] INT NOT NULL, 
    [Quantity] INT NOT NULL, 
    [Price] NUMERIC(15, 2) NOT NULL,
    [ModifiedOn] DATETIME2 NULL CONSTRAINT [DF_dbo_OrderLine_ModifiedOn] DEFAULT (SYSUTCDATETIME()), 
    [CreatedOn] DATETIME2 NULL CONSTRAINT [DF_dbo_OrderLine_CreatedOn] DEFAULT (SYSUTCDATETIME()), 
    CONSTRAINT [PK_dbo_OrderLine] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [FK_dbo_OrderLine_Item_ItemId] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item]([Id]),
	CONSTRAINT [FK_dbo_OrderLine_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order]([Id])
)
