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

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;



COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;



CREATE TABLE public.course (
    course_id character varying(6) NOT NULL,
    course_name character varying(30),
    teacher_id character varying(6),
    course_hours smallint
);


ALTER TABLE public.course OWNER TO postgres;

CREATE TABLE public.enlisted (
    student_course_id character varying(6) NOT NULL,
    st_id character varying(6),
    course_id character varying(5),
    enlist_date date
);


ALTER TABLE public.enlisted OWNER TO postgres;



CREATE TABLE public.student (
    st_id character(6) NOT NULL,
    st_name character varying(50),
    birthday date,
    phone_number character varying(15),
    ege_score integer,
    CONSTRAINT student_birthday_check CHECK ((EXTRACT(year FROM birthday) > '1999'::numeric))
);


ALTER TABLE public.student OWNER TO postgres;


CREATE TABLE public.teacher (
    teacher_id character(6) NOT NULL,
    teacher_name character varying(50),
    birthday date,
    phone_number character varying(15),
    depart_id character(3) NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;


COPY public.course (course_id, course_name, teacher_id, course_hours) FROM stdin;
001	Алгебра	742750	64
002	Численные методы	742749	57
003	Базы данных	742746	86
004	Математический анализ	742745	101
\.




COPY public.enlisted (student_course_id, st_id, course_id, enlist_date) FROM stdin;
001	107959	001	2023-09-01
002	107960	001	2023-09-01
003	107961	001	2023-09-01
004	107962	001	2023-09-01
005	107963	001	2023-09-01
006	107964	001	2023-09-01
007	107965	001	2023-09-01
008	107966	001	2023-09-01
009	107967	001	2023-09-01
010	107968	001	2023-09-01
011	107969	001	2023-09-01
012	107970	001	2023-09-01
013	107971	001	2023-09-01
014	107972	001	2023-09-01
015	107973	001	2023-09-01
016	107974	001	2023-09-01
017	107959	002	2023-09-01
018	107960	002	2023-09-01
019	107961	002	2023-09-01
020	107962	002	2023-09-01
021	107963	002	2023-09-01
022	107964	002	2023-09-01
023	107967	002	2023-09-01
024	107970	002	2023-09-01
025	107971	002	2023-09-01
026	107972	002	2023-09-01
027	107959	003	2023-09-01
028	107960	003	2023-09-01
029	107961	003	2023-09-01
030	107962	003	2023-09-01
031	107965	003	2023-09-01
032	107966	003	2023-09-01
033	107967	003	2023-09-01
034	107968	003	2023-09-01
035	107972	003	2023-09-01
036	107973	003	2023-09-01
037	107974	003	2023-09-01
038	107961	004	2023-09-01
039	107962	004	2023-09-01
040	107963	004	2023-09-01
041	107965	004	2023-09-01
042	107968	004	2023-09-01
043	107969	004	2023-09-01
044	107970	004	2023-09-01
\.

COPY public.student (st_id, st_name, birthday, phone_number, ege_score) FROM stdin;
107959	Ибрянов Александр Сергеевич	2004-03-05	+79892103422	268
107960	Курдзиль Руслан Романович	2004-04-24	+79034105984	300
107961	Бабенко Егор Николаевич	2004-04-27	+79299219454	267
107963	Углов Владислав Сергеевич	2004-05-13	+79892104264	275
107964	Воробченко Артем Сергеевич	2005-06-25	+79894563634	260
107965	Коробко Аксинья Дмитриевна	2004-11-12	+79892144325	263
107966	Кулик Ирина Демидовна	2006-12-11	+79898439434	264
107967	Жужжа Дмитрий Валерьевич	2003-12-22	+79898439436	265
107968	Гордей Дмитрий Александрович	2000-11-12	+79898439432	264
107969	Ларин Валерий Дмитриевич	2004-11-01	+79898439642	254
107970	Григоров Петр Кириллович	2004-01-12	+79898439954	246
107971	Заборенко Ренат Романович	2004-11-07	+74498436857	267
107972	Факиев Дмитрий Заурбекович	2004-05-01	+79898474574	236
107973	Хохотач Сергей Вадимович	2006-11-01	+79898437547	264
107974	Вадимов Адам Геннадиевич	2004-11-26	+79898454365	274
107975	Александров Александр Александрович	2005-11-26	+79898436743	265
107962	Дыбенко Андрей Владимирович	2005-03-21	+79894323543	273
\.


COPY public.teacher (teacher_id, teacher_name, birthday, phone_number, depart_id) FROM stdin;
742745	Орехов Андрей Владимирович	1965-12-01	+79892105475	001
742746	Михеев Викентий Сергеевич	1980-12-01	+79892103475	002
742747	Михеев Сергей Евгеньевич	1963-12-01	+79892103465	003
742748	Михеев Викентий Сергеевич	1980-12-01	+79892106375	002
742749	Пронина Юлия Григорьевна	1976-12-05	+79865403475	001
742750	Лежнина Елена Александровна	1976-12-01	+79865403475	003
742751	Парфенов Андрей Павлович	1980-12-01	+79892105645	001
742752	Кривошеин Александр Владимирович	1965-12-02	+7989475345	001
742753	Красницкий Александр Павлович	1974-12-01	+7985463475	004
742754	Квитко Александр Николаевич	1965-12-01	+7989865575	005
742755	Демидович Андрей Павлович	1980-11-01	+79892106384	005
742756	Камачкин Александр Михайлович	1956-12-01	+7987654475	005
742757	Зараник Ульяна Петровна	1980-11-03	+795465645	001
742758	Карпов Андрей Евгеньевич	1970-04-01	+798956675	006
742759	Калинина Александра Дмитриевна	1980-11-01	+79892106744	003
\.


ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);



ALTER TABLE ONLY public.enlisted
    ADD CONSTRAINT enlisted_pkey PRIMARY KEY (student_course_id);



ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (st_id);



ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_st_name_key UNIQUE (st_name);



ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id);


CREATE INDEX st_index ON public.student USING btree (phone_number);



ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teacher(teacher_id);



ALTER TABLE ONLY public.enlisted
    ADD CONSTRAINT enlisted_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);



ALTER TABLE ONLY public.enlisted
    ADD CONSTRAINT enlisted_st_id_fkey FOREIGN KEY (st_id) REFERENCES public.student(st_id);

