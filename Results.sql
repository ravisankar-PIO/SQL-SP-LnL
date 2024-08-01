-- STORED PROCEDURE
-----------------------------------------------------------------------------------------------
-- Populate Department Table - No Parameters
select * from cmpsys.department;
call cmpsys.populate_department_table(); -- Populate 5 department records
select * from cmpsys.department;
stop;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Check the Catalog Tables
select  * from    qsys2.sysprocs
where   specific_schema = 'CMPSYS';
stop;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Insert Employee
delete from cmpsys.employee where empno = '1001';
select * from cmpsys.employee where empno = '1001';
call cmpsys.InsertEmployee('1001', 'Ravisankar', 'P', 'Pandian', 15);
stop;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Retrieve the Senior Most Employee's Name and DOB
create or replace variable cmpsys.mychar30 char(30);
create or replace variable cmpsys.mydate date;
call cmpsys.RetrieveSeniorEmployee('939',cmpsys.mychar30, cmpsys.mydate);
values(cmpsys.mychar30, cmpsys.mydate);
stop;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Retrieve the result set of all the employee details for the given dept.
call cmpsys.getspecemp('939');
stop;
-----------------------------------------------------------------------------------------------

-- Data Queue
-------------------------------------------------------------------------------------
-- UDF
-------------------------------------------------------------------------------------

select  * from    qsys2.sysfuncs
where   specific_schema = 'CMPSYS';

call cmpsys.snddta('CMPDTAQ', 'CMPSYS', 'Shkr')
;

call cmpsys.rcvdta('CMPDTAQ', 'CMPSYS', cmpsys.mychar40)
;




delete from cmpsys.employee
where empno = '1001'
;

call cmpsys.insemp('1001', 'Ravisankar', 'P', 'Pandian', 15)
;

select * from cmpsys.department
where
;

call cmpsys.getspecemp('514');
