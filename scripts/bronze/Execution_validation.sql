-- This is the execution file for the broze layer stored procedure. 
-- When executed, it runs the stored procedure for bulk loading data into the bronze layer. 
-- It also does data validation, but it is advised to run the scripts independently. 


USE DataWarehouse;
GO 

-- DATA LOADING
EXEC bronze.load_bronze

--  DATA VALIDATION. 

--- Run these scripts independently to validate the data. 
select * from bronze.crm_cust_info
select * from bronze.crm_prd_info
select * from bronze.crm_sales_details

select * from bronze.erp_cust
select * from bronze.erp_loc
select * from bronze.erp_px_cat
