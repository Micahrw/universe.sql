--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(20) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_km numeric(4,1),
    description text,
    has_life boolean,
    is_spherical boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_km numeric(4,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    diameter_in_km integer,
    planet_id integer
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
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20),
    moon_planet_id integer NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_km numeric(4,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    diameter_in_km integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    age_in_million_of_years integer NOT NULL,
    distance_from_earth_in_km numeric(4,1) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    diameter_in_km integer,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky way', 130000, 0.0, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 22000, 2.5, 'Nearest spiral galaxy to Milk way', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13000, 3.0, 'Smallest spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier', 65000, 53.5, 'Elliptical galaxy in the virgo cluster', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 95000, 28.0, 'Spiral galaxy with a distinctive shape', false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 50000, 23.0, 'Interacting spiral galaxy pair', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Luna', 4500, 0.4, 'Earth natural satellite', false, true, 3475, 1);
INSERT INTO public.moon VALUES (8, 'Phobos', 4500, 77.2, 'Mars innermost moon', false, true, 22, 1);
INSERT INTO public.moon VALUES (9, 'Deimos', 4500, 63.2, 'Mars outermost moon', false, true, 12, 1);
INSERT INTO public.moon VALUES (10, 'Io', 4500, 42.1, 'Jupiter volcanic moon', false, true, 3643, 2);
INSERT INTO public.moon VALUES (11, 'Europa', 4500, 67.1, 'Jupiter ice-covered moon', false, true, 3122, 2);
INSERT INTO public.moon VALUES (12, 'Ganymede', 4500, 107.0, 'Largest moon in the solar system', false, true, 5262, 2);
INSERT INTO public.moon VALUES (13, 'Callisto', 4500, 188.2, 'Jupiter heavily cratered moon', false, true, 4800, 3);
INSERT INTO public.moon VALUES (14, 'Titan', 4500, 122.9, 'Saturn largest moon', false, true, 5150, 3);
INSERT INTO public.moon VALUES (15, 'Enceladus', 4500, 238.0, 'Saturn icy moon with geysers', false, true, 504, 3);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 4500, 37.4, 'Eris moon', false, true, 500, 4);
INSERT INTO public.moon VALUES (19, 'Prometheus', 4500, 139.0, 'Saturn moon known for interactions with its rings', false, true, 86, 5);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 4500, 151.0, 'Saturns co-orbital moon with Janus', false, true, 119, 5);
INSERT INTO public.moon VALUES (21, 'Oberon', 4500, 583.5, 'Uranus outermost moon', false, true, 1523, 5);
INSERT INTO public.moon VALUES (22, 'Miranda', 4500, 129.9, 'Uranus small, heavily cratered moon', false, true, 471, 6);
INSERT INTO public.moon VALUES (23, 'Nereid', 4500, 551.3, 'Neptunes third-largest moon', false, true, 340, 7);
INSERT INTO public.moon VALUES (24, 'Pandora', 4500, 141.0, 'Saturns shepherd moon of the  ring', false, true, 81, 8);
INSERT INTO public.moon VALUES (25, 'Amalthea', 4500, 181.4, 'One of Jupiters innermost moons', false, true, 250, 9);
INSERT INTO public.moon VALUES (26, 'Hyperion', 4500, 147.3, 'Saturn irregularly shaped moon', false, true, 360, 10);
INSERT INTO public.moon VALUES (16, 'Triton', 4500, 354.0, 'Neptune largest moon', false, true, 2707, 11);
INSERT INTO public.moon VALUES (17, 'Charon', 4500, 19.0, 'Pluto largest moon', false, true, 1207, 12);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 3, 'Sun', 1);
INSERT INTO public.moon_planet VALUES (1, 2, 'Venus', 2);
INSERT INTO public.moon_planet VALUES (1, 4, 'Mars', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 77.3, 'Closest planet to the sun', false, true, 4879, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 38.7, 'Similar size to Earth', false, true, 12104, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 0.0, 'Our home planet', true, true, 12742, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 225.0, 'The red planet', false, false, 6779, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 778.3, 'Largest planet in our solar system', false, true, 139820, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 147.0, 'Known for its rings', false, true, 116460, 3);
INSERT INTO public.planet VALUES (7, 'Urasnus', 4500, 287.0, 'Seventh Planet from the sun', false, true, 507420, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 496.0, 'Eigth and farthest known planet from the sun', false, true, 49244, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500, 496.0, 'Eigth and known farthest planet from the sun', false, true, 49224, 5);
INSERT INTO public.planet VALUES (10, 'Eris', 4500, 96.4, 'Dwarf Planet', false, true, 2326, 5);
INSERT INTO public.planet VALUES (11, 'Haumea', 4500, 49.5, 'Dwarf Planet', false, true, 1920, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', 4500, 52.0, 'Dwarf Planet', false, true, 1434, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 4500, 0.1, 'star in our Solar system', true, true, 23, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 6000, 4.4, 'Closest star known to our solar system', false, true, 547, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 6000, 4.1, 'Same as Alpha Centauri', false, true, 642, 2);
INSERT INTO public.star VALUES (4, 'Sirius', 200, 8.6, 'Brightest star in the universe', false, true, 456, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8000, 42.4, 'Red supergiant in the constellation in the universe', false, true, 444, 3);
INSERT INTO public.star VALUES (6, 'Polaris', 70, 43.3, 'North Star, a part of our solar system', false, true, 472, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: moon_planet name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

