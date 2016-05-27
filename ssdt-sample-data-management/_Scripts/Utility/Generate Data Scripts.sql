DECLARE @tableCommand NVARCHAR(MAX) = '
IF ''?'' NOT IN (''__RefactorLog'')
	DECLARE @tableName SYSNAME, @schemaName SYSNAME

	SELECT @tableName = PARSENAME(''?'', 1), @schemaName = PARSENAME(''?'', 2)

	BEGIN
		EXEC sp_generate_merge @table_name = @tableName, @schema = @schemaName
	END
'

EXEC sp_msforeachtable @command1 = @tableCommand