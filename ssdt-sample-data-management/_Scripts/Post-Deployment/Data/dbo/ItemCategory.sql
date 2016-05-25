SET IDENTITY_INSERT [dbo].[ItemCategory] ON;

MERGE INTO [dbo].[ItemCategory] AS Target
USING (VALUES
	(1, 'Systems'),
	(2, 'Components'),
	(3, 'Accessories')
) AS Source ([Id],[Name])

ON (
	Target.[Id] = Source.[Id]
)

WHEN MATCHED AND EXISTS(
	SELECT Source.Name
		EXCEPT
	SELECT Target.Name) THEN
UPDATE SET
  [Name] = Source.[Name]

WHEN NOT MATCHED BY TARGET THEN
 INSERT (
	[Id],
	[Name]
 )
 VALUES (
	Source.[Id],
	Source.[Name]
 );

SET IDENTITY_INSERT [dbo].[ItemCategory] OFF;
GO
