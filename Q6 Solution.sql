create table student_tests
(
	test_id		int,
	marks		int
);

insert into student_tests values(100, 55);
insert into student_tests values(101, 55);
insert into student_tests values(102, 60);
insert into student_tests values(103, 58);
insert into student_tests values(104, 40);
insert into student_tests values(105, 50);

--output 1

select test_id,marks	
from(select *,lag(marks,1,0) over(order by test_id) as previous_marks
	from student_tests) x
where x.marks > x.previous_marks

--Output 2	
	
select test_id,marks	
from(select *,lag(marks,1,marks) over(order by test_id) as previous_marks
	from student_tests) x
where x.marks > x.previous_marks

