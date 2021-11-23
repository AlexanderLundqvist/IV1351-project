--
-- Insertion of data into database for Soundgood Music School
--

-- Created by: Alexander Lundqvist & Max Dern
-- Date: 23-11-2021

-- Insertion into person table

INSERT INTO "person" ("first_name", "last_name", "SSN", "age", "email",
    "phone_number", "street", "zip_code", "city")
VALUES ('Alexander', 'Lundqvist', '9202091111', '12', 'alexander.lundqvist@gmail.com',
    '0707707700', 'Plantvägen 2', '19730', 'Stockholm');

  INSERT INTO "person" ("first_name", "last_name", "SSN", "age", "email",
      "phone_number", "street", "zip_code", "city")
  VALUES ('Max', 'Dern', '9404092222', '14', 'max.dern@gmail.com',
      '0707701337', 'Fakevägen 3', '12345', 'Solna');
