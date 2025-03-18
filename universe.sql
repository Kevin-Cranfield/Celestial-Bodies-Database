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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    number_of_stars bigint
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    number_moons integer,
    population bigint,
    orbits_sun_earth_days numeric(6,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System.', true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small member of the Local Group of galaxies.', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster.', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic spiral galaxy with a prominent companion.', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A spiral galaxy with a bright nucleus and a large dust lane.', false, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Barred Spiral', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (5, 'Irregular', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (6, 'Dwarf Elliptical', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (7, 'Dwarf Irregular', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (8, 'Ring Galaxy', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (9, 'Peculiar Galaxy', NULL, NULL);
INSERT INTO public.galaxy_types VALUES (10, 'Ultra-Diffuse Galaxy', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth’s only natural satellite.', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars’ two small moons.', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of Mars’ two moons.', false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active moon in the solar system.', false, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon that may have a subsurface ocean.', false, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system.', false, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter.', false, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'The only moon with a dense atmosphere.', false, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A small, icy moon with water plumes.', false, 4);
INSERT INTO public.moon VALUES (10, 'Triton', 'A retrograde moon of Neptune.', false, 5);
INSERT INTO public.moon VALUES (33, 'Charon', 'The largest moon of Pluto, sometimes considered a double dwarf planet system.', false, 17);
INSERT INTO public.moon VALUES (34, 'Mimas', 'A heavily cratered moon of Saturn, known for its giant impact crater.', false, 7);
INSERT INTO public.moon VALUES (35, 'Dione', 'An icy moon of Saturn with bright, wispy streaks on its surface.', false, 7);
INSERT INTO public.moon VALUES (36, 'Rhea', 'The second-largest moon of Saturn, with a thin atmosphere of oxygen.', false, 7);
INSERT INTO public.moon VALUES (37, 'Iapetus', 'A Saturnian moon with a two-tone color pattern.', false, 7);
INSERT INTO public.moon VALUES (38, 'Oberon', 'One of Uranus’s largest moons, covered in ice and craters.', false, 18);
INSERT INTO public.moon VALUES (39, 'Titania', 'The largest moon of Uranus, with canyons and fault lines.', false, 18);
INSERT INTO public.moon VALUES (40, 'Ariel', 'A bright, icy moon of Uranus with evidence of past geological activity.', false, 18);
INSERT INTO public.moon VALUES (41, 'Umbriel', 'A dark, heavily cratered moon of Uranus.', false, 18);
INSERT INTO public.moon VALUES (42, 'Miranda', 'A moon of Uranus with one of the most bizarre and varied landscapes.', false, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet to support life.', true, 1, 8000000000, 365.2, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet, known for its dusty landscape.', false, 2, 0, 687.0, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'A scorching hot planet with a thick atmosphere.', false, 0, 0, 225.0, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'The largest planet in our solar system.', false, 79, 0, 4332.6, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Known for its beautiful rings.', false, 83, 0, 10759.2, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A gas giant with supersonic winds.', false, 14, 0, 60182.0, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'An exoplanet orbiting Proxima Centauri.', false, 0, 0, 11.2, 4);
INSERT INTO public.planet VALUES (4, 'Sirius B', 'A white dwarf companion to Sirius A.', false, 0, 0, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'An exoplanet in the habitable zone.', NULL, 0, NULL, 290.0, 5);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'A possibly habitable exoplanet.', false, 0, 0, 37.0, 5);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'A hot Jupiter-like exoplanet.', false, 0, 0, 3.5, 6);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 'A rocky super-Earth.', false, 0, 0, 24.7, 6);
INSERT INTO public.planet VALUES (13, 'Trappist-1e', 'A promising exoplanet for habitability.', false, 0, 0, 6.1, 7);
INSERT INTO public.planet VALUES (14, 'Trappist-1f', 'Another Earth-sized exoplanet in the system.', false, 0, 0, 9.2, 7);
INSERT INTO public.planet VALUES (15, '55 Cancri e', 'A scorching hot super-Earth.', false, 0, 0, 18.0, 8);
INSERT INTO public.planet VALUES (16, 'TOI-700 d', 'A potentially habitable exoplanet.', false, 0, 0, 37.4, 8);
INSERT INTO public.planet VALUES (17, 'Pluto', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (18, 'Uranus', NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', NULL);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', NULL);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', NULL);
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', NULL);
INSERT INTO public.planet_types VALUES (5, 'Super-Earth', NULL);
INSERT INTO public.planet_types VALUES (6, 'Mini-Neptune', NULL);
INSERT INTO public.planet_types VALUES (7, 'Ocean Planet', NULL);
INSERT INTO public.planet_types VALUES (8, 'Desert Planet', NULL);
INSERT INTO public.planet_types VALUES (9, 'Carbon Planet', NULL);
INSERT INTO public.planet_types VALUES (10, 'Iron Planet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The central star of our Solar System.', 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', 1, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in Orion.', 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'The closest star system to the Sun.', 1, NULL);
INSERT INTO public.star VALUES (5, 'Andromeda Alpha', 'A bright star in Andromeda.', 2, NULL);
INSERT INTO public.star VALUES (6, 'Triangulum Beta', 'A notable star in the Triangulum Galaxy.', 3, NULL);
INSERT INTO public.star VALUES (7, 'M87 Star A', 'A massive star in Messier 87.', 4, NULL);
INSERT INTO public.star VALUES (8, 'Whirlpool Star X', 'A blue giant in the Whirlpool Galaxy.', 5, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_types galaxy_types_galaxy_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_types_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_types_key UNIQUE (name);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

