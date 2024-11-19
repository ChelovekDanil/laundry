INSERT INTO role(name, access_level) 
VALUES('работяга', 2);

INSERT INTO employ(first_name, middle_name, last_name, login, password, role_id)
VALUES ('Даня', 'Данилов', 'Пидрилов', 'nefor', '1234567890', 'c2faf12b-0b0b-4940-898e-5063a52a4ad3');

INSERT INTO readiness(name) 
VALUES('не готов');

INSERT INTO address(country, city, street, home, apartment)
VALUES('рося', 'засратов', 'голубочкова', '1337', '322');

INSERT INTO client(first_name, middle_name, last_name, number, address_id)
VALUES('чорт', 'Чертилов', 'чертополох', '+79874567554', 'bc841028-1d5f-4bea-9df2-e12588ef3a68');

INSERT INTO client_order(date, client_id, employ_id, readiness_id)
VALUES('2024-11-20', 'b4d6766d-5e50-44c7-8c59-119857833768', '4092ad03-1d0b-4a0a-a0e8-837b18e48d70', '2b45ece1-37ab-410f-a268-a48a5b62a908');