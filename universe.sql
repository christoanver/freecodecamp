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
    name character varying NOT NULL,
    description text NOT NULL,
    size_in_kilo_parsecs integer,
    solar_mass_in_exponents_of_10 integer,
    visible_to_naked_eye boolean,
    observable_on_earth boolean
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
-- Name: minor_planets_and_comets_visited_by_spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.minor_planets_and_comets_visited_by_spacecraft (
    minor_planets_and_comets_visited_by_spacecraft_id integer NOT NULL,
    name character varying NOT NULL,
    mass_in_millions_of_kg integer,
    orbital_period numeric,
    visible_with_naked_eye boolean,
    within_solar_system boolean,
    description text
);


ALTER TABLE public.minor_planets_and_comets_visited_by_spacecraft OWNER TO freecodecamp;

--
-- Name: minor_planets_and_comets_visited_by_spacecraft_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.minor_planets_and_comets_visited_by_spacecraft_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minor_planets_and_comets_visited_by_spacecraft_body_id_seq OWNER TO freecodecamp;

--
-- Name: minor_planets_and_comets_visited_by_spacecraft_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.minor_planets_and_comets_visited_by_spacecraft_body_id_seq OWNED BY public.minor_planets_and_comets_visited_by_spacecraft.minor_planets_and_comets_visited_by_spacecraft_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying NOT NULL,
    description text NOT NULL,
    mass_in_quintillions_of_kg integer,
    radius_in_km integer,
    water_detected boolean,
    visible_with_naked_eye boolean
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
    star_id integer,
    name character varying NOT NULL,
    description text NOT NULL,
    radius_in_thousands_of_km integer,
    mass_in_quintillions_of_kg integer,
    known_to_support_life boolean,
    has_liquad_water boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying NOT NULL,
    desctiption text NOT NULL,
    solar_radius integer,
    solar_mass_in_exponents_of_10 integer,
    visible_to_naked_eye boolean,
    nuclear_active boolean
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
-- Name: minor_planets_and_comets_visited_by_spacecraft minor_planets_and_comets_visited_by_spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planets_and_comets_visited_by_spacecraft ALTER COLUMN minor_planets_and_comets_visited_by_spacecraft_id SET DEFAULT nextval('public.minor_planets_and_comets_visited_by_spacecraft_body_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 30, 12, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The closest large galaxy to the Milky Way, a spiral galaxy.', 46, 12, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy in the Local Group.', 18, 11, true, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A spiral galaxy with a prominent central bulge and dust lane.', 15, 12, false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A grand-design spiral galaxy interacting with a smaller companion.', 23, 11, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'A lenticular galaxy with a prominent dust lane and active galactic nucleus.', 43, 11, false, true);


--
-- Data for Name: minor_planets_and_comets_visited_by_spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (1, '951 Gaspra', 10, 3.29, false, true, 'S-type asteroid visited by Galileo spacecraft.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (2, '243 Ida', 42, 4.84, false, true, 'S-type asteroid visited by Galileo spacecraft, with its moon Dactyl.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (3, '433 Eros', 6687, 1.76, false, true, 'S-type near-Earth asteroid visited by NEAR Shoemaker, first asteroid orbited by a spacecraft.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (4, '253 Mathilde', 100000, 4.31, false, true, 'C-type asteroid visited by NEAR Shoemaker, known for its large craters.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (5, '19P/Borrelly', 3000, 6.85, false, true, 'Comet visited by Deep Space 1 spacecraft, known for its dark nucleus.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (6, '81P/Wild 2', 23000, 6.39, false, true, 'Comet visited by Stardust spacecraft, samples returned to Earth.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (7, '5530 Echegaray', 10000, 3.5, false, true, 'Asteroid visited by Deep Space 1 spacecraft during its extended mission.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (8, '9969 Braille', 10, 3.58, false, true, 'S-type asteroid visited by Deep Space 1 spacecraft, flew by at a high speed.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (9, '2867 Šteins', 2700, 3.44, false, true, 'E-type asteroid visited by Rosetta spacecraft, known for its diamond-like appearance.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (10, '21 Lutetia', 1700000, 3.65, false, true, 'M-type asteroid visited by Rosetta spacecraft, one of the largest main-belt asteroids explored.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (11, '103P/Hartley 2', 300, 6.46, false, true, 'Comet visited by EPOXI spacecraft, known for its hyperactive jets.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (12, '1P/Halley', 220000, 75.3, false, true, 'Famous periodic comet visited by Giotto, Vega, and other spacecraft.');
INSERT INTO public.minor_planets_and_comets_visited_by_spacecraft VALUES (13, '9P/Tempel 1', 79000, 5.5, false, true, 'Comet visited by Deep Impact and Stardust NExT spacecraft, impact experiment conducted.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 3, 'Moon', 'Earths natural satellite.', 73500, 1737, true, true);
INSERT INTO public.moon VALUES (4, 4, 'Phobos', 'Mars"s larger moon.', 10, 11, false, false);
INSERT INTO public.moon VALUES (5, 4, 'Deimos', 'Mars"s smaller moon.', 2, 6, false, false);
INSERT INTO public.moon VALUES (6, 5, 'Io', 'Jupiter"s volcanically active moon.', 89300, 1821, false, false);
INSERT INTO public.moon VALUES (7, 5, 'Europa', 'Jupiter"s icy moon with a subsurface ocean.', 48000, 1560, true, false);
INSERT INTO public.moon VALUES (8, 5, 'Ganymede', 'Jupiter"s largest moon, with a magnetic field.', 148000, 2634, true, false);
INSERT INTO public.moon VALUES (9, 5, 'Callisto', 'Jupiter"s heavily cratered moon.', 108000, 2410, true, false);
INSERT INTO public.moon VALUES (10, 6, 'Titan', 'Saturn"s largest moon, with a dense atmosphere.', 134500, 2575, false, false);
INSERT INTO public.moon VALUES (11, 6, 'Rhea', 'Saturn"s second-largest moon.', 2300, 764, false, false);
INSERT INTO public.moon VALUES (12, 6, 'Iapetus', 'Saturn"s moon with a two-toned appearance.', 1800, 734, false, false);
INSERT INTO public.moon VALUES (13, 6, 'Dione', 'Satraturn"s icy moon with fractures.', 1100, 561, false, false);
INSERT INTO public.moon VALUES (14, 6, 'Tethys', 'Saturn"s icy moon with a large impact crater.', 620, 531, false, false);
INSERT INTO public.moon VALUES (15, 6, 'Enceladus', 'Saturn"s icy moon with geysers and a subsurface ocean.', 1080, 252, true, false);
INSERT INTO public.moon VALUES (16, 7, 'Miranda', 'Uranus"s smallest and innermost moon.', 66, 235, false, false);
INSERT INTO public.moon VALUES (17, 7, 'Ariel', 'Uranus"s fourth-largest moon.', 135, 578, false, false);
INSERT INTO public.moon VALUES (18, 7, 'Umbriel', 'Uranus"s dark and heavily cratered moon.', 117, 584, false, false);
INSERT INTO public.moon VALUES (19, 7, 'Titania', 'Uranus"s largest moon.', 352, 788, false, false);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 'Neptune"s largest moon, with cryovolcanoes.', 21400, 1353, false, false);
INSERT INTO public.moon VALUES (21, 5, 'Metis', 'Jupiter"s innermost satellite', 0, 21, false, false);
INSERT INTO public.moon VALUES (22, 5, 'Adrastea', 'Jupiter"s second innermost satellite', 0, 8, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'The closest planet to the Sun.', 2, 330, false, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'A hot, dense planet with a thick atmosphere.', 6, 4870, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Our home planet, with diverse life and liquid water.', 6, 5972200, true, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'A cold, dusty planet with evidence of past water.', 3, 640, false, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'The largest planet, a gas giant with many moons.', 70, 1898000, false, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'A gas giant with prominent rings.', 58, 568000, false, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'An ice giant with a tilted axis.', 25, 86800, false, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'A dark, cold ice giant.', 24, 102000, false, false);
INSERT INTO public.planet VALUES (9, 4, 'Sirius b', 'A white dwarf companion to Sirius A.', 6, 1000000, false, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri in the habitable zone.', 7, 6000000, false, false);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri c', 'Another exoplanet orbiting proxima centauri.', 6, 5000000, false, false);
INSERT INTO public.planet VALUES (12, 3, 'Alpha Andromedae b', 'An exoplanet orbiting Alpha Andromedae.', 80, 20000000, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Our local star, a G-type main-sequence star.', 1, 0, true, true);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'A red dwarf star, the closest star to the Sun.', 0, -1, true, true);
INSERT INTO public.star VALUES (3, 2, 'Alpha Andromedae', 'A binary star system in the Andromeda Galaxy.', 2, 1, true, true);
INSERT INTO public.star VALUES (4, 1, 'Sirius A', 'The brightest star in the night sky, a main-sequence star.', 2, 0, true, true);
INSERT INTO public.star VALUES (5, 3, 'M33-013406.63+303914.6', 'A blue supergiant in the Triangulum Galaxy', 100, 2, false, true);
INSERT INTO public.star VALUES (6, 1, 'Betelgeuse', 'A red supergiant star in the Milky Way.', 900, 2, true, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: minor_planets_and_comets_visited_by_spacecraft_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minor_planets_and_comets_visited_by_spacecraft_body_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: minor_planets_and_comets_visited_by_spacecraft minor_planets_and_comets_visited_by_spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planets_and_comets_visited_by_spacecraft
    ADD CONSTRAINT minor_planets_and_comets_visited_by_spacecraft_name_key UNIQUE (name);


--
-- Name: minor_planets_and_comets_visited_by_spacecraft minor_planets_and_comets_visited_by_spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planets_and_comets_visited_by_spacecraft
    ADD CONSTRAINT minor_planets_and_comets_visited_by_spacecraft_pkey PRIMARY KEY (minor_planets_and_comets_visited_by_spacecraft_id);


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

