set path "cmpsys";
create or replace procedure cmpsys.populate_data_queue()

language rpgle
specific popdtaq
deterministic
No SQL
called on null input

external name 'cmpsys/popdtaq1';

