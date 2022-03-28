-- Delete all rows in all tables when importing file for easier development
TRUNCATE TABLE soundgood_music_school RESTART IDENTITY CASCADE;
TRUNCATE TABLE personaldata RESTART IDENTITY CASCADE;
TRUNCATE TABLE administrative_staff RESTART IDENTITY CASCADE;
TRUNCATE TABLE instructor RESTART IDENTITY CASCADE;
TRUNCATE TABLE instructor_salary RESTART IDENTITY CASCADE;
TRUNCATE TABLE parent RESTART IDENTITY CASCADE;
TRUNCATE TABLE pricing_scheme RESTART IDENTITY CASCADE;
TRUNCATE TABLE rental_instrument_inventory RESTART IDENTITY CASCADE;
TRUNCATE TABLE sibling_discount RESTART IDENTITY CASCADE;
TRUNCATE TABLE student RESTART IDENTITY CASCADE;
TRUNCATE TABLE student_invoice RESTART IDENTITY CASCADE;
TRUNCATE TABLE application_form RESTART IDENTITY CASCADE;
TRUNCATE TABLE bookings RESTART IDENTITY CASCADE;
TRUNCATE TABLE lease_contract RESTART IDENTITY CASCADE;
TRUNCATE TABLE music_lesson RESTART IDENTITY CASCADE;
TRUNCATE TABLE ensemble RESTART IDENTITY CASCADE;
TRUNCATE TABLE group_lesson RESTART IDENTITY CASCADE;
TRUNCATE TABLE individual_lesson RESTART IDENTITY CASCADE;

--------------------------------------------------------------------------------
------------- Tables involving the human actors in the model -------------------
--------------------------------------------------------------------------------

-- Soundgood music school
INSERT INTO soundgood_music_school (id, available_spots, street, city, zip_code)
  VALUES
    ('SG1337' , 35, 'Storgatan 27', 'Stockholm', 11455);

-- Personal data
INSERT INTO personaldata (personal_number, first_name, last_name, age, street, city, zip_code, phone_number, email_adress)
  VALUES
    (201312095888, 'Ina', 'Heffernon', 8, 'Scheelevägen 36', 'Södertälje', 10847, 0722095927, 'iheffernon0@gmail.com'),
    (200911274021, 'Amelita', 'Bittlestone', 12, 'Roslagsvägen 52', 'Uppsala', 11487, 0729903390, 'abittlestone1@live.se'),
    (201103140039, 'Ilko', 'Romushkin', 10, 'Upplandsgatan 42', 'Stockholm', 10990, 0759801000, 'iromushkin2@yahoo.com'),
    (200902032436, 'Kaile', 'Romushkin', 12, 'Gåsvägen 94', 'Uppsala', 11956, 0705276325, 'kailz3@gmail.com'),
    (200210280297, 'Lars', 'Casajuana', 19, 'Lottagatan 21', 'Solna', 11574, 0744782685, 'lcasajuana4@kth.se'),
    (200711138821, 'Corella', 'Binge', 14, 'Klotvägen 25', 'Stockholm', 10375, 0711581646, 'cbinge5@facebook.com'),
    (200004219987, 'Catarina', 'Binge', 21, 'Nyvägen 86', 'Stockholm', 11936, 0755902262, 'catty6@livejournal.com'),
    (200809160776, 'Filberto', 'Sanderson', 13, 'Lärkgången 30', 'Solna', 10596, 0720643974, 'fomand7@live.se'),
    (200605237981, 'Doralynne', 'Sanderson', 15, 'Tusenleden 92', 'Stockholm', 10952, 0731276549, 'dsanderson8@hotmail.com'),
    (200808190783, 'Briney', 'Amar', 13, 'Dackebacken 24', 'Södertälje', 10704, 0756296922, 'bamar9@gmail.com'),

    (197304115156, 'Klas', 'Malmskog', 48, 'Valhallavägen 53', 'Stockholm', 10321, 0753516585, 'kmalm@gmail.com'), -- Teacher
    (198406182581, 'Britta', 'Larsdotter', 37, 'Kullgatan 31', 'Södertälje', 10831, 0763723697, 'brittalars@gmail.com'), -- Teacher
    (198712270924, 'Saga', 'Dagg', 53, 'Lyckselegatan 33', 'Uppsala', 10162, 0734135514, 'sdagg@gmail.com'), -- Teacher
    (196909138375, 'Tage', 'Paulsson', 53, 'Järvaleden 216', 'Uppsala', 10584, 0736478357, 'tpaul@live.se'), -- Teacher

    (196507052139, 'Ragnar', 'Landsberg', 56, 'Odengatan 75', 'Stockholm', 10237, 0756296922, 'rlandsberg@yahoo.com'), -- Admin
    (196806174179, 'Ronny', 'Setterberg', 53, 'Korkvägen', 'Stockholm', 10627, 0713579757, 'ronnypony@gmail.com'), -- Admin

    (195906137713, 'Konrad', 'Sanderson', 62, 'Tusenleden 92', 'Stockholm', 10952, 0734525773, 'ksander@yahoo.com'), -- Parent
    (197002083146, 'Loretta', 'Binge', 51, 'Odengatan 12', 'Stockholm', 10357, 0736456434, 'bingeDrink@yahoo.com'), -- Parent
    (197307025221, 'Stina', 'Romushkin', 48, 'Upplandsgatan 42', 'Stockholm', 10990, 0729367273, 'stinis@gmail.com'), -- Parent
    (198004051237, 'Göran', 'Bittlestone', 41, 'Roslagsvägen 52', 'Uppsala', 11487, 0732379647, 'gture@gmail.com'), -- Parent
    (197611275585, 'Lisa', 'Heffernon', 45, 'Scheelevägen 36', 'Södertälje', 10847, 0728430627, 'heffer@yahoo.com'), -- Parent
    (198110302166, 'Luisa', 'Casajuana', 40, 'Lottagatan 21', 'Solna', 11574, 0768145814, 'casas@gmail.com'), -- Parent
    (198202229210, 'Rickard', 'Amar', 39, 'Dackebacken 24', 'Södertälje', 10704, 0748491779, 'amarone@live.se'), -- Parent

    (201005301770, 'Hans', 'Flammenwerfer', 11, 'Bättringsvägen 24', 'Stockholm', 10990, 00358403345679, '9gag@meme.se'); -- New student that hasn't been accepted yet

-- Instructors
INSERT INTO instructor (employment_id, ensemble_teacher, instructor_expertise, personaldata_id, soundgood_music_school_id)
  VALUES
    ('KM111', FALSE, 'Guitar, piano', (SELECT id from personaldata WHERE personal_number = '197304115156'), 'SG1337'),
    ('BL222', FALSE, 'Saxophone, bagpipe', (SELECT id from personaldata WHERE personal_number = '198406182581'), 'SG1337'),
	  ('SD333', FALSE, 'Flute, bazoon', (SELECT id from personaldata WHERE personal_number = '198712270924'), 'SG1337'),
    ('TP444', FALSE, 'Piano, guitar, flute, drums, violin', (SELECT id from personaldata WHERE personal_number = '196909138375'), 'SG1337');

-- Admin staff
INSERT INTO administrative_staff (personaldata_id, soundgood_music_school_id)
  VALUES
    ((SELECT id from personaldata WHERE personal_number = '196507052139'), 'SG1337'),
    ((SELECT id from personaldata WHERE personal_number = '196806174179'), 'SG1337');

-- Parents
INSERT INTO parent (personaldata_id)
  VALUES
	  ((SELECT id from personaldata WHERE personal_number = '195906137713')),
    ((SELECT id from personaldata WHERE personal_number = '197002083146')),
    ((SELECT id from personaldata WHERE personal_number = '197307025221')),
    ((SELECT id from personaldata WHERE personal_number = '198004051237')),
    ((SELECT id from personaldata WHERE personal_number = '197611275585')),
    ((SELECT id from personaldata WHERE personal_number = '198110302166')),
    ((SELECT id from personaldata WHERE personal_number = '198202229210'));

-- Students
-- Absolutely terrible WIP but it works
INSERT INTO student (instrument_quota, personaldata_id, parent_id)
  VALUES
    (2, (SELECT id from personaldata WHERE personal_number = '201312095888'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197611275585'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200911274021'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198004051237'))),
    (0, (SELECT id from personaldata WHERE personal_number = '201103140039'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197307025221'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200902032436'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197307025221'))),
    (1, (SELECT id from personaldata WHERE personal_number = '200210280297'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198110302166'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200711138821'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197002083146'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200004219987'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197002083146'))),
    (1, (SELECT id from personaldata WHERE personal_number = '200809160776'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '195906137713'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200605237981'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '195906137713'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200808190783'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198202229210')));



--------------------------------------------------------------------------------
------------------ Tables for the objects in the model -------------------------
--------------------------------------------------------------------------------

-- Instruments
-- Add more information about instruments
INSERT INTO rental_instrument_inventory (type_of_instrument, instrument_brand, instrument_model_number, instrument_name, rented)
  VALUES
  	('Flute', 'Jupiter', 'JS1849349', 'Sonata', FALSE),
    ('Flute', 'Jupiter', 'JS9404592', 'Sonata', FALSE),
    ('Flute', 'Jupiter', 'JS1329310', 'Sonata', TRUE),
    ('Flute', 'Jupiter', 'JO5367742', 'Oiseaux', FALSE),
    ('Flute', 'Jupiter', 'JO3425537', 'Oiseaux', FALSE),
    ('Flute', 'Jupiter', 'JA4326736', 'Anna', FALSE),
    ('Flute', 'Jupiter', 'JA3423437', 'Anna', FALSE),
  	('Guitar', 'Les Paul', 'LS3910499', 'Stratocaster', FALSE),
    ('Guitar', 'Les Paul', 'LS3345529', 'Stratocaster', TRUE),
    ('Guitar', 'Les Paul', 'LS3040591', 'Stratocaster', FALSE),
    ('Guitar', 'Les Paul', 'LM3004194', 'Mjolnir', FALSE),
    ('Guitar', 'Les Paul', 'LM2019485', 'Mjolnir', FALSE),
    ('Guitar', 'Les Paul', 'LM3940194', 'Mjolnir', FALSE),
    ('Guitar', 'Les Paul', 'LF3919450', 'Fender', FALSE),
  	('Bagpipe', 'Mctavish', 'MH3950391', 'Haggis', FALSE),
    ('Bagpipe', 'Mctavish', 'MH3950391', 'Haggis', FALSE),
    ('Bagpipe', 'Mctavish', 'MH3950391', 'Haggis', FALSE),
    ('Bagpipe', 'Mctavish', 'MN3242343', 'Nessie', FALSE),
    ('Bagpipe', 'Mctavish', 'MN5677432', 'Nessie', FALSE),
    ('Bagpipe', 'Mctavish', 'MN4567234', 'Nessie', FALSE),
  	('Saxophone', 'Jupiter', 'JW3819410', 'Whisper', FALSE),
    ('Saxophone', 'Jupiter', 'JW3819410', 'Whisper', FALSE),
    ('Saxophone', 'Jupiter', 'JW3819410', 'Whisper', FALSE),
    ('Saxophone', 'Jupiter', 'JW3819410', 'Whisper', FALSE),
    ('Saxophone', 'Jupiter', 'JE6582170', 'Epic', TRUE),
    ('Saxophone', 'Jupiter', 'JE0401051', 'Epic', FALSE),
    ('Saxophone', 'Jupiter', 'JE5582093', 'Epic', FALSE),
    ('Saxophone', 'Jupiter', 'JG9581884', 'Groovy', FALSE),
  	('Violin', 'Stradivarius', 'SI3918419', 'Inverno', FALSE),
    ('Violin', 'Stradivarius', 'SI1569427', 'Inverno', FALSE),
    ('Violin', 'Stradivarius', 'SP9475154', 'Primavera', FALSE),
    ('Violin', 'Stradivarius', 'SP4486817', 'Primavera', TRUE),
    ('Violin', 'Stradivarius', 'SE4874018', 'Estate', FALSE),
    ('Violin', 'Stradivarius', 'SE9571859', 'Estate', FALSE),
    ('Violin', 'Stradivarius', 'SA8578513', 'Autunno', FALSE),
    ('Violin', 'Stradivarius', 'SA3918419', 'Autunno', FALSE);


-- Pricing scheme
INSERT INTO pricing_scheme (soundgood_music_school_id, price_of_group_lesson, price_of_individual_lesson, beginner_surcharge, intermediate_surcharge, advanced_surcharge)
  VALUES
    ('SG1337', 50, 80, 1.0, 1.2, 1.5);

-- Sibling discount
INSERT INTO sibling_discount (soundgood_music_school_id, discount_rate)
  VALUES
    ('SG1337', 0.8);

-- Bookings
INSERT INTO bookings (student_id, lesson_type, time_start, time_end, administrative_staff_id)
  VALUES
    (1, 'Individual', '2021-10-12 14:00', '2021-10-12 16:00', 1),
    (3, 'Individual', '2021-11-09 15:00', '2021-11-09 16:30', 2),
    (8, 'Individual', '2021-11-09 15:00', '2021-11-12 11:00', 2),
    (3, 'Individual', '2021-10-30 10:00', '2021-10-30 12:30', 1),
	  (3, 'Individual', '2021-12-12 13:30', '2021-12-12 14:30', 2),
    (8, 'Individual', '2022-01-02 15:30', '2022-01-02 17:00', 1),

    (2, 'Group', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (3, 'Group', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (4, 'Group', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (7, 'Group', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (10, 'Group', '2022-01-02 15:30', '2022-01-02 17:00', 1),

    (3, 'Ensemble', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (3, 'Ensemble', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (2, 'Ensemble', '2022-01-02 15:30', '2022-01-02 17:00', 1),
    (7, 'Ensemble', '2022-01-02 15:30', '2022-01-02 17:00', 1);

-- Music lessons
INSERT INTO music_lesson (lesson_type ,room_number, amount_of_participants, time_start, time_end, instructor_id)
  VALUES
    ('Individual', 'A12', 1, '2021-10-12 14:00', '2021-10-12 16:00', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Individual
    ('Individual', 'A02', 1, '2021-11-09 15:00', '2021-11-09 16:30', (SELECT id from instructor WHERE employment_id = 'SD333')), -- Individual
    ('Individual', 'A11', 1, '2021-11-09 15:00', '2021-11-09 11:00', (SELECT id from instructor WHERE employment_id = 'BL222')), -- Individual
    ('Individual', 'A09', 1, '2021-11-30 10:00', '2021-11-30 12:30', (SELECT id from instructor WHERE employment_id = 'SD333')), -- Individual
    ('Individual', 'A01', 1, '2021-12-12 13:30', '2021-12-12 14:30', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Individual
    ('Individual', 'A03', 1, '2022-01-02 15:30', '2022-01-02 17:00', (SELECT id from instructor WHERE employment_id = 'BL222')), -- Individual

    ('Group', 'B10', 4, '2021-10-22 15:30', '2022-10-22 17:00', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Group
    ('Group', 'B11', 6, '2021-11-20 14:30', '2021-11-20 16:30', (SELECT id from instructor WHERE employment_id = 'SD333')), -- Group
    ('Group', 'B05', 3, '2021-12-14 12:00', '2022-12-14 14:30', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Group
    ('Group', 'B01', 4, '2022-01-03 13:30', '2022-01-03 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Group

    ('Ensemble', 'C02', 15, '2021-11-22 12:30', '2021-11-22 16:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C08', 10, '2021-12-20 14:30', '2021-12-20 17:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble

    ('Ensemble', 'C15', 16, '2022-01-17 10:30', '2022-01-17 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
	  ('Ensemble', 'C02', 14, '2022-01-17 12:30', '2022-01-17 16:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C08', 12, '2022-01-17 14:30', '2022-01-17 17:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C15', 15, '2022-01-18 10:30', '2022-01-18 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
	  ('Ensemble', 'C02', 10, '2022-01-18 12:30', '2022-01-18 16:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C08', 16, '2022-01-19 14:30', '2022-01-19 17:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C15', 14, '2022-01-19 10:30', '2022-01-19 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble

    -- Change these to test available spots for next week
    ('Ensemble', 'C15', 15, '2022-01-20 10:30', '2022-01-20 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
	  ('Ensemble', 'C02', 10, '2022-01-20 12:30', '2022-01-20 16:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C08', 16, '2022-01-21 14:30', '2022-01-21 17:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble
    ('Ensemble', 'C15', 14, '2022-01-21 10:30', '2022-01-21 15:00', (SELECT id from instructor WHERE employment_id = 'TP444')), -- Ensemble

    -- Added extra for testing workload
    ('Group', 'B10', 4, '2021-10-22 15:30', '2022-10-22 17:00', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Group
    ('Group', 'B11', 4, '2021-11-22 15:30', '2022-11-22 17:00', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Group
    ('Group', 'B12', 4, '2021-11-22 15:30', '2022-11-22 17:00', (SELECT id from instructor WHERE employment_id = 'KM111')), -- Group
    ('Group', 'B13', 4, '2021-12-22 15:30', '2022-12-22 17:00', (SELECT id from instructor WHERE employment_id = 'KM111')); -- Group

INSERT INTO individual_lesson (music_lesson_id, student_id, type_of_instrument)
  VALUES
    (1, 1, 'Guitar'),
    (2, 3, 'Flute'),
    (3, 8, 'Saxophone'),
    (4, 3, 'Flute'),
    (5, 3, 'Flute'),
    (6, 8, 'Saxophone');

INSERT INTO group_lesson (music_lesson_id, type_of_instrument, minimum_number_of_students, maximum_number_of_students)
  VALUES
    (7, 'Guitar', 2, 4),
    (8, 'Flute', 2, 4),
    (9, 'Guitar', 2, 4),
    (10, 'Violin', 2, 4),

    (24, 'Guitar', 2, 4),
    (25, 'Flute', 2, 4),
    (26, 'Guitar', 2, 4),
    (27, 'Violin', 2, 4);


INSERT INTO ensemble (music_lesson_id, genre, minimum_number_of_students, maximum_number_of_students)
  VALUES
    (11, 'Jazz', 8, 16),
    (12, 'Rock', 8, 16),
	  (13, 'Classical', 8, 16),
	  (14, 'Jazz', 8, 16),
    (15, 'Rock', 8, 16),
	  (16, 'Classical', 8, 16),
	  (17, 'Jazz', 8, 16),
    (18, 'Rock', 8, 16),
	  (19, 'Classical', 8, 16),
    (20, 'Classical', 8, 16),
	  (21, 'Jazz', 8, 16),
    (22, 'Rock', 8, 16),
	  (23, 'Classical', 8, 16);

--------------------------------------------------------------------------------
----------- Tables such as invoices, contracts or applications -----------------
--------------------------------------------------------------------------------

-- Instructor payments
-- Add the amount for different skill levels?
INSERT INTO instructor_salary (instructor_id, amount_of_individual_lessons, amount_of_group_lessons, amount_of_ensemble, total_income, month)
  VALUES
    (1, 6, 3, 0, 20000, 'October'), -- KM111
    (2, 3, 2, 0, 19000, 'October'), -- BL222
    (3, 4, 4, 0, 21000, 'October'), -- SD333
    (4, 2, 3, 4, 20000, 'October'), -- TP444
    (1, 8, 2, 0, 21000, 'November'),
    (2, 3, 6, 0, 22000, 'November'),
    (3, 6, 4, 0, 19000, 'November'),
    (2, 5, 4, 4, 23000, 'November');

-- Application form
INSERT INTO application_form (administrative_staff_id, type_of_instrument, level_of_skill, soundgood_music_school_id, personaldata_id)
  VALUES
	  (1, 'Guitar', 'Beginner', 'SG1337', 1),
    (1, 'Guitar', 'Intermediate', 'SG1337', 2),
    (1, 'Flute', 'Intermediate', 'SG1337', 3),
    (2, 'Guitar', 'Advanced', 'SG1337', 4),
    (2, 'Violin', 'Beginner', 'SG1337', 5),
    (1, 'Bagpipe', 'Beginner', 'SG1337', 6),
    (2, 'Violin', 'Advanced', 'SG1337', 7),
    (1, 'Saxophone', 'Advanced', 'SG1337', 8),
    (1, 'Flute', 'Intermediate', 'SG1337', 9),
    (2, 'Saxophone', 'Intermediate', 'SG1337', 10),
    (2, 'Piano', 'Beginner', 'SG1337', 24); -- Not accepted as student yet

-- Lease contract
INSERT INTO lease_contract (instrument_id, type_of_instrument, contract_start_date, contract_end_date, student_id)
  VALUES
    (3, (SELECT type_of_instrument from rental_instrument_inventory WHERE id = 3), '2021/09/01 13:00:00', '2022/06/01 13:00:00', 1),
    (9, (SELECT type_of_instrument from rental_instrument_inventory WHERE id = 9), '2021/10/10 13:00:00', '2022/10/10 13:00:00', 1),
    (25, (SELECT type_of_instrument from rental_instrument_inventory WHERE id = 25), '2021/09/22 13:00:00', '2022/05/22 13:00:00', 5),
	  (32, (SELECT type_of_instrument from rental_instrument_inventory WHERE id = 32), '2021/08/30 13:00:00', '2022/05/30 13:00:00', 8);

-- Student payments
INSERT INTO student_invoice (student_id, amount_of_individual_lessons, amount_of_group_lessons, amount_of_ensemble, instrument_fee, total_price, month)
  VALUES
    (1, 3, 4, 2, 10, 720, 'December'),
    (2, 2, 4, 3, 10, 770, 'December'),
    (3, 0, 3, 2, 10, 660, 'December'),
    (4, 6, 3, 0, 10, 690, 'December'),
    (5, 0, 2, 5, 10, 740, 'December'),
    (6, 3, 0, 1, 10, 670, 'December'),
    (7, 5, 1, 6, 10, 810, 'December'),
    (8, 8, 0, 0, 10, 800, 'December'),
    (9, 4, 3, 0, 10, 720, 'December'),
    (10, 3, 1, 2, 10, 730, 'December');
