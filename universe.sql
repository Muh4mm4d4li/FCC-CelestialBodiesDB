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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    meaning text,
    description text,
    number_of_stars integer,
    distance_from_earth_ly numeric
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50),
    distance_from_earth_ly numeric,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean NOT NULL,
    has_life boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
    name character varying(100) NOT NULL,
    star_id integer,
    description text,
    planet_type character varying(50),
    is_spherical boolean NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text,
    is_spherical boolean NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Hunter', 'Orion is a prominent constellation located on the celestial equator and visible throughout the world.', 7, 1344);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Great Bear', 'Ursa Major is a well-known constellation in the northern celestial hemisphere.', 7, 78);
INSERT INTO public.constellation VALUES (3, 'Cygnus', 'Swan', 'Cygnus is a northern constellation lying on the plane of the Milky Way, deriving its name from the Latinized Greek word for swan.', 9, 59);
INSERT INTO public.constellation VALUES (4, 'Cassiopeia', 'Queen', 'Cassiopeia is a constellation in the northern sky, named after the vain queen Cassiopeia in Greek mythology, who boasted about her unrivaled beauty.', 5, 550);
INSERT INTO public.constellation VALUES (5, 'Leo', 'Lion', 'Leo is one of the constellations of the zodiac, lying between Cancer the crab to the west and Virgo the maiden to the east.', 9, 79);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 100000, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to Milky Way', 'Spiral', 2530000, 14000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 'Spiral', 3000000, 13000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting spiral galaxy', 'Spiral', 23000000, 500);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a prominent bulge', 'Spiral', 28000000, 11000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 'Irregular', 160000, 13000);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 'Satellite galaxy of the Milky Way', 'Irregular', 200000, 20000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (193, 'Moon', 1, 'Earth''s only natural satellite', true, false, 0.384, 4500);
INSERT INTO public.moon VALUES (194, 'Phobos', 2, 'Larger and closer of Mars''s two moons', true, false, 0.009, 4500);
INSERT INTO public.moon VALUES (195, 'Deimos', 2, 'Smaller and farther of Mars''s two moons', true, false, 0.023, 4500);
INSERT INTO public.moon VALUES (196, 'Europa', 3, 'Moon of Jupiter, has subsurface ocean', true, false, 628, 4500);
INSERT INTO public.moon VALUES (197, 'Ganymede', 3, 'Largest moon of Jupiter and in the Solar System', true, false, 1070, 4500);
INSERT INTO public.moon VALUES (198, 'Titan', 4, 'Largest moon of Saturn', true, false, 1250, 4500);
INSERT INTO public.moon VALUES (199, 'Triton', 5, 'Largest moon of Neptune', true, false, 354, 4500);
INSERT INTO public.moon VALUES (200, 'Io', 3, 'Most volcanically active body in the Solar System', true, false, 628, 4500);
INSERT INTO public.moon VALUES (201, 'Callisto', 3, 'Second-largest moon of Jupiter', true, false, 1276, 4500);
INSERT INTO public.moon VALUES (202, 'Enceladus', 4, 'Moon of Saturn, known for its geysers', true, false, 1422, 4500);
INSERT INTO public.moon VALUES (203, 'Charon', 6, 'Largest moon of Pluto', true, false, 3903, 4500);
INSERT INTO public.moon VALUES (204, 'Phobos 2', 2, 'Larger and closer of Mars''s two moons', true, false, 0.009, 2000);
INSERT INTO public.moon VALUES (205, 'Deimos 2', 2, 'Smaller and farther of Mars''s two moons', true, false, 0.023, 2000);
INSERT INTO public.moon VALUES (206, 'GJ 436b Moon', 7, 'Exomoon orbiting the exoplanet GJ 436', true, false, 33.4, 2000);
INSERT INTO public.moon VALUES (207, 'HD 189733b b Moon', 8, 'Exomoon orbiting the exoplanet HD 189733b', true, false, 0.0317, 2000);
INSERT INTO public.moon VALUES (208, '51 Pegasi b b Moon', 9, 'Exomoon orbiting the exoplanet 51 Pegasi b', true, false, 0.052, 2000);
INSERT INTO public.moon VALUES (209, '55 Cancri b b Moon', 10, 'Exomoon orbiting the exoplanet 55 Cancri b', true, false, 0.115, 2000);
INSERT INTO public.moon VALUES (210, 'Kepler-1625b I Moon', 11, 'Exomoon orbiting the exoplanet Kepler-1625b', true, false, 3838, 2000);
INSERT INTO public.moon VALUES (211, 'Proxima Centauri b Moon', 12, 'Exomoon orbiting the exoplanet Proxima Centauri', true, false, 40000, 2000);
INSERT INTO public.moon VALUES (212, 'Gliese 581c b Moon', 12, 'Exomoon orbiting the exoplanet Gliese 581c', true, false, 20000, 2000);
INSERT INTO public.moon VALUES (213, 'HD 209458 b Moon', 12, 'Exomoon orbiting the exoplanet HD 209458', true, false, 153, 2000);
INSERT INTO public.moon VALUES (214, 'WASP-1628b I Moon', 12, 'Exomoon orbiting the exoplanet WASP-1628b', true, false, 4500, 2000);
INSERT INTO public.moon VALUES (215, 'HD 131399Ab I Moon', 12, 'Exomoon orbiting the exoplanet HD 131399Ab', true, false, 320, 2000);
INSERT INTO public.moon VALUES (216, 'KOI-314c I Moon', 12, 'Exomoon orbiting the exoplanet KOI-314c', true, false, 1990, 2000);
INSERT INTO public.moon VALUES (217, 'PSR B1620-26 b I Moon', 12, 'Exomoon orbiting the exoplanet PSR B1620-26 b', true, false, 12222, 2000);
INSERT INTO public.moon VALUES (218, 'OGLE-2013-BLG-0341L b I Moon', 12, 'Exomoon orbiting the exoplanet OGLE-2013-BLG-0341L b', true, false, 49600, 2000);
INSERT INTO public.moon VALUES (219, 'Kepler-1647b I Moon', 12, 'Exomoon orbiting the exoplanet Kepler-1647b', true, false, 3167, 2000);
INSERT INTO public.moon VALUES (220, 'Kepler-420b I Moon', 12, 'Exomoon orbiting the exoplanet Kepler-420b', true, false, 392, 2000);
INSERT INTO public.moon VALUES (221, 'Kepler-1647b II Moon', 12, 'Exomoon orbiting the exoplanet Kepler-1647b', true, false, 3167, 2000);
INSERT INTO public.moon VALUES (222, 'HD 131399Ab II Moon', 12, 'Exomoon orbiting the exoplanet HD 131399Ab', true, false, 320, 2000);
INSERT INTO public.moon VALUES (223, 'TrES-3b I Moon', 12, 'Exomoon orbiting the exoplanet TrES-3b', true, false, 489, 2000);
INSERT INTO public.moon VALUES (224, 'HATS-6b I Moon', 12, 'Exomoon orbiting the exoplanet HATS-6b', true, false, 921, 2000);
INSERT INTO public.moon VALUES (225, 'Kepler-1628b I Moon', 12, 'Exomoon orbiting the exoplanet Kepler-1628b', true, false, 4500, 2000);
INSERT INTO public.moon VALUES (226, 'Kepler-1647b III Moon', 12, 'Exomoon orbiting the exoplanet Kepler-1647b', true, false, 3167, 2000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Third planet from the Sun', 'Terrestrial', true, 1, 4500);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Fourth planet from the Sun', 'Terrestrial', true, 1.5, 4500);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Fifth planet from the Sun', 'Gas Giant', true, 5.2, 4500);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Sixth planet from the Sun', 'Gas Giant', true, 9.5, 4500);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 'Closest planet to the Sun', 'Terrestrial', true, 0.4, 4500);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 'Second planet from the Sun', 'Terrestrial', true, 0.7, 4500);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 'Eighth planet from the Sun', 'Ice Giant', true, 30.1, 4500);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Seventh planet from the Sun', 'Ice Giant', true, 19.2, 4500);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 2, 'Exoplanet orbiting in the habitable zone of Kepler-442', 'Terrestrial', true, 1200, 2000);
INSERT INTO public.planet VALUES (10, 'Gliese 581c', 2, 'Exoplanet orbiting in the habitable zone of Gliese 581', 'Terrestrial', true, 20, 2000);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 2, 'Hot Jupiter exoplanet', 'Gas Giant', true, 63, 2000);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 2, 'Hot Jupiter exoplanet', 'Gas Giant', true, 50, 2000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Main-sequence G-type star', true, false, 4500);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf star closest to the Sun', true, false, 5619);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Brightest star in the night sky', true, false, 237);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'Closest star system to the Sun', true, false, 6000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, 'Closest star system to the Sun', true, false, 5500);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 2, 'Red supergiant star in the constellation Orion', true, false, 8000);
INSERT INTO public.star VALUES (7, 'Rigel', 2, 'Blue supergiant star in the constellation Orion', true, false, 9000);
INSERT INTO public.star VALUES (8, 'Polaris', 1, 'North Star, located in the constellation Ursa Minor', true, false, 4600);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 226, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

