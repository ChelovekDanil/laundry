CREATE DATABASE laundry;

CREATE TABLE role(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employ(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id UUID REFERENCES role(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE readiness(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    access_level INT NOT NULL
);

CREATE TABLE address(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    country VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    home VARCHAR(255) NOT NULL,
    apartment VARCHAR(255) NOT NULL
);

CREATE TABLE client(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    number VARCHAR(15) NOT NULL,
    address_id UUID REFERENCES address(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE client_order(
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    date DATE NOT NULL,
    client_id UUID REFERENCES client(id) ON DELETE CASCADE NOT NULL,
    employ_id UUID REFERENCES employ(id) ON DELETE CASCADE NOT NULL,
    readiness_id UUID REFERENCES readiness(id) ON DELETE CASCADE NOT NULL
);