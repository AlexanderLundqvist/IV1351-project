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
    (199312095888, 'Ina', 'Heffernon', 28, 'Scheelevägen 36', 'Södertälje', 10847, 0722095927, 'iheffernon0@gmail.com'),
    (200911274021, 'Amelita', 'Bittlestone', 12, 'Roslagsvägen 52', 'Uppsala', 11487, 0729903390, 'abittlestone1@live.se'),
    (200103140039, 'Ilko', 'Romushkin', 20, 'Upplandsgatan 42', 'Stockholm', 10990, 0759801000, 'iromushkin2@yahoo.com'),
    (199902032436, 'Kaile', 'McConnel', 25, 'Gåsvägen 94', 'Uppsala', 11956, 0705276325, 'kmcconnel3@gmail.com'),
    (200210280297, 'Lars', 'Casajuana', 19, 'Lottagatan 21', 'Solna', 11574, 0744782685, 'lcasajuana4@kth.se'),
    (199611138821, 'Corella', 'Binge', 25, 'Klotvägen 25', 'Stockholm', 10375, 0711581646, 'cbinge5@facebook.com'),
    (199704219987, 'Catarina', 'Conachy', 24, 'Nyvägen 86', 'Stockholm', 11936, 0755902262, 'cconachy6@livejournal.com'),
    (199309160776, 'Filberto', 'Omand', 28, 'Lärkgången 30', 'Solna', 10596, 0720643974, 'fomand7@live.se'),
    (200605237981, 'Doralynne', 'Sanderson', 15, 'Tusenleden 92', 'Stockholm', 10952, 0731276549, 'dsanderson8@hotmail.com'),
    (199308190783, 'Briney', 'Amar', 28, 'Dackebacken 24', 'Södertälje', 10704, 0756296922, 'bamar9@gmail.com'),
    (197304115156, 'Klas', 'Malmskog', 48, 'Valhallavägen 53', 'Stockholm', 10321, 0753516585, 'kmalm@gmail.com'), -- Teacher
    (198406182581, 'Britta', 'Larsdotter', 37, 'Kullgatan 31', 'Södertälje', 10831, 0763723697, 'brittalars@gmail.com'), -- Teacher
    (196909138375, 'Tage', 'Paulsson', 52, 'Järvaleden 216', 'Uppsala', 10584, 0736478357, 'tpaul@live.se'), -- Teacher
    (196507052139, 'Ragnar', 'Landsberg', 44, 'Odengatan 75', 'Stockholm', 10237, 0756296922, 'rlandsberg@yahoo.com'), -- Admin
    (195906137713, 'Konrad', 'Sanderson', 58, 'Odengatan 69', 'Stockholm', 10213, 0734525773, 'ksander@yahoo.com'), -- Admin
    (197002083136, 'Loretta', 'Binge', 44, 'Odengatan 12', 'Stockholm', 10357, 0736456434, 'bingeDrink@yahoo.com'); -- Parent

-- Instructors
INSERT INTO instructor (employment_id, ensemble_teacher, instructor_expertise, personaldata_id, soundgood_music_school_id)
  VALUES
    ('AB123', 0, "Guitar, piano", (SELECT id from personaldata_id WHERE personal_number = 197304115156), 1),
    ('RR420', 0, "Saxophone, bagpipe", (SELECT id from personaldata_id WHERE personal_number = 198406182581), 1),
    ('LM666', 1, "Piano, guitar, flute, drums, fiddle", (SELECT id from personaldata_id WHERE personal_number = 196909138375), 1);

-- Admin staff
INSERT INTO administrative_staff (id, personaldata_id, soundgood_music_school_id)
  VALUES
    ((SELECT id from personaldata_id WHERE personal_number = 196507052139), 1),
    ((SELECT id from personaldata_id WHERE personal_number = 195906137713), 1);

-- Parents
INSERT INTO parent (personaldata_id)
  VALUES
    ((SELECT id from personaldata_id WHERE personal_number = 197002083136));

-- Students
INSERT INTO student (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);


--------------------------------------------------------------------------------
------------------ Tables for the objects in the model -------------------------
--------------------------------------------------------------------------------

-- Instruments
INSERT INTO parent (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);

-- Pricing scheme
INSERT INTO parent (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);

-- Pricing scheme
INSERT INTO parent (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);

-- Pricing scheme
INSERT INTO parent (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);

-- Discounts
INSERT INTO parent (id, instrument_quota, personaldata_id, parent_id)
  VALUES
    (1, 0);

--------------------------------------------------------------------------------
----------- Tables such as invoices, contracts or applications -----------------
--------------------------------------------------------------------------------

-- Instructor payments

-- Student payments

-- Lease contract_start_date

-- Application forms

-- Bookings
