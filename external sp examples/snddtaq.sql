create or replace procedure cmpsys.snddta (
  In dqName   char(10),
  In dqLib    char(10),
  In dqData   char(40)
)

language rpgle
specific cmpsys.snddta
not deterministic
no sql
called on null input
external name 'cmpsys/snddtaq1'
parameter style general with nulls;