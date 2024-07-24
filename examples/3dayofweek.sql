create or replace procedure cmpsys.getdayofweek(
  in input_date date, 
  out output_day varchar(10)
)
language sql
begin
    set output_day = case dayofweek(input_date)
        when 1 then 'Sunday'
        when 2 then 'Monday'
        when 3 then 'Tuesday'
        when 4 then 'Wednesday'
        when 5 then 'Thursday'
        when 6 then 'Friday'
        when 7 then 'Saturday'
        else 'invalid'
    end;
end;

-- create variable cmpsys.mychar char(10);
-- call cmpsys.getdayofweek('2024-12-08',cmpsys.mychar );
-- values(cmpsys.mychar);