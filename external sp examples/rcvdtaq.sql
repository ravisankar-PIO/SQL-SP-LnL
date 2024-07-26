create or replace procedure cmpsys.rcvdta (
  In dqName   char(10),
  In dqLib    char(10),
  In dqData   char(40)
)

language rpgle
specific cmpsys.rcvdta
not deterministic
no sql
called on null input
external name 'cmpsys/rcvdtaq1'
parameter style general with nulls;