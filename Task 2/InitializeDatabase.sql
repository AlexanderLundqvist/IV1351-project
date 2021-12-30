--------------------------------------------------------------------------------
------------- Tables involving the human actors in the model -------------------
--------------------------------------------------------------------------------

-- Soundgood music school
INSERT INTO soundgood_music_school (available_spots, street, city, zip_code)
  VALUES
    (35, 'Storgatan 27', 'Stockholm', 11455);

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
    (198202229210, 'Rickard', 'Amar', 39, 'Dackebacken 24', 'Södertälje', 10704, 0748491779, 'amarone@live.se'); -- Parent

-- Instructors
INSERT INTO instructor (employment_id, ensemble_teacher, instructor_expertise, personaldata_id, soundgood_music_school_id)
  VALUES
    ('KM123', FALSE, 'Guitar, piano', (SELECT id from personaldata WHERE personal_number = '197304115156'), 1),
    ('BL420', FALSE, 'Saxophone, bagpipe', (SELECT id from personaldata WHERE personal_number = '198406182581'), 1),
	  ('SD531', FALSE, 'Flute, bazoon', (SELECT id from personaldata WHERE personal_number = '198712270924'), 1),
    ('TP666', TRUE, 'Piano, guitar, flute, drums, violin', (SELECT id from personaldata WHERE personal_number = '196909138375'), 1);

-- Admin staff
INSERT INTO administrative_staff (personaldata_id, soundgood_music_school_id)
  VALUES
    ((SELECT id from personaldata WHERE personal_number = '196507052139'), 1),
    ((SELECT id from personaldata WHERE personal_number = '196806174179'), 1);

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
    (0, (SELECT id from personaldata WHERE personal_number = '201312095888'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197611275585'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200911274021'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198004051237'))),
    (1, (SELECT id from personaldata WHERE personal_number = '201103140039'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197307025221'))),
    (2, (SELECT id from personaldata WHERE personal_number = '200902032436'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197307025221'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200210280297'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198110302166'))),
    (1, (SELECT id from personaldata WHERE personal_number = '200711138821'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197002083146'))),
    (0, (SELECT id from personaldata WHERE personal_number = '200004219987'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '197002083146'))),
    (2, (SELECT id from personaldata WHERE personal_number = '200809160776'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '195906137713'))),
    (1, (SELECT id from personaldata WHERE personal_number = '200605237981'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '195906137713'))),
    (1, (SELECT id from personaldata WHERE personal_number = '200808190783'), (SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata WHERE personal_number = '198202229210')));



--------------------------------------------------------------------------------
------------------ Tables for the objects in the model -------------------------
--------------------------------------------------------------------------------

-- Instruments
INSERT INTO rental_instrument_inventory (id, type_of_instrument, instrument_brand, number_in_stock, soundgood_music_school_id)
  VALUES
	 (00, 'flute', 'Jupiter', 5, 1),
	 (00, 'guitar', 'Les Paul', 6, 1),
	 (00, 'bagpipe', 'Mctavish', 4, 1),
	 (00, 'saxophone', 'Jupiter', 6, 1),
	 (00, 'violin', 'Stradivarius', 7, 1);

-- Pricing scheme
INSERT INTO pricing_scheme (soundgood_music_school_id, price_of_group_lesson, price_of_individual_lesson, beginner_surcharge, intermediate_surcharge, advanced_surcharge)
  VALUES
    (1, 50, 80, 1.0, 1.2, 1.5);

-- Sibling discount
INSERT INTO sibling_discount (soundgood_music_id, discount_rate)
  VALUES
    (1, 0.8);

-- Bookings
INSERT INTO bookings (student_id, lesson_date, time_start, time_end, administrative_staff_id)
  VALUES
	((SELECT id from student_id WHERE student_id = 0000),'2021-10-12','14:00', '16:00' (SELECT id from administrative_staff_id WHERE administrative_staff_id = 0000));

-- Music lessons
INSERT INTO music_lesson (room_number, lesson_date, time_start, time_end, bookings_id, instructor_id)
  VALUES
  ('0001', '2021-10-12', '15:00', '16:00',(SELECT id from bookings_id WHERE student_id = 0000), (SELECT id from instructor_id WHERE employment_id = 'KM123'));

INSERT INTO individual_lesson (music_lesson_id, student_id, type_of_instrument)
  VALUES
    ((SELECT id from music_lesson_id WHERE bookings_id = 0000), (SELECT id from student_id WHERE student_id = 0000), 'Guitar');

INSERT INTO group_lesson (music_lesson_id, type_of_instrument, minimum_number_of_students, maximum_number_of_students)
  VALUES
    ((SELECT id from music_lesson_id WHERE bookings_id = 0000), (SELECT id from student_id WHERE student_id = 0000), 'Guitar', 2, 6);


INSERT INTO ensemble (music_lesson_id, genre, minimum_number_of_students, maximum_number_of_students)
  VALUES
	((SELECT id from music_lesson_id WHERE bookings_id = 0000), 'Jazz', 8, 21);

--------------------------------------------------------------------------------
----------- Tables such as invoices, contracts or applications -----------------
--------------------------------------------------------------------------------

-- Instructor payments
INSERT INTO instructor_salary (amount_of_individual_lessons, amount_of_group_lessons, amount_of_ensemble_lessons, total_income, instructor_id, month)
  VALUES
  (6, 3, 4, 20000, (SELECT id from instructor_id WHERE employment_id = 'KM123'), 'October');

-- Application form
INSERT INTO application_form (type_of_instrument, level_of_skill, soundgood_music_school_id, student_id)
  VALUES
	('Guitar', 'Intermediate', 1, (SELECT id from student_id WHERE student_id = 0000));

-- Lease contract
INSERT INTO lease_contract (type_of_instrument, contract_start_date, contract_end_date, student_id)
  VALUES
	('Guitar', '2021-09-01', '2022-06-30', (SELECT id from student_id WHERE student_id = 0000));

-- Student payments
INSERT INTO student_invoice (amount_of_individual_lessons, amount_of_group_lessons, amount_of_ensemble_lessons, total_price, month, student_id)
  VALUES
	(7,3,3, 710, 'October', (SELECT id from student_id WHERE student_id = 0000));
