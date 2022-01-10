# IV1351-project
This repository contains the project in the course IV1351. The project is a design and implementation of a DBMS for the fictional school Sound Good.

## Queries printout:

soundgood=# SELECT * FROM all_lessons;
   month   | nr_of_lessons
-----------+---------------
 october   |             3
 november  |             7
 december  |             4
(3 rows)


soundgood=# SELECT * FROM specific_lesson;
   month   | individual_lessons | group_lessons | ensemble_lessons
-----------+--------------------+---------------+------------------
 october   |                  1 |             2 |                0
 november  |                  3 |             3 |                1
 december  |                  1 |             2 |                1
(3 rows)


soundgood=# SELECT * FROM average;
 average_nr_of_lessons
-----------------------
    1.1666666666666667
(1 row)


soundgood=# SELECT * FROM avg_specific_lesson;
 year | individual_lessons |   group_lessons    |  ensemble_lessons
------+--------------------+--------------------+---------------------
 2021 | 0.4166666666666667 | 0.5833333333333334 | 0.16666666666666666
(1 row)


soundgood=# SELECT * FROM workload;
 employment_id | first_name | last_name | lessons_given
---------------+------------+-----------+---------------
 KM111         | Klas       | Malmskog  |             2
 TP444         | Tage       | Paulsson  |             2
(2 rows)
