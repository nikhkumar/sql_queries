CREATE TABLE test.employee
(
    id numeric(5,0) NOT NULL,
    fname character(20) COLLATE pg_catalog."default",
    lname character(20) COLLATE pg_catalog."default",
    age numeric(2,0),
    mgrid numeric(5,0),
    CONSTRAINT employee_pkey PRIMARY KEY (id)
        INCLUDE(id)
);
ALTER TABLE test.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id)
    INCLUDE(id);

-- Find Employee and his/her manager, stored in same table
SELECT e1.id emp_id, e1.fname emp_name, e1.mgrid mgr_id, e2.fname AS mgr_name 
FROM   test.employee e1 
       LEFT JOIN test.employee e2 
       ON e1.mgrid = e2.id
