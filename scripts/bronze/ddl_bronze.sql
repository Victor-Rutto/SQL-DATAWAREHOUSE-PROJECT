-- The script checks whether the table (object) exists in the DB. 
-- If it exists, it is first droped and then created. 
-- Creating the customer information table - 'bronze.crm_cust_info'
USE DataWarehouse;  -- database where bronze schema lives
GO


IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL -- U - User Defined Object
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
cst_id				INT, 
cst_key				NVARCHAR(50),
cst_firstname		NVARCHAR(50), 
cst_lastname		NVARCHAR(50), 
cst_material_status NVARCHAR(50),
cst_gndr			NVARCHAR(50),
cst_create_date		DATE
);
GO

--Create the production information table - 'broze.crm_prd_info'

IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
prd_id			INT,
prd_key			NVARCHAR(50),
prd_nm			NVARCHAR(50),
prd_cost		INT,
prd_line		NVARCHAR(50),
prd_start_dt	DATETIME, 
prd_end_dt		DATETIME
);
GO

-- Creating the sales details table - 'bronze.crm_sales_details'
IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
sls_ord_num			NVARCHAR(50),
sls_prd_key			NVARCHAR(50),
sls_cust_id			INT,
sls_order_dt		INT,
sls_ship_dt			INT,
sls_due_dt			INT,
sls_sales			INT, 
sls_quantity		INT, 
sls_price			INT
);
GO

-- ===================================================================================

-- Creating the customer information table from erp system - 'bronze.erp_cust'
IF OBJECT_ID ('bronze.erp_cust', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust;
CREATE TABLE bronze.erp_cust (
cid				NVARCHAR (50),
cust_bdate		DATE,
cust_gen		VARCHAR (10)
);
GO

-- Creating the customer location table from erp system - 'bronze.erp_loc'
IF OBJECT_ID ('bronze.erp_loc', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc;
CREATE TABLE bronze.erp_loc (
loc_cid NVARCHAR (50),
loc_cntry VARCHAR (50)
);
GO

-- Creating the product category table from erp system - 'bronze.erp_loc'
IF OBJECT_ID ('bronze.erp_px_cat', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat;
CREATE TABLE bronze.erp_px_cat (
pr_cat_id				VARCHAR (50), 
px_cat_cat				VARCHAR (50),
px_cat_subcat			VARCHAR (50),
px_cat_maintenance		VARCHAR (50)
);
GO

