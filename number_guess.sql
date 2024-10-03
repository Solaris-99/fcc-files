--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    tries integer DEFAULT 0
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 5);
INSERT INTO public.games VALUES (2, 1, 30);
INSERT INTO public.games VALUES (3, 1, 7);
INSERT INTO public.games VALUES (4, 3, 136);
INSERT INTO public.games VALUES (5, 3, 677);
INSERT INTO public.games VALUES (6, 4, 735);
INSERT INTO public.games VALUES (7, 4, 628);
INSERT INTO public.games VALUES (8, 3, 619);
INSERT INTO public.games VALUES (9, 3, 756);
INSERT INTO public.games VALUES (10, 3, 168);
INSERT INTO public.games VALUES (11, 5, 525);
INSERT INTO public.games VALUES (12, 5, 623);
INSERT INTO public.games VALUES (13, 6, 811);
INSERT INTO public.games VALUES (14, 6, 918);
INSERT INTO public.games VALUES (15, 5, 966);
INSERT INTO public.games VALUES (16, 5, 6);
INSERT INTO public.games VALUES (17, 5, 353);
INSERT INTO public.games VALUES (18, 7, 996);
INSERT INTO public.games VALUES (19, 7, 90);
INSERT INTO public.games VALUES (20, 8, 356);
INSERT INTO public.games VALUES (21, 8, 571);
INSERT INTO public.games VALUES (22, 7, 291);
INSERT INTO public.games VALUES (23, 7, 113);
INSERT INTO public.games VALUES (24, 7, 680);
INSERT INTO public.games VALUES (25, 2, 11);
INSERT INTO public.games VALUES (26, 9, 450);
INSERT INTO public.games VALUES (27, 9, 490);
INSERT INTO public.games VALUES (28, 10, 628);
INSERT INTO public.games VALUES (29, 10, 44);
INSERT INTO public.games VALUES (30, 9, 217);
INSERT INTO public.games VALUES (31, 9, 292);
INSERT INTO public.games VALUES (32, 9, 42);
INSERT INTO public.games VALUES (33, 11, 752);
INSERT INTO public.games VALUES (34, 11, 796);
INSERT INTO public.games VALUES (35, 12, 273);
INSERT INTO public.games VALUES (36, 12, 188);
INSERT INTO public.games VALUES (37, 11, 380);
INSERT INTO public.games VALUES (38, 11, 170);
INSERT INTO public.games VALUES (39, 11, 671);
INSERT INTO public.games VALUES (40, 13, 701);
INSERT INTO public.games VALUES (41, 13, 65);
INSERT INTO public.games VALUES (42, 14, 234);
INSERT INTO public.games VALUES (43, 14, 642);
INSERT INTO public.games VALUES (44, 13, 385);
INSERT INTO public.games VALUES (45, 13, 631);
INSERT INTO public.games VALUES (46, 13, 407);
INSERT INTO public.games VALUES (47, 15, 371);
INSERT INTO public.games VALUES (48, 15, 877);
INSERT INTO public.games VALUES (49, 16, 929);
INSERT INTO public.games VALUES (50, 16, 228);
INSERT INTO public.games VALUES (51, 15, 656);
INSERT INTO public.games VALUES (52, 15, 278);
INSERT INTO public.games VALUES (53, 15, 923);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test');
INSERT INTO public.users VALUES (2, 'a');
INSERT INTO public.users VALUES (3, 'user_1727981726358');
INSERT INTO public.users VALUES (4, 'user_1727981726357');
INSERT INTO public.users VALUES (5, 'user_1727981773210');
INSERT INTO public.users VALUES (6, 'user_1727981773209');
INSERT INTO public.users VALUES (7, 'user_1727981814060');
INSERT INTO public.users VALUES (8, 'user_1727981814059');
INSERT INTO public.users VALUES (9, 'user_1727982119692');
INSERT INTO public.users VALUES (10, 'user_1727982119691');
INSERT INTO public.users VALUES (11, 'user_1727982140029');
INSERT INTO public.users VALUES (12, 'user_1727982140028');
INSERT INTO public.users VALUES (13, 'user_1727982150372');
INSERT INTO public.users VALUES (14, 'user_1727982150371');
INSERT INTO public.users VALUES (15, 'user_1727982181461');
INSERT INTO public.users VALUES (16, 'user_1727982181460');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 53, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 16, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

