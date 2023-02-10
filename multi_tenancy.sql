--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: teacher_13; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA teacher_13;


ALTER SCHEMA teacher_13 OWNER TO postgres;

--
-- Name: teacher_14; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA teacher_14;


ALTER SCHEMA teacher_14 OWNER TO postgres;

--
-- Name: teacher_15; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA teacher_15;


ALTER SCHEMA teacher_15 OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: teacher_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_roles (
    id integer NOT NULL,
    "teacherId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public.teacher_roles OWNER TO postgres;

--
-- Name: teacher_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_roles_id_seq OWNER TO postgres;

--
-- Name: teacher_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_roles_id_seq OWNED BY public.teacher_roles.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name character varying(50),
    standard integer
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teachers_id_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: students; Type: TABLE; Schema: teacher_13; Owner: postgres
--

CREATE TABLE teacher_13.students (
    id integer NOT NULL,
    name character varying(255),
    class character varying(255),
    standard integer
);


ALTER TABLE teacher_13.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: teacher_13; Owner: postgres
--

CREATE SEQUENCE teacher_13.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_13.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: teacher_13; Owner: postgres
--

ALTER SEQUENCE teacher_13.students_id_seq OWNED BY teacher_13.students.id;


--
-- Name: students; Type: TABLE; Schema: teacher_14; Owner: postgres
--

CREATE TABLE teacher_14.students (
    id integer NOT NULL,
    name character varying(255),
    class character varying(255),
    standard integer
);


ALTER TABLE teacher_14.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: teacher_14; Owner: postgres
--

CREATE SEQUENCE teacher_14.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_14.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: teacher_14; Owner: postgres
--

ALTER SEQUENCE teacher_14.students_id_seq OWNED BY teacher_14.students.id;


--
-- Name: students; Type: TABLE; Schema: teacher_15; Owner: postgres
--

CREATE TABLE teacher_15.students (
    id integer NOT NULL,
    name character varying(255),
    class character varying(255),
    standard integer
);


ALTER TABLE teacher_15.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: teacher_15; Owner: postgres
--

CREATE SEQUENCE teacher_15.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teacher_15.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: teacher_15; Owner: postgres
--

ALTER SEQUENCE teacher_15.students_id_seq OWNED BY teacher_15.students.id;


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: teacher_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_roles ALTER COLUMN id SET DEFAULT nextval('public.teacher_roles_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: teacher_13; Owner: postgres
--

ALTER TABLE ONLY teacher_13.students ALTER COLUMN id SET DEFAULT nextval('teacher_13.students_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: teacher_14; Owner: postgres
--

ALTER TABLE ONLY teacher_14.students ALTER COLUMN id SET DEFAULT nextval('teacher_14.students_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: teacher_15; Owner: postgres
--

ALTER TABLE ONLY teacher_15.students ALTER COLUMN id SET DEFAULT nextval('teacher_15.students_id_seq'::regclass);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	read
2	write
3	read
4	write
\.


--
-- Data for Name: teacher_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_roles (id, "teacherId", "roleId") FROM stdin;
2	12	1
3	12	2
4	13	1
5	13	2
6	13	2
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, name, standard) FROM stdin;
12	Mimoh	10
13	Mimoh	10
14	Mayur	9
15	Mimoh	9
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: teacher_13; Owner: postgres
--

COPY teacher_13.students (id, name, class, standard) FROM stdin;
1	krvtbd3	A	8
2	o8hii25	B	9
3	v3y70qy	A	4
4	c5aakli	C	10
5	b62zkj1	B	4
6	qxu3jz9	C	10
7	dml4433	A	2
8	zn7olqtk	B	6
9	78fykgk	A	2
10	ifv2uu4	A	1
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: teacher_14; Owner: postgres
--

COPY teacher_14.students (id, name, class, standard) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: teacher_15; Owner: postgres
--

COPY teacher_15.students (id, name, class, standard) FROM stdin;
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: teacher_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_roles_id_seq', 6, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 15, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: teacher_13; Owner: postgres
--

SELECT pg_catalog.setval('teacher_13.students_id_seq', 10, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: teacher_14; Owner: postgres
--

SELECT pg_catalog.setval('teacher_14.students_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: teacher_15; Owner: postgres
--

SELECT pg_catalog.setval('teacher_15.students_id_seq', 1, false);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: teacher_roles teacher_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_roles
    ADD CONSTRAINT teacher_roles_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: teacher_13; Owner: postgres
--

ALTER TABLE ONLY teacher_13.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: teacher_14; Owner: postgres
--

ALTER TABLE ONLY teacher_14.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: teacher_15; Owner: postgres
--

ALTER TABLE ONLY teacher_15.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: fki_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_role ON public.teacher_roles USING btree ("roleId");


--
-- Name: fki_teacher; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_teacher ON public.teacher_roles USING btree ("teacherId");


--
-- Name: teacher_roles role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_roles
    ADD CONSTRAINT role FOREIGN KEY ("roleId") REFERENCES public.roles(id) NOT VALID;


--
-- Name: teacher_roles teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_roles
    ADD CONSTRAINT teacher FOREIGN KEY ("teacherId") REFERENCES public.teachers(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

