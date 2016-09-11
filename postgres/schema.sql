CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255),
    url_homepage VARCHAR(255),
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

CREATE TABLE "user_login" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

CREATE TABLE authtoken (
    id SERIAL PRIMARY KEY,
    token uuid,
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

CREATE TABLE user_authtoken (
    id SERIAL PRIMARY KEY,
    micl_id integer,
    authtoken_id integer,
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

