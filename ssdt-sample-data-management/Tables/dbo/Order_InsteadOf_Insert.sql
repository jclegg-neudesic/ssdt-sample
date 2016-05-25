CREATE TRIGGER [Order_InsteadOf_Insert]
	ON [dbo].[Order]
	INSTEAD OF INSERT
	AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO [dbo].[Order] ([CustomerId], [Number])
		SELECT 	[CustomerId]
				,CASE 
				WHEN [Number] = 'a' THEN CONCAT('ORD', CONVERT(NVARCHAR(50), SYSUTCDATETIME(), 112), '-', [Code], '-', ROW_NUMBER() OVER (PARTITION BY [CustomerId] ORDER BY [Number] DESC))
				ELSE [Number] END [Number]
		FROM (
			SELECT i.[CustomerId], c.[Code],'a' [Number]
			FROM INSERTED i 
			INNER JOIN [dbo].[Customer] c
				ON i.[CustomerId] = c.[Id]
			UNION ALL
			SELECT 	o.[CustomerId]
					,c.[Code]
					,o.[Number]
			FROM [dbo].[Order] o
			INNER JOIN [dbo].[Customer] c
				ON o.[CustomerId] = c.[Id]
			INNER JOIN INSERTED i
				ON o.[CustomerId] = i.[CustomerId]
					AND o.[Date] = i.[Date]
		) a


		EXCEPT 
		SELECT o.[CustomerId]
			,o.[Number]
		FROM [dbo].[Order] o
		INNER JOIN [dbo].[Customer] c
			ON o.[CustomerId] = c.[Id]
		INNER JOIN INSERTED i
			ON o.[CustomerId] = i.[CustomerId]
				AND o.[Date] = i.[Date]
			;
	END
