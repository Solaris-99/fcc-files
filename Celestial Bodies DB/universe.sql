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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius_km integer,
    mass_million_tonnes numeric(10,2)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    core_name character varying(50),
    radius_light_years numeric(10,2),
    type character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_atmosphere boolean NOT NULL,
    radius_km integer,
    description text,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_habitable boolean NOT NULL,
    radius_km integer,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    classification character varying(10) NOT NULL,
    radius_km integer,
    age_in_millions_years integer,
    distance_from_earth_light_years numeric(30,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 11, 220000.00);
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 30, 1000000.00);
INSERT INTO public.comet VALUES (3, 'Comet Encke', 2, 2000.00);
INSERT INTO public.comet VALUES (4, 'Comet NEOWISE', 5, 6500.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius A*', 52850.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'NGC 224', 110000.00, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'M33 Core', 30000.00, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'M104 Core', 24000.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'NGC 5194', 38000.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'M81 Core', 45000.00, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 1737, 'The only natural satellite of Earth, no atmosphere, and evidence of ice in craters.', true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 11, 'A small, irregularly shaped moon of Mars.', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 6, 'The smaller and outermost of the two moons of Mars.', false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', true, 1560, 'A Galilean moon of Jupiter with a subsurface ocean, possibly habitable.', true, 3);
INSERT INTO public.moon VALUES (5, 'Titan', true, 2575, 'Largest moon of Saturn, with a thick atmosphere and liquid methane lakes.', true, 6);
INSERT INTO public.moon VALUES (6, 'Io', false, 1821, 'A volcanic moon of Jupiter with no atmosphere.', false, 3);
INSERT INTO public.moon VALUES (7, 'Ganymede', false, 2634, 'The largest moon in the solar system, with evidence of an underground ocean.', true, 1);
INSERT INTO public.moon VALUES (8, 'Callisto', false, 2410, 'A heavily cratered moon of Jupiter, potentially harboring subsurface oceans.', true, 3);
INSERT INTO public.moon VALUES (9, 'Triton', true, 1353, 'Largest moon of Neptune, with a thin atmosphere and geysers of nitrogen.', true, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, 252, 'A small icy moon of Saturn that ejects water-ice from geysers.', true, 4);
INSERT INTO public.moon VALUES (11, 'Oberon', false, 761, 'A moon of Uranus with a heavily cratered surface.', false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', false, 561, 'A small moon of Saturn with bright ice cliffs.', true, 4);
INSERT INTO public.moon VALUES (13, 'Miranda', false, 235, 'A moon of Uranus with dramatic cliffs and canyons.', false, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', false, 763, 'A cold, cratered moon of Saturn with wispy surface markings.', false, 4);
INSERT INTO public.moon VALUES (15, 'Charon', false, 606, 'The largest moon of Pluto, possibly harboring a subsurface ocean.', true, 7);
INSERT INTO public.moon VALUES (16, 'Pan', false, 14, 'A small, ring-shaped moon orbiting within Saturns rings.', false, 4);
INSERT INTO public.moon VALUES (17, 'Atlas', false, 15, 'A small moon of Saturn, shaped like a flying saucer.', false, 4);
INSERT INTO public.moon VALUES (18, 'Himalia', false, 85, 'An irregular-shaped moon of Jupiter.', false, 3);
INSERT INTO public.moon VALUES (19, 'Tethys', false, 531, 'A large icy moon of Saturn with a giant rift.', false, 4);
INSERT INTO public.moon VALUES (20, 'Iapetus', false, 734, 'A two-toned moon of Saturn with one side darker than the other.', false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 6371, 'The only known planet with life, located in the habitable zone of the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 3389, 'Known as the Red Planet, it has potential for future human habitation.', 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', true, 7152, 'Potentially habitable exoplanet orbiting Proxima Centauri.', 4);
INSERT INTO public.planet VALUES (4, 'Sirius b', false, 5800, 'A white dwarf companion to Sirius A.', 3);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', false, 45000, 'A gas giant orbiting the red supergiant Betelgeuse.', 2);
INSERT INTO public.planet VALUES (6, 'Aldebaran b', false, 49000, 'A large gas giant orbiting the giant star Aldebaran.', 6);
INSERT INTO public.planet VALUES (7, 'Kepler-452b', true, 14300, 'A super-Earth exoplanet in the habitable zone of its star.', 1);
INSERT INTO public.planet VALUES (8, 'Rigel I', false, 67800, 'A massive planet orbiting the blue supergiant star Rigel.', 5);
INSERT INTO public.planet VALUES (9, 'Vulcan', false, 1500, 'A hypothetical planet once thought to exist between Mercury and the Sun.', 1);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', true, 7600, 'An exoplanet located in the habitable zone of the star Gliese 581.', 4);
INSERT INTO public.planet VALUES (11, 'Andromeda I', false, 30000, 'A distant gas giant in the Andromeda Galaxy.', 5);
INSERT INTO public.planet VALUES (12, 'Whirlpool b', false, 54000, 'A planet orbiting a star in the Whirlpool Galaxy, known for its spiral shape.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 696340, 4600, 0.00, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'M2I', 764000000, 8500, 642.50, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', 1189644, 300, 8.60, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M5.5V', 100750, 4500, 4.24, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'B8I', 78500000, 8000, 860.00, 2);
INSERT INTO public.star VALUES (6, 'Aldebaran', 'K5III', 30840000, 6500, 65.30, 1);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

