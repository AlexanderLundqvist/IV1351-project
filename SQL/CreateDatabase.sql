DROP TABLE IF EXISTS "personaldata" CASCADE;
DROP TABLE IF EXISTS "soundgood_music_school" CASCADE;
DROP TABLE IF EXISTS "administrative_staff" CASCADE;
DROP TABLE IF EXISTS "instructor" CASCADE;
DROP TABLE IF EXISTS "instructor_salary" CASCADE;
DROP TABLE IF EXISTS "parent" CASCADE;
DROP TABLE IF EXISTS "pricing_scheme" CASCADE;
DROP TABLE IF EXISTS "rental_instrument_inventory" CASCADE;
DROP TABLE IF EXISTS "sibling_discount" CASCADE;
DROP TABLE IF EXISTS "student" CASCADE;
DROP TABLE IF EXISTS "student_invoice" CASCADE;
DROP TABLE IF EXISTS "application_form" CASCADE;
DROP TABLE IF EXISTS "bookings" CASCADE;
DROP TABLE IF EXISTS "lease_contract" CASCADE;
DROP TABLE IF EXISTS "music_lesson" CASCADE;
DROP TABLE IF EXISTS "ensemble" CASCADE;
DROP TABLE IF EXISTS "group_lesson" CASCADE;
DROP TABLE IF EXISTS "individual_lesson" CASCADE;

CREATE TABLE personaldata (
 id SERIAL NOT NULL,
 personal_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(1000),
 last_name VARCHAR(1000),
 age VARCHAR(3),
 street VARCHAR(1000),
 city VARCHAR(1000),
 zip_code VARCHAR(10),
 phone_number VARCHAR(20) NOT NULL,
 email_adress VARCHAR(100) NOT NULL
);

ALTER TABLE personaldata ADD CONSTRAINT PK_personaldata PRIMARY KEY (id);


CREATE TABLE soundgood_music_school (
 id VARCHAR(10) NOT NULL,
 available_spots INT,
 street VARCHAR(1000),
 city VARCHAR(1000),
 zip_code VARCHAR(10)
);

ALTER TABLE soundgood_music_school ADD CONSTRAINT PK_soundgood_music_school PRIMARY KEY (id);


CREATE TABLE administrative_staff (
 id SERIAL NOT NULL,
 personaldata_id INT NOT NULL,
 soundgood_music_school_id VARCHAR(10) NOT NULL
);

ALTER TABLE administrative_staff ADD CONSTRAINT PK_administrative_staff PRIMARY KEY (id);


CREATE TABLE application_form (
 id SERIAL NOT NULL,
 administrative_staff_id INT NOT NULL,
 type_of_instrument VARCHAR(50),
 level_of_skill VARCHAR(20),
 soundgood_music_school_id VARCHAR(10) NOT NULL,
 personaldata_id INT NOT NULL
);

ALTER TABLE application_form ADD CONSTRAINT PK_application_form PRIMARY KEY (id);


CREATE TABLE instructor (
 id SERIAL NOT NULL,
 employment_id VARCHAR(100) NOT NULL,
 ensemble_teacher BOOLEAN,
 instructor_expertise VARCHAR(500),
 personaldata_id INT NOT NULL,
 soundgood_music_school_id VARCHAR(10) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_salary (
 id SERIAL NOT NULL,
 instructor_id INT NOT NULL,
 amount_of_individual_lessons INT,
 amount_of_group_lessons INT,
 amount_of_ensemble INT,
 total_income FLOAT(10),
 month VARCHAR(20)
);

ALTER TABLE instructor_salary ADD CONSTRAINT PK_instructor_salary PRIMARY KEY (id);


CREATE TABLE parent (
 id SERIAL NOT NULL,
 personaldata_id INT NOT NULL
);

ALTER TABLE parent ADD CONSTRAINT PK_parent PRIMARY KEY (id);


CREATE TABLE pricing_scheme (
 soundgood_music_school_id VARCHAR(10) NOT NULL,
 price_of_group_lesson FLOAT(10),
 price_of_individual_lesson FLOAT(10),
 beginner_surcharge FLOAT(10),
 intermediate_surcharge FLOAT(10),
 advanced_surcharge FLOAT(10)
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (soundgood_music_school_id);


CREATE TABLE rental_instrument_inventory (
 id SERIAL NOT NULL,
 type_of_instrument VARCHAR(50),
 instrument_brand VARCHAR(500),
 number_in_stock INT,
 soundgood_music_school_id VARCHAR(10) NOT NULL
);

ALTER TABLE rental_instrument_inventory ADD CONSTRAINT PK_rental_instrument_inventory PRIMARY KEY (id);


CREATE TABLE sibling_discount (
 soundgood_music_school_id VARCHAR(10) NOT NULL,
 discount_rate FLOAT(10)
);

ALTER TABLE sibling_discount ADD CONSTRAINT PK_sibling_discount PRIMARY KEY (soundgood_music_school_id);


CREATE TABLE student (
 id SERIAL NOT NULL,
 instrument_quota INT,
 personaldata_id INT NOT NULL,
 parent_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_invoice (
 id SERIAL NOT NULL,
 student_id INT NOT NULL,
 amount_of_individual_lessons INT,
 amount_of_group_lessons INT,
 amount_of_ensemble INT,
 instrument_fee INT,
 discount FLOAT(10),
 total_price FLOAT(10),
 month VARCHAR(20)
);

ALTER TABLE student_invoice ADD CONSTRAINT PK_student_invoice PRIMARY KEY (id);


CREATE TABLE bookings (
 id SERIAL NOT NULL,
 student_id VARCHAR(100),
 intructor_id INT,
 administrative_staff_id INT,
 lesson_type VARCHAR(20),
 time_start TIMESTAMP(10),
 time_end TIMESTAMP(10)
);

ALTER TABLE bookings ADD CONSTRAINT PK_bookings PRIMARY KEY (id);

CREATE TABLE music_lesson (
 id SERIAL NOT NULL,
 instructor_id INT,
 lesson_type VARCHAR(20),
 room_number VARCHAR(10),
 amount_of_participants INT,
 time_start TIMESTAMP(10),
 time_end TIMESTAMP(10)
);

ALTER TABLE music_lesson ADD CONSTRAINT PK_music_lesson PRIMARY KEY (id);

CREATE TABLE ensemble (
 music_lesson_id INT NOT NULL,
 genre VARCHAR(50),
 minimum_number_of_students INT,
 maximum_number_of_students INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (music_lesson_id);


CREATE TABLE group_lesson (
 music_lesson_id INT NOT NULL,
 type_of_instrument VARCHAR(50),
 minimum_number_of_students INT,
 maximum_number_of_students INT
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (music_lesson_id);


CREATE TABLE individual_lesson (
 music_lesson_id INT NOT NULL,
 student_id INT,
 type_of_instrument VARCHAR(50)
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (music_lesson_id);


CREATE TABLE lease_contract (
 id SERIAL NOT NULL,
 instrument_id INT,
 type_of_instrument VARCHAR(50),
 contract_start_date TIMESTAMP(10),
 contract_end_date TIMESTAMP(10),
 student_id INT NOT NULL
);

ALTER TABLE lease_contract ADD CONSTRAINT PK_lease_contract PRIMARY KEY (id);


ALTER TABLE administrative_staff ADD CONSTRAINT FK_administrative_staff_0 FOREIGN KEY (personaldata_id) REFERENCES personaldata (id);
ALTER TABLE administrative_staff ADD CONSTRAINT FK_administrative_staff_1 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);


ALTER TABLE application_form ADD CONSTRAINT FK_application_form_0 FOREIGN KEY (administrative_staff_id) REFERENCES administrative_staff (id);
ALTER TABLE application_form ADD CONSTRAINT FK_application_form_1 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);
ALTER TABLE application_form ADD CONSTRAINT FK_application_form_2 FOREIGN KEY (personaldata_id) REFERENCES personaldata (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (personaldata_id) REFERENCES personaldata (id);
ALTER TABLE instructor ADD CONSTRAINT FK_instructor_1 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);


ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE music_lesson ADD CONSTRAINT FK_music_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE parent ADD CONSTRAINT FK_parent_0 FOREIGN KEY (personaldata_id) REFERENCES personaldata (id);


ALTER TABLE pricing_scheme ADD CONSTRAINT FK_pricing_scheme_0 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);


ALTER TABLE rental_instrument_inventory ADD CONSTRAINT FK_rental_instrument_inventory_0 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);


ALTER TABLE sibling_discount ADD CONSTRAINT FK_sibling_discount_0 FOREIGN KEY (soundgood_music_school_id) REFERENCES soundgood_music_school (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (personaldata_id) REFERENCES personaldata (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (parent_id) REFERENCES parent (id);


ALTER TABLE student_invoice ADD CONSTRAINT FK_student_invoice_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE bookings ADD CONSTRAINT FK_bookings_0 FOREIGN KEY (intructor_id) REFERENCES instructor (id);
ALTER TABLE bookings ADD CONSTRAINT FK_bookings_1 FOREIGN KEY (administrative_staff_id) REFERENCES administrative_staff (id);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (music_lesson_id) REFERENCES music_lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (music_lesson_id) REFERENCES music_lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (music_lesson_id) REFERENCES music_lesson (id);


ALTER TABLE lease_contract ADD CONSTRAINT FK_lease_contract_0 FOREIGN KEY (instrument_id) REFERENCES rental_instrument_inventory (id);
ALTER TABLE lease_contract ADD CONSTRAINT FK_lease_contract_1 FOREIGN KEY (student_id) REFERENCES student (id);
