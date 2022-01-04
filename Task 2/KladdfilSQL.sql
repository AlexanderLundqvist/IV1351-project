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

(0, (SELECT id from personaldata_id WHERE personal_number = 201312095888),

(SELECT id from parent WHERE personaldata_id = (SELECT id from personaldata_id WHERE personal_number = 197611275585)


(0, (SELECT id from personaldata_id WHERE personal_number = 200911274021), (SELECT id from parent WHERE personal_number = 198004051237)),
(1, (SELECT id from personaldata_id WHERE personal_number = 201103140039), (SELECT id from parent WHERE personal_number = 197307025221)),
(2, (SELECT id from personaldata_id WHERE personal_number = 200902032436), (SELECT id from parent WHERE personal_number = 197307025221)),
(0, (SELECT id from personaldata_id WHERE personal_number = 200210280297), (SELECT id from parent WHERE personal_number = 198110302166)),
(1, (SELECT id from personaldata_id WHERE personal_number = 200711138821), (SELECT id from parent WHERE personal_number = 197002083146)),
(0, (SELECT id from personaldata_id WHERE personal_number = 200004219987), (SELECT id from parent WHERE personal_number = 197002083146)),
(2, (SELECT id from personaldata_id WHERE personal_number = 200809160776), (SELECT id from parent WHERE personal_number = 195906137713)),
(1, (SELECT id from personaldata_id WHERE personal_number = 200605237981), (SELECT id from parent WHERE personal_number = 195906137713)),
(1, (SELECT id from personaldata_id WHERE personal_number = 200808190783), (SELECT id from parent WHERE personal_number = 198202229210));


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
