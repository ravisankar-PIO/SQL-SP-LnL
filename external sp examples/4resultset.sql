CREATE PROCEDURE QGPL/MyProc (IN STD_ID_IN CHAR(3))DYNAMIC RESULT SETS 1LANGUAGE SQL SPECIFIC QGPL/MyProc BEGIN DECLARE C1 CURSOR FOR SELECT STD_ID, a.CLASS_ID, CLASS_DESC, TEACHER_ID, GRADE
FROM
QGPL/STUDENT a,
QGPL/CLASS b
WHERE STD_ID = STD_ID_IN and a.CLASS_ID = b.CLASS_ID;
OPEN C1; END ;
Here are the tables referenced by the Stored Procedure:

CREATE TABLE QGPL/STUDENT (


STD_ID CHAR(3),
STD_NAME CHAR(20),
CLASS_ID CHAR(3),
GRADE CHAR(1)) ;

CREATE TABLE QGPL/CLASS (
CLASS_ID CHAR(3),
CLASS_DESC CHAR(20),
TEACHER_ID CHAR(3));
RPG program using the ASSOCIATE LOCATOR and ALLOCATE CURSOR SQL statements

The following RPG program calls the Stored Procedure above, opens the result set as a cursor, and fetches the rows from the cursor and places them into a data structure array:



D rTranscript S SQLTYPE(RESULT_SET_LOCATOR)

// The data structure is used for fetching data from the cursor

D* SQL Pre-compiler will convert this definition to 20I 0
D
D* Data fields:
D Std_Id S 3
D Class_Id S 3
D Class_Desc S 20
D Teacher_Id S 3
D Grade S 1
C
/Free
// SQL diagnostics area replaces the SQLCA:
EXEC SQL SET OPTION SQLCA = *NO;

// Invoke procedure that has 1 result set

Exec SQL CALL MYPROC('S01'); // Stored procedure

// Did the procedure return a result set?
If SQLCODE <> 466;
Dsply 'No data was found.';
*INLR = *Off;
Return;
EndIf;

// ALLOCATE CURSOR is used to link the result set with a cursor.
Exec SQL
ASSOCIATE RESULT SET LOCATOR
(:rTranscript)
WITH PROCEDURE MyProc;

// ALLOCATE CURSOR statement is used for each result set. The cursor names can be different from the cursor names in the stored procedure.

Exec SQL
ALLOCATE Transcript CURSOR
FOR RESULT SET :rTranscript;

// Fetch record and put values into host variables:
EXEC SQL FETCH Transcript INTO :Std_Id, :Class_Id, :Class_Desc,
:Teacher_Id, :Grade;

DoU SQLCode = 100; // Process result set:
Dsply Class_Desc;
EXEC SQL FETCH Transcript INTO :Std_Id, :Class_Id, :Class_Desc,
:Teacher_Id, :Grade;
EndDo;

// Close cursor
Exec SQL CLOSE Transcript;

*INLR = *Off;
Return;
/End-Free