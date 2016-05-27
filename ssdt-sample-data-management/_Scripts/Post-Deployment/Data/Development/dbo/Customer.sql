SET IDENTITY_INSERT [dbo].[Customer] ON;

MERGE INTO [dbo].[Customer] AS Target
USING (VALUES
  (1,'Brancroft Associates','BA')
 ,(2,'Thompson Builders, Inc.','TB')
 ,(3,'Saul Goodman & Associates','SG')
) AS Source ([Id],[Name],[Code])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND EXISTS(
	SELECT Source.Name, Source.Code
		EXCEPT
	SELECT Target.Name, Target.Code
) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [Code] = Source.[Code]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name],[Code])
 VALUES(Source.[Id],Source.[Name],Source.[Code]);

 SET IDENTITY_INSERT [dbo].[Customer] ON;