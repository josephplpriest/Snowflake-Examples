---> requires minimum role of SYSADMIN
USE ROLE SYSADMIN;

CREATE DATABASE EXAMPLE_DB;

/*  ---> new databases automatically include two schemas:
        PUBLIC: default schema for the db, will be set as active by default when the db as active, 
                unless a schema is specified otherwise
        INFORMATION_SCHEMA: contains view and table functions for getting metadata about the db   */


CREATE SCHEMA DEV_MKT
WITH COMMENT = "marketing team development environment";

CREATE TABLE CUSTOMERS 
(
    full_name STRING,
    id INT,
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

USE WAREHOUSE COMPUTE_WH;

INSERT INTO CUSTOMERS (full_name, id)
VALUES
    ('John Doe', 1),
    ('Jane Smith', 2);

---> 'SELECT *' is generally an antipattern in cloud warehouses as it will do full table scans
---> generally one should specify columns to take advantage of columnar storage and partitioning, and include where clauses if possible
SELECT * FROM CUSTOMERS;

SHOW TABLES;

DROP DATABASE EXAMPLE_DB;