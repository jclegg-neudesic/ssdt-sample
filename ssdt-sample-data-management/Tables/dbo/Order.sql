CREATE TABLE [dbo].[Order]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[CustomerId] INT NOT NULL,
	[Number] NVARCHAR(50) NOT NULL, 
    [Date] DATE NOT NULL CONSTRAINT [DF_dbo_Order_Date] DEFAULT (CAST(SYSUTCDATETIME() AS DATE)), 
    [ModifiedOn] DATETIME2 NULL CONSTRAINT [DF_dbo_Order_ModifiedOn] DEFAULT (SYSUTCDATETIME()), 
    [CreatedOn] DATETIME2 NULL CONSTRAINT [DF_dbo_Order_CreatedOn] DEFAULT (SYSUTCDATETIME()), 
    CONSTRAINT [PK_dbo_Order] PRIMARY KEY CLUSTERED ([Id]),
	CONSTRAINT [FK_dbo_Order_Customer_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer]([Id])
);
GO

CREATE UNIQUE INDEX [AK_dbo_Order_Number] ON [dbo].[Order]([Number] ASC) INCLUDE ([Id], [CustomerId], [Date]);
