-- 1 --
SELECT class.CLASS_CODE, course.COURSE_NAME, pro.EMP_FNAME, pro.EMP_LNAME, COUNT(*) AS "NUM_STU" 
FROM class
JOIN course ON course.COURSE_CODE = class.COURSE_CODE
JOIN professor AS pro ON pro.EMP_NUM = class.EMP_NUM
JOIN enroll AS en ON en.CLASS_CODE = class.CLASS_CODE
where class.CLASS_SECTION = 3
GROUP BY class.CLASS_CODE;

-- 2 --
select c.CLASS_CODE , COURSE_NAME
from  class c
left outer join course co on c.COURSE_CODE = co.COURSE_CODE
left outer join enroll e on e.CLASS_CODE = c.CLASS_CODE
left join student s on s.STU_NUM = e.STU_NUM
group by c.CLASS_CODE
having count(s.STU_NUM) =0
order by CLASS_CODE asc;

-- 3 -- 
select STU_FNAME as firstname, STU_LNAME as lastname , STU_NUM as id
from student
where STU_FNAME like "C%"
UNION ALL
select EMP_FNAME, EMP_LNAME , EMP_NUM 
from professor
where EMP_FNAME like "C%";

-- 4 --
select COURSE_CODE
from class c
where CLASS_SECTION = 1 and COURSE_CODE not in(select COURSE_CODE from class where CLASS_SECTION=2)
order by COURSE_CODE

-- 5 --
select distinct STU_FNAME
from student
where STU_FNAME in (select EMP_FNAME from professor)
order by STU_FNAME asc;

-- 6 --
select STU_FNAME, STU_LNAME, STU_GPA
from student
where STU_GPA > (select avg(STU_GPA)
from student where DEPT_CODE = "MATH")
order by STU_GPA desc;


-- 7 -- 
CREATE VIEW vw_topstudents AS
SELECT STU_NUM, STU_FNAME, STU_LNAME, STU_GPA, DEPT_CODE
FROM student s1
WHERE STU_GPA = 
		(SELECT MAX(STU_GPA) AS STU_GPA
        FROM student s2
        WHERE s1.DEPT_CODE = s2.DEPT_CODE)
ORDER BY DEPT_CODE ASC;
SELECT * FROM vw_topstudents;

