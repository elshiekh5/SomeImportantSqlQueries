SELECT 
    IDENT_SEED(TABLE_SCHEMA+'.'+TABLE_NAME) AS Seed,
    IDENT_INCR(TABLE_SCHEMA+'.'+TABLE_NAME) AS Increment,
    IDENT_CURRENT(TABLE_SCHEMA+'.'+TABLE_NAME) AS Current_Identity,
    TABLE_SCHEMA+'.'+TABLE_NAME,
	TABLE_SCHEMA AS 'SCHEMA',
    'DBCC CHECKIDENT('+'''' + TABLE_SCHEMA+'.'+TABLE_NAME +'''' + ', RESEED, ' + CAST(IDENT_SEED(TABLE_SCHEMA+'.'+TABLE_NAME) AS VARCHAR(10)) + ')'
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
     OBJECTPROPERTY(OBJECT_ID(TABLE_SCHEMA+'.'+TABLE_NAME), 'TableHasIdentity') = 1
    AND  TABLE_TYPE = 'BASE TABLE'
	 AND TABLE_SCHEMA ='Surveys'

	 DBCC CHECKIDENT ('[EducationalPlan].[Units]', RESEED, 0);