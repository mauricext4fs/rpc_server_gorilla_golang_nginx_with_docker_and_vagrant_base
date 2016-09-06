--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-08-19 22:29:04 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS micl;
--
-- TOC entry 2182 (class 1262 OID 16387)
-- Name: micl; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE micl WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE micl OWNER TO postgres;

\connect micl

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 16436)
-- Name: authtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authtoken (
    id integer NOT NULL,
    token uuid,
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE authtoken OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16434)
-- Name: authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authtoken_id_seq OWNER TO postgres;

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 189
-- Name: authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authtoken_id_seq OWNED BY authtoken.id;


--
-- TOC entry 182 (class 1259 OID 16397)
-- Name: micl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE micl (
    id integer NOT NULL,
    url character varying(255),
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE micl OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16445)
-- Name: micl_authtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE micl_authtoken (
    id integer NOT NULL,
    micl_id integer,
    authtoken_id integer,
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE micl_authtoken OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16443)
-- Name: micl_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE micl_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE micl_authtoken_id_seq OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 191
-- Name: micl_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE micl_authtoken_id_seq OWNED BY micl_authtoken.id;


--
-- TOC entry 181 (class 1259 OID 16395)
-- Name: micl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE micl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE micl_id_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 181
-- Name: micl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE micl_id_seq OWNED BY micl.id;


--
-- TOC entry 184 (class 1259 OID 16406)
-- Name: micl_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE micl_owner (
    id integer NOT NULL,
    micl_id integer,
    owner_id integer,
    created_time timestamp with time zone DEFAULT now()
);


ALTER TABLE micl_owner OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16427)
-- Name: micl_owner_credit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE micl_owner_credit (
    id integer NOT NULL,
    owner_id integer,
    max_message_per_month bigint,
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE micl_owner_credit OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16425)
-- Name: micl_owner_credit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE micl_owner_credit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE micl_owner_credit_id_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 187
-- Name: micl_owner_credit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE micl_owner_credit_id_seq OWNED BY micl_owner_credit.id;


--
-- TOC entry 183 (class 1259 OID 16404)
-- Name: micl_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE micl_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE micl_owner_id_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 183
-- Name: micl_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE micl_owner_id_seq OWNED BY micl_owner.id;


--
-- TOC entry 186 (class 1259 OID 16415)
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE owner (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    email character varying(255),
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE owner OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16454)
-- Name: owner_authtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE owner_authtoken (
    id integer NOT NULL,
    owner_id integer,
    authtoken_id integer,
    created_time timestamp with time zone DEFAULT now(),
    active boolean,
    deleted boolean
);


ALTER TABLE owner_authtoken OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16452)
-- Name: owner_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE owner_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE owner_authtoken_id_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 193
-- Name: owner_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE owner_authtoken_id_seq OWNED BY owner_authtoken.id;


--
-- TOC entry 185 (class 1259 OID 16413)
-- Name: owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE owner_id_seq OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 185
-- Name: owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE owner_id_seq OWNED BY owner.id;


--
-- TOC entry 2030 (class 2604 OID 16439)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken ALTER COLUMN id SET DEFAULT nextval('authtoken_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 16400)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl ALTER COLUMN id SET DEFAULT nextval('micl_id_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 16448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_authtoken ALTER COLUMN id SET DEFAULT nextval('micl_authtoken_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 16409)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_owner ALTER COLUMN id SET DEFAULT nextval('micl_owner_id_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 16430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_owner_credit ALTER COLUMN id SET DEFAULT nextval('micl_owner_credit_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 16418)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owner ALTER COLUMN id SET DEFAULT nextval('owner_id_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 16457)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owner_authtoken ALTER COLUMN id SET DEFAULT nextval('owner_authtoken_id_seq'::regclass);


--
-- TOC entry 2173 (class 0 OID 16436)
-- Dependencies: 190
-- Data for Name: authtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken (id, token, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 189
-- Name: authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authtoken_id_seq', 1, false);


--
-- TOC entry 2165 (class 0 OID 16397)
-- Dependencies: 182
-- Data for Name: micl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY micl (id, url, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 16445)
-- Dependencies: 192
-- Data for Name: micl_authtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY micl_authtoken (id, micl_id, authtoken_id, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 191
-- Name: micl_authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('micl_authtoken_id_seq', 1, false);


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 181
-- Name: micl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('micl_id_seq', 1, false);


--
-- TOC entry 2167 (class 0 OID 16406)
-- Dependencies: 184
-- Data for Name: micl_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY micl_owner (id, micl_id, owner_id, created_time) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 16427)
-- Dependencies: 188
-- Data for Name: micl_owner_credit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY micl_owner_credit (id, owner_id, max_message_per_month, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 187
-- Name: micl_owner_credit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('micl_owner_credit_id_seq', 1, false);


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 183
-- Name: micl_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('micl_owner_id_seq', 1, false);


--
-- TOC entry 2169 (class 0 OID 16415)
-- Dependencies: 186
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY owner (id, firstname, lastname, email, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2177 (class 0 OID 16454)
-- Dependencies: 194
-- Data for Name: owner_authtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY owner_authtoken (id, owner_id, authtoken_id, created_time, active, deleted) FROM stdin;
\.


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 193
-- Name: owner_authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('owner_authtoken_id_seq', 1, false);


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 185
-- Name: owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('owner_id_seq', 1, false);


--
-- TOC entry 2045 (class 2606 OID 16442)
-- Name: authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken
    ADD CONSTRAINT authtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 16451)
-- Name: micl_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_authtoken
    ADD CONSTRAINT micl_authtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 16433)
-- Name: micl_owner_credit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_owner_credit
    ADD CONSTRAINT micl_owner_credit_pkey PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 16412)
-- Name: micl_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl_owner
    ADD CONSTRAINT micl_owner_pkey PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 16403)
-- Name: micl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY micl
    ADD CONSTRAINT micl_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 16460)
-- Name: owner_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owner_authtoken
    ADD CONSTRAINT owner_authtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 16424)
-- Name: owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-08-19 22:29:04 CEST

--
-- PostgreSQL database dump complete
--

