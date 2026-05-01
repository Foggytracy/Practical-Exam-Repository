--
-- PostgreSQL database dump
--

\restrict gReejRAHKpx7T7sahvbvWmT4jejfEkzf43qe8shNNCsJfaLPtyjG3z0BnwmYdS7

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-01 14:38:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16385)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16426)
-- Name: case_studies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.case_studies (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    short_description text NOT NULL,
    cover_image_url text,
    link_url text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.case_studies OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16495)
-- Name: contact_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_submissions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    name text NOT NULL,
    email text NOT NULL,
    message text NOT NULL,
    status text DEFAULT 'new'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT contact_submissions_status_check CHECK ((status = ANY (ARRAY['new'::text, 'read'::text, 'archived'::text])))
);


ALTER TABLE public.contact_submissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    icon_url text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16411)
-- Name: team_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_members (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    role text NOT NULL,
    avatar_url text,
    socials_json jsonb,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    experience text
);


ALTER TABLE public.team_members OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16473)
-- Name: testimonials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testimonials (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    name text NOT NULL,
    role_company text NOT NULL,
    message text NOT NULL,
    avatar_url text,
    rating integer DEFAULT 5,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.testimonials OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16457)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    role text DEFAULT 'admin'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16441)
-- Name: working_processes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.working_processes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    step_no integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.working_processes OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 16426)
-- Dependencies: 222
-- Data for Name: case_studies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.case_studies (id, title, short_description, cover_image_url, link_url, sort_order, is_active, created_at, updated_at) FROM stdin;
1388f0c8-d712-4b1f-ade5-9b929c0aa0d4	Project Name	For a local restaurant, we implemented a targeted PPC campaign that resulted in a 50% increase in website traffic and a 25% increase in sales.	/case-studies/default.svg	#	0	t	2026-04-30 22:25:32.884279+08	2026-04-30 22:25:32.884279+08
7ca42a4a-61f6-4f9f-97f6-a9c9e97c5438	Software Company	For a B2B software company, we developed an SEO strategy that resulted in a first page ranking for key keywords and a 200% increase in organic traffic.	/case-studies/default.svg	#	0	t	2026-04-30 22:27:12.650353+08	2026-04-30 22:27:12.650353+08
bfb5d50c-4052-46d3-bc06-5562ccf39c74	Retail	For a national retail chain, we created a social media marketing campaign that increased followers by 25% and generated a 20% increase in online sales.	/case-studies/default.svg	retail.com	0	t	2026-04-30 22:28:00.935657+08	2026-04-30 22:28:00.935657+08
\.


--
-- TOC entry 5096 (class 0 OID 16495)
-- Dependencies: 226
-- Data for Name: contact_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_submissions (id, user_id, name, email, message, status, created_at, updated_at) FROM stdin;
811e53cb-cc43-453c-9e7f-3246f4829d29	\N	John Lor Ganary V. Daguyos	johnlordaguyos@gmail.com	Hello guys	archived	2026-05-01 13:04:18.609341+08	2026-05-01 13:04:54.636297+08
3dd36e3f-0871-4d70-b339-fd4926488365	\N	John Lor Ganary V. Daguyos	johnlordaguyos@gmail.com	Are you there?	archived	2026-05-01 13:04:31.139192+08	2026-05-01 13:04:56.010291+08
\.


--
-- TOC entry 5090 (class 0 OID 16396)
-- Dependencies: 220
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, description, icon_url, sort_order, is_active, created_at, updated_at) FROM stdin;
158b8954-87d8-4ca7-a5aa-e5c11d567487	Search engine optimization	Search engine optimization	\N	0	t	2026-05-01 14:12:26.254168+08	2026-05-01 14:12:26.254168+08
fd573756-60c0-49ae-8165-4102785bfc88	Pay-per-click advertising 	Pay-per-click advertising 	\N	0	t	2026-05-01 14:12:47.867624+08	2026-05-01 14:12:47.867624+08
ecfe06ca-e260-4b41-b831-f3d1541b6b2e	Social Media Marketing 	Social Media Marketing 	\N	0	t	2026-05-01 14:13:03.240048+08	2026-05-01 14:13:03.240048+08
f2455566-9226-42c2-a44a-ec584abe09c1	Email Marketing	Email Marketing	\N	0	t	2026-05-01 14:13:11.592841+08	2026-05-01 14:13:11.592841+08
\.


--
-- TOC entry 5091 (class 0 OID 16411)
-- Dependencies: 221
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_members (id, name, role, avatar_url, socials_json, sort_order, is_active, created_at, updated_at, experience) FROM stdin;
1e396ded-f2ee-4a84-93d9-67790217405c	John Smith	CEO and Founder	/team/p1.png	\N	0	t	2026-05-01 09:03:34.357678+08	2026-05-01 09:04:07.923987+08	10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy
3d382857-c5d2-4f85-9094-aab17cf9df57	Jane Doe	Director of Operations	/uploads/team/1777598310343-p2.png	\N	0	t	2026-05-01 09:18:30.384156+08	2026-05-01 09:18:30.384156+08	7+ years of experience in project management and team leadership. Strong organizational and communication skills
d2a3e141-77d7-4373-9d2f-ec59207e510b	Michael Brown	Senior SEO Specialist	/uploads/team/1777598354612-p3.png	\N	0	t	2026-05-01 09:19:14.64883+08	2026-05-01 09:19:14.64883+08	5+ years of experience in SEO and content creation. Proficient in keyword research and on-page optimization
427923c1-371c-4220-9b85-9d8c6494d233	Emily Johnson	PPC Manager	/uploads/team/1777598676496-p4.png	\N	0	t	2026-05-01 09:24:36.533963+08	2026-05-01 09:24:36.533963+08	3+ years of experience in paid search advertising. Skilled in campaign management and performance analysis
\.


--
-- TOC entry 5095 (class 0 OID 16473)
-- Dependencies: 225
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testimonials (id, user_id, name, role_company, message, avatar_url, rating, sort_order, is_active, created_at, updated_at) FROM stdin;
45e1676d-86ac-41c9-9417-884cbd11c9d6	\N	John Smith 	Marketing Director at XYZ Corp	"We have been working with Positivus for the past year and have seen a significant increase in website traffic and leads as a result of their efforts. The team is professional, responsive, and truly cares about the success of our business. We highly recommend Positivus to any company looking to grow their online presence."	\N	5	0	t	2026-05-01 12:02:10.464183+08	2026-05-01 12:02:10.464183+08
0b856c88-b5ee-4b21-99eb-06f5daffa9d9	\N	John Smith	Marketing Director at XYZ Corp	We have been working with Positivus for the past year and have seen a significant increase in website traffic and leads as a result of their efforts. The team is professional, responsive, and truly cares about the success of our business. We highly recommend Positivus to any company looking to grow their online presence.	\N	5	0	t	2026-05-01 12:02:41.863841+08	2026-05-01 12:02:41.863841+08
85edbd27-72c6-432e-b709-9797066f9639	\N	John Smith 	Marketing Director at XYZ Corp	We have been working with Positivus for the past year and have seen a significant increase in website traffic and leads as a result of their efforts. The team is professional, responsive, and truly cares about the success of our business. We highly recommend Positivus to any company looking to grow their online presence.	\N	5	0	t	2026-05-01 12:02:58.884287+08	2026-05-01 12:02:58.884287+08
\.


--
-- TOC entry 5094 (class 0 OID 16457)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_hash, role, created_at, updated_at) FROM stdin;
451766fb-414b-4414-8b69-ed6f661214fe	admin@agency.com	your_secure_password_hash	admin	2026-04-30 15:55:46.434407+08	2026-04-30 15:55:46.434407+08
6ee4cfd5-8b0a-459d-9c0b-d4654cfc09ac	admin@gmail.com	admin123	admin	2026-05-01 13:39:22.982081+08	2026-05-01 13:39:22.982081+08
\.


--
-- TOC entry 5093 (class 0 OID 16441)
-- Dependencies: 223
-- Data for Name: working_processes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.working_processes (id, step_no, title, description, sort_order, is_active, created_at, updated_at) FROM stdin;
7714a1ca-504b-471c-9a06-c49f7594d686	3	Implementation	Implementation	0	t	2026-04-30 22:47:16.041936+08	2026-04-30 22:47:16.041936+08
5c62db8c-31ad-4445-b905-bb53a696346b	1	Consultation	During the initial consultation, we will discuss your business goals and objectives, target audience, and current marketing efforts. This will allow us to understand your needs and tailor our services to best fit your requirements.	0	t	2026-04-30 22:56:39.90782+08	2026-04-30 22:56:39.90782+08
7f83d9ae-2eaf-4cac-8f39-5b8767464974	2	Research and Strategy Development	During the initial consultation, we will discuss your business goals and objectives, target audience, and current marketing efforts. This will allow us to understand your needs and tailor our services to best fit your requirements.	0	t	2026-04-30 22:57:17.138716+08	2026-04-30 23:15:05.09086+08
082ca2a3-ef61-4e05-b87a-47abec8823f3	4	Monitoring and Optimization	Monitoring and Optimization	0	t	2026-04-30 23:15:32.310354+08	2026-04-30 23:15:32.310354+08
7857b694-3e99-4d91-bfc0-762a19d4c006	5	Reporting and Communication	Reporting and Communication	0	t	2026-04-30 23:17:32.385682+08	2026-04-30 23:17:32.385682+08
dee38ae0-c644-47a8-b209-3de2129af118	6	Continual Improvement	Continual Improvement	0	t	2026-04-30 23:17:50.296437+08	2026-04-30 23:17:50.296437+08
\.


--
-- TOC entry 4930 (class 2606 OID 16440)
-- Name: case_studies case_studies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.case_studies
    ADD CONSTRAINT case_studies_pkey PRIMARY KEY (id);


--
-- TOC entry 4940 (class 2606 OID 16510)
-- Name: contact_submissions contact_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_submissions
    ADD CONSTRAINT contact_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 16410)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 16425)
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4938 (class 2606 OID 16489)
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 16472)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4936 (class 2606 OID 16470)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 16456)
-- Name: working_processes working_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_processes
    ADD CONSTRAINT working_processes_pkey PRIMARY KEY (id);


--
-- TOC entry 4942 (class 2606 OID 16511)
-- Name: contact_submissions contact_submissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_submissions
    ADD CONSTRAINT contact_submissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4941 (class 2606 OID 16490)
-- Name: testimonials testimonials_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-05-01 14:38:40

--
-- PostgreSQL database dump complete
--

\unrestrict gReejRAHKpx7T7sahvbvWmT4jejfEkzf43qe8shNNCsJfaLPtyjG3z0BnwmYdS7

