-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-- INTERNAL STORED PROCEDURES
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Populate Department Table - No Parameters
-----------------------------------------------------------------------------------------------
select * from cmpsys.department;
call cmpsys.populate_department_table(); -- Populate 5 department records
select * from cmpsys.department;
stop;

-----------------------------------------------------------------------------------------------
-- Insert Employee
-----------------------------------------------------------------------------------------------
delete from cmpsys.employee where empno = '1001';
select * from cmpsys.employee where empno = '1001';
call cmpsys.InsertEmployee('1001', 'Ravisankar', 'P', 'Pandian', 15);
stop;


-----------------------------------------------------------------------------------------------
-- Retrieve the Senior Most Employee's Name and DOB
-----------------------------------------------------------------------------------------------
create or replace variable cmpsys.mychar30 char(30);
create or replace variable cmpsys.mydate date;
call cmpsys.RetrieveSeniorEmployee('939',cmpsys.mychar30, cmpsys.mydate);
values(cmpsys.mychar30, cmpsys.mydate);
stop;


-----------------------------------------------------------------------------------------------
-- Retrieve the result set of all the employee details for the given dept.
-----------------------------------------------------------------------------------------------
call cmpsys.getspecemp('939');
stop;


-----------------------------------------------------------------------------------------------
-- Check the Catalog Tables
-----------------------------------------------------------------------------------------------
select  * from    qsys2.sysprocs
where   specific_schema = 'CMPSYS' and routine_body = 'SQL';
stop;





-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-- EXTERNAL STORED PROCEDURES
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Read and Write Data Queue in IBMi via SQL External stored Procedure
-----------------------------------------------------------------------------------------------
call cmpsys.snddta('CMPDTAQ', 'CMPSYS', '1st Line'); -- Write Data Queue Entry
call cmpsys.snddta('CMPDTAQ', 'CMPSYS', '2nd Line');

call cmpsys.rcvdta('CMPDTAQ', 'CMPSYS', cmpsys.mychar40); -- Read Data Queue Entry

values cmpsys.mychar40;
stop;

-- values 'hello' into cmpsys.mychar40;
-----------------------------------------------------------------------------------------------
-- Check the Catalog Tables
-----------------------------------------------------------------------------------------------
select  * from    qsys2.sysprocs
where   specific_schema = 'CMPSYS' and routine_body = 'EXTERNAL';
stop;







-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-- USER DEFINED FUNCTIONS
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Extract the file name from an IFS path
-----------------------------------------------------------------------------------------------
values cmpsys.xtrfile('/usr/scottf/subdir1/subdir2/subdir3/Name.sfx');
stop;

-----------------------------------------------------------------------------------------------
-- Calculate the day of the week for a given date
-----------------------------------------------------------------------------------------------
select firstnme, birthdate, cmpsys.show_day(birthdate) as DAYOFWEEK from cmpsys.employee 
where cmpsys.show_day(birthdate) = 'Sunday';
stop;

-----------------------------------------------------------------------------------------------
-- User Defined Table function to retrieve the list of records from a particular department
-----------------------------------------------------------------------------------------------
select * from table(cmpsys.showdept('939')) 
stop;

-----------------------------------------------------------------------------------------------
-- Check the Catalog Tables
-----------------------------------------------------------------------------------------------
select  * from    qsys2.sysfuncs
where   specific_schema = 'CMPSYS' ;
stop;
