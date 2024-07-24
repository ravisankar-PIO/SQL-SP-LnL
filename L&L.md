## Understanding SP and SQL functions
### What
- A stored procedure in DB2 is a compiled program that can execute SQL statements. It is stored only on the server where the database resides. 
- But don't we already have STRSQL for running sql statements?
- Stored Procedure can be called/invoked from any application program or command line. Just like a DB2 database that can be accessed by other technologies like NodeJS, Java or Python, the stored procedure can also be accessed by other technologies.

### Why
- Reduce network traffic.
- Locks (for file updates) are not held across the network transmissions.
- Centralized code. No need to keep multiple copies of report generation across the application.

## How
- Write a simple Stored Procedure

## Creating SQL User-defined Functions (UDF)
- Create a simple UDF for date conversion
User-defined functions (UDFs) in SQL are routines that can be invoked from within other SQL statements and return a value or a table⁴. They are created using the `CREATE FUNCTION` statement⁶⁹. UDFs can be scalar (returning a single value) or table-valued (returning a table of data)⁶⁸. They are useful for encapsulating common calculations or complex queries⁶.

## Implementing internal and external Stored Procedures
- Create a simple SP for populating the data into a dummy table
- Create a simple ESP for calling a RPGLE program
Stored procedures in SQL are compiled programs that can execute SQL statements¹². They are created using the `CREATE PROCEDURE` statement. Stored procedures can accept parameters and return results¹². They can encapsulate many SQL statements into a single message to the DB2 server, reducing network traffic².

## Enabling Performance Optimization on View and Indexes
Performance optimization on views and indexes in SQL inv

olves techniques like creating and maintaining indexes optimally¹⁵, designing indexes for faster query performance, and using advanced strategies like filtered indexes, indexed views, and include columns¹⁷. Proper index ma
intenance can improve query performance and reduce resource consumption¹⁵.

## Processing Multiple Records in SQL Stored Procedure
- Cursors
Processing multiple records in a stored procedure can be achieved by using techniques like `APPLY` functionality (cross apply, outer apply), or by passing multiple values into a stored procedure. This allows the stored procedure to act on multiple records at once, improving efficiency.
## Use Cases of Stored Procedures
- using front end
## Exploring New Db2 Features like Arrays, Data Area Accessibility, and Sequence Creation
Db2 has introduced several new features and enhancements that address a wide variety of business requirements. These include support for geospatial data types, enhanced access to data sources in a Federation Server environment, numerous SQL performance enhancements, and improvements to BLU Acceleration.

## Tips for SP Development, Including Code Block, Conditional Loop Maintenance, and Readable Code
Writing clean, maintainable, and readable code is crucial for successful software development. This includes using meaningful variable and function names, proper indentation and formatting, eliminating code duplication, and using automated tools to identify and remove unused code¹¹¹². Conditional statements in programming are used to control the flow of a program based on certain conditions¹³.

## Discovering New Custom Data Type Creation
Creating custom data types can be achieved in various programming languages. For example, in Python, you can use the `class` keyword to define a custom data type. In SQL Server, you can use the `CREATE TYPE` statement to create a custom data type. Custom data types can help to make your code more efficient, readable, and maintainable.
