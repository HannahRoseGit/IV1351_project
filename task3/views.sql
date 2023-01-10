-- first view 

-- part one
create view counting_lessons_per_month as select extract(month from date)as month, count(*) from Lesson where extract(year from date)='2022'
 group by extract(month from date) order by extract(month from date) ASC;
 -- part two
create view counting_lessons_per_month_type as select type,count(*) as number, extract(month from date) as month from lesson
 where extract(year from date)='2022' group by month,type;
 
 -- -------------------------------------------
 
  -- second view
  
  -- helper view
 create view student_sibling_info as select sibling.id as id, hassibling,siblingid from sibling full outer join siblinglist 
 on sibling.id=siblinglist.id;
 
 -- the main view 
 create view counting_siblings as 
 select sibling_count as number_of_siblings, count(sibling_count) as count 
 from (
 select id, case
 when hassibling=FALSE then 0
 when (count(id)=1 and hassibling=TRUE) then 1
 when (count(id)=2 and hassibling=TRUE) then 2 end
 as sibling_count from student_sibling_info group by id,hassibling
 ) as subquery
 group by sibling_count order by sibling_count desc;
 

 -- --------------------------------------------
 
 -- third view 
 create view instructors_at_risk as select instructorid, 
 count(instructorid) as number_of_classes from lesson 
 group by instructorid having count(instructorid)>2;
 
 -- --------------------------------------------
 
 -- fourth view
 create materialized view ensemble_weekly_schedule as select lessonid, genre, 
 to_char(date,'Day') as weekday, date,case when current_students=maxseats 
 then 'the ensemble is full' when current_students=maxseats-1 then '1 seat left' 
 when current_students=maxseats-2 then '2 seats left' else 'more than 2 seats left' 
 end as empty_seats from ensemble where date_trunc('week',date)=date_trunc('week',now()) + interval '1 week' 
 order by genre,weekday;
 
 -- --------------------------------------------
 
 -- historical database
 select * into lesson_historical_db from 
 (select * from lessons full join lesson_person on lesson.lessonid = lesson_person.lessonid) as subquery;