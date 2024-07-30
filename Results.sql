-------------------------------------------------------------------------------------
-- Stored Procedure
-------------------------------------------------------------------------------------
call cmpsys.popemp();
select count(1) from cmpsys.EMPLOYEE;
delete from cmpsys.EMPLOYEE;
select * from cmpsys.employee;

-- Check the Catalog Tables
select  * from    qsys2.sysprocs
where   specific_schema = 'CMPSYS';

-- Populate Table
select * from cmpsys.department;
call cmpsys.popdept();

-- Insert Employee
delete from cmpsys.employee where empno = '1001';
select * from cmpsys.employee where empno = '1001';
call cmpsys.insemp('1001', 'Ravisankar', 'P', 'Pandian', 15);

-- Retrieve Employee
create variable cmpsys.fname char(12);
create variable cmpsys.lname char(15);
create variable cmpsys.dname char(36);
call cmpsys.retemp('1001', cmpsys.fname, cmpsys.lname, cmpsys.dname);
values (cmpsys.fname, cmpsys.lname, cmpsys.dname);

-- Result Set
call cmpsys.getspecemp('377');

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