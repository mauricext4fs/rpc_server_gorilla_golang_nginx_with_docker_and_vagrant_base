

CREATE TABLE micl (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255),
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

CREATE TABLE micl_owner (
    id SERIAL PRIMARY KEY,
    micl_id integer,
    owner_id integer,
    created_time timestamp WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE owner (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255),
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean 
)

CREATE TABLE micl_owner_credit (
    id SERIAL PRIMARY KEY,
    owner_id integer,
    max_message_per_month BIGINT,
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

CREATE TABLE micl_authtoken (
    id SERIAL PRIMARY KEY,
    micl_id integer,
    authtoken_id integer,
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);

CREATE TABLE owner_authtoken (
    id SERIAL PRIMARY KEY,
    owner_id integer,
    authtoken_id integer,
    created_time timestamp WITH TIME ZONE DEFAULT NOW(),
    active boolean,
    deleted boolean
);
