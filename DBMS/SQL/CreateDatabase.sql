--
-- PostgreSQL database for Soundgood Music School
--

-- Created by: Alexander Lundqvist & Max Dern
-- Date: 23-11-2021

--
-- Pre-work on the database before loading
--

------------------------------------
-- Creating table for instructor
------------------------------------

DROP TABLE IF EXISTS "person";

CREATE TABLE "person" (
    "SSN" serial NOT NULL,
    "first_name" VARCHAR(30),
    "last_name" VARCHAR(30),
    "person_number" VARCHAR(12) UNIQUE,
    "age" INT,
    "email" VARCHAR(50) UNIQUE,
    "phone_number" VARCHAR(20) UNIQUE,
    "street" VARCHAR(30),
    "zip_code" VARCHAR(10),
    "city" VARCHAR(20),
    PRIMARY KEY ("SSN")
);

------------------------------------
-- Creating table for instructor
------------------------------------

DROP TABLE IF EXISTS "student";

CREATE TABLE "student" (
  "student_id" INT NOT NULL,
  "SSN" INT NOT NULL,
  FOREIGN KEY (SSN) REFERENCES person(SSN)
);

------------------------------------
-- Creating table for instructor
------------------------------------

DROP TABLE IF EXISTS "instructor";

CREATE TABLE "instructor" (
  "instructor_id" INT NOT NULL,
  "SSN" INT NOT NULL,
  FOREIGN KEY (SSN) REFERENCES person(SSN)
);

------------------------------------
-- Creating table for instructor
------------------------------------

DROP TABLE IF EXISTS "parent";

CREATE TABLE "parent" (

);

------------------------------------
-- Creating table for instructor
------------------------------------

DROP TABLE IF EXISTS "instructor";

CREATE TABLE "" (

);
