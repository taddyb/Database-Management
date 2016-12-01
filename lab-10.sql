
select *
from Prerequisites
order by courseNum DESC;

----------------------------------------------------
----------------------------------------------------

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumber int 	:=1;
   resultset REFCURSOR 	:=2;
begin
   open resultset for 
	select preReqNum
	from Prerequisites 
	where courseNum = courseNumnber;
   return resultset;
  end;
  $$
  language plpgsql;

  -------------------------------------
 create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumber int 	:=1;
   resultset REFCURSOR 	:=2;
begin
   open resultset for 
	select courseNum
	from Prerequisites 
	where preReqNum = 308;
   return resultset;
  end;
  $$
  language plpgsql;
   -------------------------------------

   create or replace function Jedi(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumber int 	:=1;
   resultset REFCURSOR 	:=2;
begin
	if PreReqsFor(courseNumber, 'results')
	then execute procedure;
	Else
	Rollback;
	End if;
end;
$$
language plpgsql;
----------------------------------------------------
----------------------------------------------------

select PreReqsFor(499, 'results');
Fetch all from results;

select IsPreReqFor(499, 'results');
Fetch all from results;