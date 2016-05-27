SET IDENTITY_INSERT [dbo].[Item] ON;

MERGE INTO [dbo].[Item] AS Target
USING (VALUES
  (1,'Gaming System',1)
 ,(2,'User System',1)
 ,(3,'Workstation',1)
 ,(4,'Video Card',2)
 ,(5,'Sound Card',2)
 ,(6,'Motherboard',2)
 ,(7,'Keyboard',3)
 ,(8,'Mouse',3)
 ,(9,'Precision Mouse',3)
) AS Source ([Id],[Name],[ItemCategoryId])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND EXISTS(
	SELECT Source.Name, Source.ItemCategoryId
		EXCEPT
	SELECT Target.Name, Target.ItemCategoryId) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [ItemCategoryId] = Source.[ItemCategoryId]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name],[ItemCategoryId])
 VALUES(Source.[Id],Source.[Name],Source.[ItemCategoryId]);

 SET IDENTITY_INSERT [dbo].[Item] OFF;