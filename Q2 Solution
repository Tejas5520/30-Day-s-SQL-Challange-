 create table mountain_huts 
	 (id integer not null,
	 name varchar(40) not null,      
	 altitude integer not null,      
	 unique(name),      
	 unique(id));

 create table trails 
	 (hut1 integer not null,      
	 hut2 integer not null);


insert into mountain_huts 
	(id ,name,altitude) 
	 values 
	(1, 'Dakonat', 1900),
    (2, 'Natisa', 2100),
	(3, 'Gajantut', 1600),
	(4, 'Rifat', 782),
	(5, 'Tupur', 1370); 

insert into trails
    (hut1,hut2)
values
 (1, 3),(3, 2),(3, 5),(4, 5) ,(1, 5); 

--Now as the tables are created to get all the data in one table we will join mountain hut with trails table 
With cte_trails1 as
		(select t1.hut1 as start_hut, h1.name as start_hut_name
		 ,h1.altitude as start_hut_altitude, t1.hut2 as end_hut
		from mountain_huts h1
		join trails t1 on t1.hut1 = h1.id),
	cte_trails2 as
		(select t2.*, h2.name as end_hut_name, h2.altitude as end_hut_altitude
		, case when start_hut_altitude > h2.altitude then 1 else 0 end as altitude_flag
		from cte_trails1 t2
		join mountain_huts h2 on h2.id = t2.end_hut),
	cte_final as
		(select case when altitude_flag = 1 then start_hut else end_hut end as start_hut
		, case when altitude_flag = 1 then start_hut_name else end_hut_name end as start_hut_name
		, case when altitude_flag = 1 then end_hut else start_hut end as end_hut
		, case when altitude_flag = 1 then end_hut_name else start_hut_name end as end_hut_name
		from cte_trails2)
select c1.start_hut_name as startpt
, c1.end_hut_name as middlept
, c2.end_hut_name as endpt
from cte_final c1
join cte_final c2 on c1.end_hut = c2.start_hut;
