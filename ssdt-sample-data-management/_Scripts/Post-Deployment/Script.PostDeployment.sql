PRINT 'Beginning Post-Deployment Script'

PRINT 'Deploying Common Data'
:r Data\Common\dbo\ItemCategory.sql
:r Data\Common\dbo\Item.sql


IF '$(Environment)' = 'Development'
	BEGIN
		PRINT 'Deploying Development Data'
	END

IF '$(Environment)' = 'Development' OR '$(Environment)' = 'Testing'
	BEGIN
		PRINT 'Deploying Development/Testing Data'
		:r Data\Development\dbo\Customer.sql
	END

IF '$(Environment)' = 'Testing'
	BEGIN
		PRINT 'Deploying Testing Data'
	END

IF '$(Environment)' = 'Production'
	BEGIN
		PRINT 'Deploying Production Data'
		:r Data\Development\dbo\Customer.sql
	END