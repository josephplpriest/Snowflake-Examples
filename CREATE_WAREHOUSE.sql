---> By default, only an SYSADMIN or higher role can create a new warehouse, permission can be granted with custom roles
USE ROLE SYSADMIN;


CREATE WAREHOUSE IF NOT EXISTS EXAMPLE_WH1

WITH

---> each size increase doubles the compute resources (and credits consumed while warehouse runs)
---> XSMALL | SMALL | MEDIUM | LARGE | XLARGE | XXLARGE | XXXLARGE | X4LARGE | X5LARGE | X6LARGE
WAREHOUSE_SIZE = 'XSMALL'

---> 1-10, must be >= than MIN_CLUSTER_COUNT, recommended to set to > 1 for higher availability in enterprise accounts 
MAX_CLUSTER_COUNT = 1

---> 1-10, must be <= than MAX_CLUSTER_COUNT
MIN_CLUSTER_COUNT = 1

---> 'ECONOMY' will favor keeping clusters in multi-cluster warehouse fully loaded, setting only valid for multi-cluster warehouses
-- SCALING_POLICY = STANDARD 

---> defaults to false
INITIALLY_SUSPENDED = TRUE

---> defaults to true
AUTO_RESUME = TRUE

---> number of seconds, setting to 0 or null NEVER suspends the warehouse, not recommended
AUTO_SUSPEND = 600 --600 is the default



COMMENT = 'This is a small, single cluster demo warehouse';


---> other properties include WAREHOUSE_TYPE for snowpark optimization

---> params include MAX_CONCURRENCY_LEVEL, STATEMENT_QUEUED_TIMEOUT_IN_SECONDS, and STATEMENT_TIMEOUT_IN_SECONDS

SHOW WAREHOUSES;