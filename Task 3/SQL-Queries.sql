--All types
SELECT EXTRACT(MONTH FROM music_lesson.time_start) AS Month, Count(*) AS nr_of_lessons
FROM music_lesson
WHERE EXTRACT(YEAR FROM music_lesson.time_start) = '2021'
GROUP BY EXTRACT(MONTH FROM music_lesson.time_start);



--Specific types of lesson

CREATE VIEW specific_lesson AS
SELECT EXTRACT(MONTH FROM lesson.time_start) AS Month,

COUNT(*) HAVING lesson_type = 'Individual' AS individual_lessons,
COUNT(*) HAVING lesson_type = 'Group' AS group_lessons,
COUNT(*) HAVING lesson_type = 'Ensemble' AS ensemble_lessons

FROM music_lesson as lesson
WHERE EXTRACT(YEAR FROM lesson.time_start) = '2021'
GROUP BY EXTRACT(MONTH FROM lesson.time_start)
ORDER BY EXTRACT(MONTH FROM lesson.time_start);

WHERE lesson_type = 'Individual'
WHERE lesson_type = 'Group'
WHERE lesson_type = 'Ensemble'

--All types average 12 months

SELECT Count(*)::float / 12 AS average_nr_of_lessons
FROM music_lesson
WHERE EXTRACT(YEAR FROM music_lesson.time_start) = '2021';

--Instructor workload

SELECT * FROM(
SELECT instructor.employment_id, personaldata.first_name, personaldata.last_name, Count(*) as lessons_given
FROM music_lesson
INNER JOIN instructor ON instructor.id = music_lesson.instructor_id
INNER JOIN personaldata ON instructor.personaldata_id = personaldata.id
WHERE EXTRACT(MONTH FROM music_lesson.time_start) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY employment_id, personaldata.first_name, personaldata.last_name
ORDER BY Count(*) DESC)
 AS instructor WHERE lessons_given >1;
