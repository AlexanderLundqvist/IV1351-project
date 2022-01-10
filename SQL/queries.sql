-- All types
DROP VIEW IF EXISTS all_lessons;
CREATE VIEW all_lessons AS
SELECT TO_CHAR(music_lesson.time_start, 'month') AS month, Count(*) AS nr_of_lessons
--SELECT EXTRACT(MONTH FROM music_lesson.time_start) AS Month, Count(*) AS nr_of_lessons
FROM music_lesson
--WHERE EXTRACT(YEAR FROM music_lesson.time_start) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE EXTRACT(YEAR FROM music_lesson.time_start) = '2021'
--GROUP BY EXTRACT(MONTH FROM music_lesson.time_start);
GROUP BY TO_CHAR(music_lesson.time_start, 'month')
ORDER BY TO_CHAR(music_lesson.time_start, 'month') DESC;

-- Specific types of lesson
DROP VIEW IF EXISTS specific_lesson;
CREATE VIEW specific_lesson AS
--SELECT EXTRACT(MONTH FROM lesson.time_start) AS month,
SELECT TO_CHAR(lesson.time_start, 'month') AS month,
  COUNT(CASE WHEN lesson_type = 'Individual' THEN 1 END) AS individual_lessons,
  COUNT(CASE WHEN lesson_type = 'Group' THEN 1 END) AS group_lessons,
  COUNT(CASE WHEN lesson_type = 'Ensemble' THEN 1 END) AS ensemble_lessons
FROM music_lesson AS lesson
--WHERE EXTRACT(YEAR FROM lesson.time_start) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE EXTRACT(YEAR FROM lesson.time_start) = '2021'
--GROUP BY EXTRACT(MONTH FROM lesson.time_start)
--ORDER BY EXTRACT(MONTH FROM lesson.time_start);
GROUP BY TO_CHAR(lesson.time_start, 'month')
ORDER BY TO_CHAR(lesson.time_start, 'month') DESC;


-- All types average 12 months
DROP VIEW IF EXISTS average;
CREATE VIEW average AS
SELECT Count(*)::FLOAT / 12 AS average_nr_of_lessons
FROM music_lesson
WHERE EXTRACT(YEAR FROM music_lesson.time_start) = '2021';

--Specific types average 12 months
DROP VIEW IF EXISTS avg_specific_lesson;
CREATE VIEW avg_specific_lesson AS
SELECT EXTRACT(YEAR FROM lesson.time_start) AS year,
  COUNT(CASE WHEN lesson_type = 'Individual' THEN 1 END)::FLOAT / 12 AS individual_lessons,
  COUNT(CASE WHEN lesson_type = 'Group' THEN 1 END)::FLOAT / 12  AS group_lessons,
  COUNT(CASE WHEN lesson_type = 'Ensemble' THEN 1 END)::FLOAT / 12  AS ensemble_lessons
FROM music_lesson AS lesson
WHERE EXTRACT(YEAR FROM lesson.time_start) = '2021'
GROUP BY EXTRACT(YEAR FROM lesson.time_start)
ORDER BY EXTRACT(YEAR FROM lesson.time_start);


-- Instructor workload
DROP MATERIALIZED VIEW IF EXISTS workload;
CREATE MATERIALIZED VIEW workload AS
SELECT * FROM(
SELECT instructor.employment_id, personaldata.first_name, personaldata.last_name, Count(*) as lessons_given
FROM music_lesson
INNER JOIN instructor ON instructor.id = music_lesson.instructor_id
INNER JOIN personaldata ON instructor.personaldata_id = personaldata.id
--WHERE EXTRACT(MONTH FROM music_lesson.time_start) = EXTRACT(MONTH FROM CURRENT_DATE)
WHERE EXTRACT(MONTH FROM music_lesson.time_start) = '12'
GROUP BY employment_id, personaldata.first_name, personaldata.last_name
ORDER BY Count(*) DESC) AS instructor WHERE lessons_given > 1;

-- Available ensemble spots
DROP MATERIALIZED VIEW IF EXISTS ensemble_spots;
CREATE MATERIALIZED VIEW ensemble_spots AS
SELECT ensemble.genre AS genre, EXTRACT(DAY FROM lesson.time_start) as weekday,
(CASE WHEN lesson.amount_of_participants = ensemble.maximum_number_of_students THEN 'Full'
      WHEN (ensemble.maximum_number_of_students - lesson.amount_of_participants) = 1 THEN '1 spot available'
      WHEN (ensemble.maximum_number_of_students - lesson.amount_of_participants) = 2 THEN '2 spots available'
      WHEN (ensemble.maximum_number_of_students - lesson.amount_of_participants) > 2 THEN '3 or more spots available' END)
      AS spots_left
FROM ensemble
INNER JOIN music_lesson AS lesson ON ensemble.music_lesson_id = lesson.id
WHERE EXTRACT(WEEK FROM lesson.time_start) = EXTRACT(WEEK FROM CURRENT_DATE)+1
GROUP BY ensemble.genre, lesson.amount_of_participants, lesson.time_start, ensemble.maximum_number_of_students;
