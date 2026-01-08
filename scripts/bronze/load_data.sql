-- STORED PROCEDURE FOR LOADING DATA
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @bronze_start_time DATETIME, @bronze_end_time DATETIME;
	BEGIN TRY

		
		SET @bronze_start_time = GETDATE();
		PRINT '=========================================';
		PRINT 'LOADING DATA TO BRONZE';
		PRINT '=========================================';

		-- LOADING SCRIPT
		PRINT'=========================================';
		PRINT 'LOADING DATA FROM CRM';
		--=======================================================
		--               CRM
		--=======================================================
		-- Bulk loading into the customer information table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT 'BULK LOADING: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_crm\cust_info.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK ---- Locks the table when loading, you cannot keep it open
		);
		SET @end_time = GETDATE()

		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @end_time, @start_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';

		-- Bulk loading into the customer information table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT 'BULK LOADING: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_crm\prd_info.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @end_time, @start_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';

		-- Bulk loading into the sales details table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT 'BULK LOADING: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_crm\sales_details.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @end_time, @start_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';
		
		--=============================================================
		--                   ERP
		--=============================================================
		PRINT '=========================================================='
		PRINT 'LOADING DATA FROM ERP';
		PRINT '=========================================================='
		
		-- Bulk loading into the customer details details table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.erp_cust'
		TRUNCATE TABLE bronze.erp_cust;
		PRINT 'BULK LOADING: bronze.erp_cust'
		BULK INSERT bronze.erp_cust
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_erp\CUST_AZ12.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @start_time, @end_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';
		
		
		-- Bulk loading into the product category table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.erp_px_cat'
		TRUNCATE TABLE bronze.erp_px_cat;
		PRINT 'BULK LOADING: bronze.erp_px_cat'
		BULK INSERT bronze.erp_px_cat
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_erp\PX_CAT_G1V2.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @end_time, @start_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';

		
		-- Bulk loading into the location details table.
		SET @start_time = GETDATE();
		PRINT 'TRUNCATING: bronze.erp_loc'
		TRUNCATE TABLE bronze.erp_loc;
		PRINT 'BULK LOADING: bronze.erp_loc'
		BULK INSERT bronze.erp_loc
		FROM "C:\Users\VictorKimutaiRutto\Downloads\SQL Warehouse Project\source_erp\LOC_A101.csv"
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Duration taken: ' + CAST(DATEDIfF(second, @end_time, @start_time) AS VARCHAR) + ' seconds';
		PRINT'---------------------------------------------------------';
	
	SET @bronze_end_time = GETDATE()
	PRINT 'Duration Loading Bronze Layer:' + CAST(DATEDIfF(second, @bronze_start_time, @bronze_end_time) AS VARCHAR) + ' seconds';
	
	END TRY
	
	BEGIN CATCH
	PRINT '======================================================='
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '======================================================='
	END CATCH
END;
