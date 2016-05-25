CREATE TRIGGER [OrderLine_InsteadOf_Insert]
	ON [dbo].[OrderLine]
	INSTEAD OF INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO [dbo].[OrderLine] ([OrderId], [Line], [ItemId], [Quantity], [Price])
		SELECT a.[OrderId], ROW_NUMBER() OVER (PARTITION BY a.[OrderId] ORDER BY a.[Line]) [Line], [ItemId], [Quantity], [Price]
		FROM (
			SELECT i.[OrderId], 999 [Line], i.[ItemId], i.[Quantity], i.[Price]
			FROM INSERTED i
			UNION ALL
			SELECT 	ol.OrderId
					,ol.Line
					,ol.ItemId
					,ol.Quantity
					,ol.Price
			FROM [OrderLine] ol 
			INNER JOIN INSERTED i
				ON ol.[OrderId] = i.[OrderId]
		) a
		EXCEPT 
		SELECT 	ol.OrderId
				,ol.Line
				,ol.ItemId
				,ol.Quantity
				,ol.Price
		FROM [OrderLine] ol 
		INNER JOIN INSERTED i
			ON ol.[OrderId] = i.[OrderId];
	END
