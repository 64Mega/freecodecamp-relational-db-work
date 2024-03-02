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
    name character varying(60) NOT NULL,
    distance_in_lightyears integer,
    visited boolean,
    description character varying(80) NOT NULL,
    approximate_star_clusters integer NOT NULL
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    gravity_relative_to_planet numeric(4,3) NOT NULL,
    distance_from_planet integer NOT NULL,
    features text
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    inhabited boolean,
    description text,
    position_from_star integer,
    habitable_zone boolean
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
-- Name: settlements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.settlements (
    settlements_id integer NOT NULL,
    name character varying(60) NOT NULL,
    population integer,
    safe_to_visit boolean,
    description text NOT NULL,
    planet_id integer NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.settlements OWNER TO freecodecamp;

--
-- Name: settlements_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.settlements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settlements_id_seq OWNER TO freecodecamp;

--
-- Name: settlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.settlements_id_seq OWNED BY public.settlements.settlements_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_center_ltyears numeric(4,1),
    type character varying(20),
    has_life boolean,
    description text NOT NULL
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
-- Name: settlements settlements_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.settlements ALTER COLUMN settlements_id SET DEFAULT nextval('public.settlements_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, 'Home', 12324123);
INSERT INTO public.galaxy VALUES (2, 'Euclid', 3634634, false, 'No Man''s eyes may see these Skies', 14233435);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 25231, true, 'Close but still pretty far', 43634532);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 634534, false, 'Another galaxy far, far away', 12324123);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 25232325, false, 'Travel advisory deems visitation unsafe', 12324123);
INSERT INTO public.galaxy VALUES (6, 'Cluster 433', 6345234, true, 'Information Redacted', 12324123);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Betelgeuse Ia', 2, 0.200, 50000, 'A large and rocky moon that has a thin atmosphere and a volcanic activity. A source of rare minerals and geothermal energy.');
INSERT INTO public.moon VALUES (2, 'Betelgeuse Ib', 2, 0.100, 100000, 'A small and icy moon that has a frozen surface and a subterranean ocean. A potential habitat for microbial life and cryogenic experiments.');
INSERT INTO public.moon VALUES (3, 'Sirius Aa1', 3, 0.300, 200000, 'A medium and gaseous moon that has a stormy atmosphere and a powerful magnetic field. A site of spectacular auroras and lightning storms.');
INSERT INTO public.moon VALUES (4, 'Sirius Aa2', 3, 0.200, 300000, 'A medium and rocky moon that has a moderate atmosphere and a diverse terrain. A location of ancient ruins and mysterious artifacts.');
INSERT INTO public.moon VALUES (5, 'Vega b1', 4, 0.400, 10000, 'A large and terrestrial moon that has a breathable atmosphere and a rich biosphere. A home to many exotic life forms and natural wonders.');
INSERT INTO public.moon VALUES (6, 'Vega b2', 4, 0.300, 20000, 'A large and water moon that has a thick atmosphere and a global ocean. A place to enjoy aquatic sports and marine exploration.');
INSERT INTO public.moon VALUES (7, 'Polaris Aa1', 5, 0.100, 500000, 'A small and rocky moon that has a thin atmosphere and a dusty surface. A destination for stargazing and astronomy.');
INSERT INTO public.moon VALUES (8, 'Polaris Aa2', 5, 0.050, 1000000, 'A small and icy moon that has a frozen surface and a faint ring system. A spot for ice skating and snowboarding.');
INSERT INTO public.moon VALUES (9, 'Antares Aa1', 6, 0.500, 100000, 'A large and gaseous moon that has a bright ring system and many moons. A spectacle for sightseeing and photography.');
INSERT INTO public.moon VALUES (10, 'Antares Aa2', 6, 0.400, 200000, 'A large and rocky moon that has a thick atmosphere and a high temperature. A challenge for survival and endurance.');
INSERT INTO public.moon VALUES (11, 'Betelgeuse Ia - Mirrored', 2, 0.200, 50000, 'A large and rocky moon that has a thin atmosphere and a volcanic activity. A source of rare minerals and geothermal energy.');
INSERT INTO public.moon VALUES (12, 'Betelgeuse Ib - Mirrored', 2, 0.100, 100000, 'A small and icy moon that has a frozen surface and a subterranean ocean. A potential habitat for microbial life and cryogenic experiments.');
INSERT INTO public.moon VALUES (13, 'Sirius Aa1 - Mirrored', 3, 0.300, 200000, 'A medium and gaseous moon that has a stormy atmosphere and a powerful magnetic field. A site of spectacular auroras and lightning storms.');
INSERT INTO public.moon VALUES (14, 'Sirius Aa2 - Mirrored', 3, 0.200, 300000, 'A medium and rocky moon that has a moderate atmosphere and a diverse terrain. A location of ancient ruins and mysterious artifacts.');
INSERT INTO public.moon VALUES (15, 'Vega b1 - Mirrored', 4, 0.400, 10000, 'A large and terrestrial moon that has a breathable atmosphere and a rich biosphere. A home to many exotic life forms and natural wonders.');
INSERT INTO public.moon VALUES (16, 'Vega b2 - Mirrored', 4, 0.300, 20000, 'A large and water moon that has a thick atmosphere and a global ocean. A place to enjoy aquatic sports and marine exploration.');
INSERT INTO public.moon VALUES (17, 'Polaris Aa1 - Mirrored', 5, 0.100, 500000, 'A small and rocky moon that has a thin atmosphere and a dusty surface. A destination for stargazing and astronomy.');
INSERT INTO public.moon VALUES (18, 'Polaris Aa2 - Mirrored', 5, 0.050, 1000000, 'A small and icy moon that has a frozen surface and a faint ring system. A spot for ice skating and snowboarding.');
INSERT INTO public.moon VALUES (19, 'Antares Aa1 - Mirrored', 6, 0.500, 100000, 'A large and gaseous moon that has a bright ring system and many moons. A spectacle for sightseeing and photography.');
INSERT INTO public.moon VALUES (20, 'Antares Aa2 - Mirrored', 6, 0.400, 200000, 'A large and rocky moon that has a thick atmosphere and a high temperature. A challenge for survival and endurance.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 1, true, 'A rocky planet with a thin atmosphere and a large ocean. The only known planet outside the Solar System that harbors intelligent life.', 1, true);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri c', 1, false, 'An icy planet with a thick atmosphere and a frozen surface. A potential source of water and minerals for explorers.', 2, false);
INSERT INTO public.planet VALUES (3, 'Alpha Centauri Bb', 1, false, 'A hot and barren planet that orbits very close to its star. A hellish world that is unsuitable for any life.', 1, false);
INSERT INTO public.planet VALUES (4, 'Betelgeuse I', 2, false, 'A gas giant with a massive ring system and dozens of moons. A majestic and colorful world that attracts many visitors.', 1, false);
INSERT INTO public.planet VALUES (5, 'Betelgeuse II', 2, false, 'A rocky planet with a thin atmosphere and a volcanic activity. A dangerous and unstable world that is prone to eruptions and quakes.', 2, false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse III', 2, false, 'A frozen planet with a thick atmosphere and a snow-covered surface. A cold and desolate world that is rarely visited.', 3, false);
INSERT INTO public.planet VALUES (7, 'Sirius Aa', 3, false, 'A gas giant with a powerful magnetic field and a stormy atmosphere. A turbulent and chaotic world that is difficult to approach.', 1, false);
INSERT INTO public.planet VALUES (8, 'Sirius Ab', 3, false, 'A rocky planet with a dense atmosphere and a high gravity. A hot and oppressive world that is inhospitable to life.', 2, false);
INSERT INTO public.planet VALUES (9, 'Sirius Bb', 3, false, 'A dwarf planet with a thin atmosphere and a rocky surface. A dark and lonely world that orbits a white dwarf star.', 1, false);
INSERT INTO public.planet VALUES (10, 'Vega b', 4, true, 'A terrestrial planet with a breathable atmosphere and a rich biosphere. A diverse and vibrant world that hosts many exotic life forms.', 1, true);
INSERT INTO public.planet VALUES (11, 'Vega c', 4, true, 'A water planet with a thick atmosphere and a global ocean. A wet and wild world that is home to many aquatic life forms.', 2, true);
INSERT INTO public.planet VALUES (12, 'Vega d', 4, false, 'A desert planet with a thin atmosphere and a sandy surface. A dry and barren world that is devoid of any life.', 3, false);
INSERT INTO public.planet VALUES (13, 'Polaris Aa', 5, false, 'A gas giant with a faint ring system and a few moons. A calm and serene world that is often used as a reference point for navigation.', 1, false);
INSERT INTO public.planet VALUES (14, 'Polaris Ab', 5, false, 'A rocky planet with a moderate atmosphere and a temperate climate. A pleasant and habitable world that is suitable for colonization.', 2, true);
INSERT INTO public.planet VALUES (15, 'Polaris Bb', 5, false, 'A dwarf planet with a thin atmosphere and a icy surface. A cold and remote world that orbits a red dwarf star.', 1, false);
INSERT INTO public.planet VALUES (16, 'Antares Aa', 6, false, 'A gas giant with a bright ring system and many moons. A colossal and luminous world that is close to its star.', 1, false);
INSERT INTO public.planet VALUES (17, 'Antares Ab', 6, false, 'A rocky planet with a thick atmosphere and a high temperature. A scorching and suffocating world that is hostile to life.', 2, false);
INSERT INTO public.planet VALUES (18, 'Antares Bb', 6, false, 'A dwarf planet with a thin atmosphere and a rocky surface. A dim and distant world that orbits a blue-white star.', 1, false);


--
-- Data for Name: settlements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.settlements VALUES (1, 'New Terra', 10, true, 'A colony of human settlers who have established a peaceful coexistence with the native aliens. A cosmopolitan and cultural hub that welcomes visitors from all over the galaxy.', 1, 'City');
INSERT INTO public.settlements VALUES (2, 'Proximia', 1, false, 'A research station of scientists and explorers who study the planet and its life forms. A risky and adventurous place that requires special permits and precautions.', 1, 'Outpost');
INSERT INTO public.settlements VALUES (3, 'Vega Prime', 5, true, 'A capital of a federation of planetary states that have united under a common vision. A prosperous and advanced city that showcases the best of technology and ecology.', 4, 'City');
INSERT INTO public.settlements VALUES (4, 'Vega Secundus', 1, false, 'A frontier town of traders and adventurers who seek opportunities and challenges in the outer regions. A rough and rugged town that is not for the faint of heart.', 4, 'Town');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 1, 2.6, 'Binary', true, 'The closest star system to Earth, home to a habitable planet and a mysterious alien civilization.');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 2.7, 'Single', false, 'A massive red supergiant that is expected to go supernova in the near future. A spectacular sight for stargazers and thrill-seekers.');
INSERT INTO public.star VALUES (3, 'Sirius', 3, 2.5, 'Binary', false, 'The brightest star in the night sky, also known as the Dog Star. A popular destination for space tourists and dog lovers.');
INSERT INTO public.star VALUES (4, 'Vega', 4, 1.2, 'Single', true, 'A young and hot blue-white star that hosts a complex planetary system with diverse life forms. A prime spot for exploration and discovery.');
INSERT INTO public.star VALUES (5, 'Polaris', 5, 3.0, 'Triple', false, 'The North Star, a stable and reliable guide for navigators and adventurers. A symbol of hope and insipration for many cultures.');
INSERT INTO public.star VALUES (6, 'Antares', 6, 5.5, 'Binary', false, 'A colossal red supergiant that is one of the largest and most luminous stars in the galaxy. An awe-inspiring spectacle for those who dare approach it.');


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

SELECT pg_catalog.setval('public.planet_id_seq', 18, true);


--
-- Name: settlements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.settlements_id_seq', 4, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: settlements settlements_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.settlements
    ADD CONSTRAINT settlements_name_key UNIQUE (name);


--
-- Name: settlements settlements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.settlements
    ADD CONSTRAINT settlements_pkey PRIMARY KEY (settlements_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- Name: settlements settelements_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.settlements
    ADD CONSTRAINT settelements_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

