--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-08-28 15:34:19

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 7315 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 895 (class 1247 OID 2414314)
-- Name: enum_factories_verified; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_factories_verified AS ENUM (
    '0',
    '1'
);


ALTER TYPE public.enum_factories_verified OWNER TO postgres;

--
-- TOC entry 874 (class 1247 OID 1588931)
-- Name: enum_purchasingOrders_paymentType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_purchasingOrders_paymentType" AS ENUM (
    'cash',
    'card'
);


ALTER TYPE public."enum_purchasingOrders_paymentType" OWNER TO postgres;

--
-- TOC entry 886 (class 1247 OID 2412755)
-- Name: enum_subscriptions_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_subscriptions_type AS ENUM (
    'Free',
    'Standard',
    'Gold',
    'Premium'
);


ALTER TYPE public.enum_subscriptions_type OWNER TO postgres;

--
-- TOC entry 892 (class 1247 OID 2412775)
-- Name: enum_users_language; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_language AS ENUM (
    'english',
    'arabic',
    'german',
    'french'
);


ALTER TYPE public.enum_users_language OWNER TO postgres;

--
-- TOC entry 856 (class 1247 OID 1588862)
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'importer',
    'factory',
    'user',
    'shippingCompany'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 1588880)
-- Name: contactUs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."contactUs" (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    message character varying(255) NOT NULL,
    company character varying(255),
    address character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."contactUs" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 1588879)
-- Name: contactUs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."contactUs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."contactUs_id_seq" OWNER TO postgres;

--
-- TOC entry 7316 (class 0 OID 0)
-- Dependencies: 217
-- Name: contactUs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."contactUs_id_seq" OWNED BY public."contactUs".id;


--
-- TOC entry 220 (class 1259 OID 1588889)
-- Name: factories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factories (
    id integer NOT NULL,
    name character varying(255),
    description text,
    address character varying(255)[],
    "coverImage" character varying(255),
    images character varying(255)[],
    phone character varying(255),
    country character varying(255),
    city character varying(255),
    "socialLinks" jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.factories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 1588888)
-- Name: factories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factories_id_seq OWNER TO postgres;

--
-- TOC entry 7317 (class 0 OID 0)
-- Dependencies: 219
-- Name: factories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factories_id_seq OWNED BY public.factories.id;


--
-- TOC entry 229 (class 1259 OID 1588965)
-- Name: ordersProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ordersProducts" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productId" integer,
    "purchasingOrderId" integer,
    "userId" integer
);


ALTER TABLE public."ordersProducts" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 1588964)
-- Name: ordersProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ordersProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ordersProducts_id_seq" OWNER TO postgres;

--
-- TOC entry 7318 (class 0 OID 0)
-- Dependencies: 228
-- Name: ordersProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ordersProducts_id_seq" OWNED BY public."ordersProducts".id;


--
-- TOC entry 224 (class 1259 OID 1588911)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "coverImage" character varying(255),
    images character varying(255)[],
    price double precision,
    available boolean DEFAULT true,
    "availableSize" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "factoryId" integer,
    "sectorId" integer,
    "DescriptionPoints" character varying(255)[],
    "IndicationPoints" character varying(255)[],
    "factoryName" character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 1588949)
-- Name: productsIds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."productsIds" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "purchasingOrderId" integer NOT NULL,
    "productId" integer NOT NULL
);


ALTER TABLE public."productsIds" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 1588910)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 7319 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 226 (class 1259 OID 1588936)
-- Name: purchasingOrders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."purchasingOrders" (
    id integer NOT NULL,
    "totalPrice" double precision,
    "productsIds" integer[],
    "paymentType" public."enum_purchasingOrders_paymentType",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "extraDetails" character varying(255),
    quantity jsonb
);


ALTER TABLE public."purchasingOrders" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 1588935)
-- Name: purchasingOrders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."purchasingOrders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."purchasingOrders_id_seq" OWNER TO postgres;

--
-- TOC entry 7320 (class 0 OID 0)
-- Dependencies: 225
-- Name: purchasingOrders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."purchasingOrders_id_seq" OWNED BY public."purchasingOrders".id;


--
-- TOC entry 222 (class 1259 OID 1588900)
-- Name: sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sectors OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 1588899)
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sectors_id_seq OWNER TO postgres;

--
-- TOC entry 7321 (class 0 OID 0)
-- Dependencies: 221
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectors_id_seq OWNED BY public.sectors.id;


--
-- TOC entry 231 (class 1259 OID 2412764)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type public.enum_subscriptions_type,
    description character varying(255)[] NOT NULL,
    price double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 2412763)
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO postgres;

--
-- TOC entry 7322 (class 0 OID 0)
-- Dependencies: 230
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- TOC entry 216 (class 1259 OID 1588868)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255)[],
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(255),
    role public.enum_users_role DEFAULT 'user'::public.enum_users_role,
    logout boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    company character varying(255),
    city character varying(255),
    country character varying(255),
    street character varying(255),
    fax character varying(255),
    "zipCode" character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 1588867)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 7323 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4744 (class 2604 OID 1588883)
-- Name: contactUs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."contactUs" ALTER COLUMN id SET DEFAULT nextval('public."contactUs_id_seq"'::regclass);


--
-- TOC entry 4745 (class 2604 OID 1588892)
-- Name: factories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories ALTER COLUMN id SET DEFAULT nextval('public.factories_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 1588968)
-- Name: ordersProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts" ALTER COLUMN id SET DEFAULT nextval('public."ordersProducts_id_seq"'::regclass);


--
-- TOC entry 4747 (class 2604 OID 1588914)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 1588939)
-- Name: purchasingOrders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders" ALTER COLUMN id SET DEFAULT nextval('public."purchasingOrders_id_seq"'::regclass);


--
-- TOC entry 4746 (class 2604 OID 1588903)
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 2412767)
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 1588871)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 7296 (class 0 OID 1588880)
-- Dependencies: 218
-- Data for Name: contactUs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 7298 (class 0 OID 1588889)
-- Dependencies: 220
-- Data for Name: factories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factories VALUES (3, 'PRiM,S.A', NULL, NULL, 'uploads/factories/coverImage-1719245364305-igCSQ_9LLJCH-iGVOL5Esprim-2.png', NULL, NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (4, 'DJO Global', NULL, NULL, 'uploads/factories/coverImage-1719243439790-6ch2KzG6rcj1OjWDVwtLKDJO.png', NULL, NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (5, 'PROCOSIL hightech prosthesis', NULL, NULL, 'uploads/factories/coverImage-1719245430969-aVEsI7wo7aiuN272qwY80PROCOSIL.png', NULL, NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (6, 'Streifeneder', NULL, NULL, 'uploads/factories/coverImage-1719245470059-6TJ0lGqwX4JrJGR3bXqdrSIREFENDER.png', NULL, NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (7, 'Trulife', NULL, NULL, 'uploads/factories/coverImage-1719245514320-aAoz3grlcNL1aSyjUIAuOtrulife.png', NULL, NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (1, 'Move', NULL, '{''edede''}', 'uploads/factories/coverImage-1719245290951-iHpScTtVGtPKYsS5Wf8Ywmove.png', '{uploads/factories/images-1719245859598-OIOfe3I1053ofwsHh1rSKmove.jpeg}', NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (8, 'Orthomedics', NULL, NULL, 'uploads/factories/coverImage-1719246266364-Q7RccW2CCO0cqWAT8HMVMlogo.png', '{uploads/factories/images-1719246266369-IeRnJ86pGI4SW1p_51ogoorthomedics-header.jpeg}', NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');
INSERT INTO public.factories VALUES (2, 'Orthobock', NULL, NULL, 'uploads/factories/coverImage-1719245319865-oDRda5h2U57P9zpoBmsABothobock.png
', '{uploads/factories/images-1719246394020-ZRl_cJAKnls1ffnOwARuOottobock-header.png}', NULL, NULL, NULL, NULL, '2024-06-26 02:59:26.879+03', '2024-06-26 02:59:26.879+03');


--
-- TOC entry 7307 (class 0 OID 1588965)
-- Dependencies: 229
-- Data for Name: ordersProducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ordersProducts" VALUES (1, '2024-07-01 09:01:28.804+03', '2024-07-01 09:01:28.804+03', 3, 1, 13);


--
-- TOC entry 7302 (class 0 OID 1588911)
-- Dependencies: 224
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (57, 'Pediatric Shoes (P - 10)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 10).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (60, 'Pediatric Shoes (P - 70)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 70)..jpg"}', NULL, true, '19 to 41', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (62, 'Pediatric Shoes (P - 40)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 40).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- High rigid neck for ankle support.","2- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","3- Straight last sole to keep the foot in normal position for more support & control.","4- Lacing to allow secure fixation.","5- Available in a different cheerful colors & stylish design for more comfort & confidence."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (63, 'Pediatric Shoes (P - 50)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 50).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (64, 'Pediatric Shoes (P - 60)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 60).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (66, 'Talipes Sandal', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Talipes Sandal.jpg"}', NULL, true, '18 to 35', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"For babies with club foot to be used while start walking. Best quality material to guarantee maximum correction and comfort."}', '{"Talipes equinovarus"}', 'Move');
INSERT INTO public.products VALUES (127, 'Memory Foam Cervical Pillow', '1', NULL, '{"../../../../uploads/products/5-Lifestyle/Memory Foam Cervical Pillow.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{" Made of memory foam covered with soft velour."}', '{"Conforms to the natural curvature of the body head and neck."," Supports the head & neck to ensure superior comfort."," Reduces neck & back pain."," Alleviates shoulder stiffness."," Enhances proper spine alignment & muscle relaxation."}', 'Move');
INSERT INTO public.products VALUES (90, 'Long CAM Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Long CAM Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Lightweight, ergonomic design."," Wide footbed for increased stability & accommodation of edema or bandages"," Anterior/Posterior & Medial/Lateral shells for better fixation & support."," Cushioned sole designed to absorb shock upon heel strike."," Padded with foam for extra comfort."," Contact closure straps for ease of application & removal."," Rocker sole to promote natural gait & reduce plantar pressures."}', '{"Acute ankle sprains "," Fractures of the foot (Mid or forefoot)"," Achilles tendon ruptures. "," Post - operative. "," Soft tissue injuries."," Distal fibula fractures. "," Trauma "," Rehabilitation"}', 'Move');
INSERT INTO public.products VALUES (106, 'Diabetic Shoes (D-110)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-110).jpg"}', 0, true, '40 to 45', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (38, 'Above Knee Sock with Silicone Band ', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Above Knee Sock with Silicone Band.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 6, '{"Attractive silicone top band","Very soft & smooth touch","Easy put on & take off","High wearing comfort"}', '{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}', 'Move');
INSERT INTO public.products VALUES (18, 'Abdominal Belt', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Abdominal Belt.jpg"}', NULL, true, 'S to 6XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material."," Extra Velcro closure."," The straps are of Grade 2+ straps guarantee high quality and durability."}', '{" Moderate low back pain."," Weak abdominal muscle."," Abdominal muscles sprains & strains."}', 'Move');
INSERT INTO public.products VALUES (20, 'Thoracolumbar Support Normal', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Thoracolumbar Support Normal.jpg"}', NULL, true, 'S to 4XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material. "," Extra X-shaped wide straps for additional support. "," Contact closures for additional support. "," Grade 2+ straps reflecting high quality & durability."}', '{" Lumbar & lower thoracic spine strains & sprains "," Mild osteoporosis "," Posture control Available Size I"}', 'Move');
INSERT INTO public.products VALUES (22, 'Lumbosacral Support Normal', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Lumbosacral Support Normal.jpg"}', NULL, true, 'S to 6XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material lined with cotton."," 4 posterior metallic stays to support the lumbosacral zone."," Extra Velcro closure."," Grade 2+ straps guarantee high quality and durability."}', '{" Moderate low back pain."," Weak abdominal muscles."," Abdominal muscles sprains & strains."}', 'Move');
INSERT INTO public.products VALUES (21, 'Lumbosacral Support GX', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Lumbosacral Support GX.jpg"}', NULL, true, 'S to 5XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material lined with cotton."," Extra X-shaped wide straps for additional support."," 4 posterior metallic stays to support the lumbosacral zone."," 2 metallic stays -1 lateral & 1 medial for extra support."," 2 anterior anti-roll metallic stays."," Grade 2+ straps guarantee high quality and durability."}', '{" Moderate low back pain."," Lumbar muscle weakness."," Lumbar sprains & strains."}', 'Move');
INSERT INTO public.products VALUES (39, 'Below Knee Sock', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Below Knee Sock.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 6, '{"Very soft & smooth touch","Easy put on & take off"," High wearing comfort"}', '{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}', 'Move');
INSERT INTO public.products VALUES (40, 'Elastic Knee Support', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Elastic Knee Support.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 6, '{"Wraparound breathable support","Leads to thermo-compression & knee protection","Smart design which allows perfect customized adaptation to the patient."}', '{"Knee sprains & strains","Knee injuries"}', 'Move');
INSERT INTO public.products VALUES (41, 'Elastic Ankle Support', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Elastic Ankle Support.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 6, '{"Wraparound breathable support","Leads to thermo-compression & ankle stabilization.","Smart design which allows perfect customized adaptation to the patient.","Wearable in shoes & during simple activities"}', '{"Ankle sprains & strains","Soft tissue injuries"}', 'Move');
INSERT INTO public.products VALUES (23, 'Lumbosacral Brace', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Lumbosacral Brace.jpg"}', NULL, true, 'S to XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Lightweight, breathable & durable frame that covers the lumbar & sacral parts of the vertebral column."," Posterior plastic component lined with foam for optimal comfort."," Easy to wear with adjustable straps for additional compression."," The brace helps maintaining the spine in neutral alignment while permitting ease of movement."}', '{" Spondylolisthesis. "," Spondylosis. "," Osteoporosis."," Degenerative intervertebral disc. "," Chronic muscle weakness."," Vertebral compression fractures."}', 'Move');
INSERT INTO public.products VALUES (5, 'Thumb Support', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Thumb Support.jpg"}', NULL, true, 'S to XXXL - RT & LT', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Soft, breathable elastic material."," Removable stay supporting the thumb."," Adjustable Velcro closure straps."}', '{" Tendonitis."," Thumb strains or sprains."," Gamekeeper thumb."," Post-cast removal."}', 'Move');
INSERT INTO public.products VALUES (43, 'Pediatric Ar Sling', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Ar Sling.jpg"}', NULL, true, 'S to XL', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 8, '{"Seamless, lightweight durable materials."," Adjustable shoulder strap for ease of application & removal."}', '{" For cast support & post-cast."," Injuries to the arm, wrist or hand for children."," Immobilization of the arm following injury."}', 'Move');
INSERT INTO public.products VALUES (37, 'Above Knee Sock', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Above Knee Sock.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 6, '{"Very soft & smooth touch.","Easy put on & take off.","High wearing comfort."}', '{Lymphoedema,"Chronic Venous Insufficiency","Varicose Veins"}', 'Move');
INSERT INTO public.products VALUES (131, 'Ring Cushion', '1', NULL, '{"../../../../uploads/products/5-Lifestyle/Ring Cushion 0.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{"Made of memory foam covered with durable mesh fabric."}', '{" Distributes the weight evenly.","Maintains the correct posture.","Relieves: - Post-natal discomfort. - Post-operative pain. - Pain associated with hemorrhoids. - Pain associated with pregnancy.- Bruised / fractured coccyx. - Hip bursitis.  - Pain associated with prostate inflammation."}', 'Move');
INSERT INTO public.products VALUES (93, 'Rocking Long Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Rocking Long Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"Rigid, non-slip rocker sole."," Anti-bending shoe neck made of micro-perforated fabric for proper aeration (avoid sweating)."," 4 Velcro straps for easy fitting."," Washable footwear to keep good shape."}', '{"Diabetic foot ulcers."," Tarsal & Ankle fractures."," Chronic phase management of Charcot foot."," Post-rehabilitation. "," Post-operative."}', 'Move');
INSERT INTO public.products VALUES (100, 'Diabetic Shoes (Regular)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (Regular).jpg"}', 0, true, '30 to 50', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of high quality material for maximum comfort and fast healing."}', '{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus."," Hammer Toes."," Post-operative rehabilitation."}', 'Move');
INSERT INTO public.products VALUES (80, 'Knee Support Padded', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Knee Support Padded.jpg"}', 0, true, 'S to 4XL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Made of latex-free, high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures."," Open patella."}', '{"Moderate knee sprains or strains."," Knee injuries."," Arthritis."}', 'Move');
INSERT INTO public.products VALUES (83, 'Knee Ranger', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Knee Ranger.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures."," Provides immobilization & protected range of movement from 0 to 120 flexion & 0 to 70 extension."," Dual axis hinges."}', '{"Immobilization & protected range of movement associated with ACl, PCl, lCl & MCl surgeries."," Collateral ligament strain & sprain."}', 'Move');
INSERT INTO public.products VALUES (6, 'Wrist Support', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Wrist Support.jpg"}', NULL, true, 'S to XXXL - RT & LT', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Soft, breathable elastic material."," Removable wrist stay supporting the palmar surface of wrist & keeping it in a neutral position."," Adjustable Velcro closure straps."}', '{" Carpal tunnel syndrome."," Tendonitis."," Wrist strains or sprains."}', 'Move');
INSERT INTO public.products VALUES (53, 'Ground Reaction AFO', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Ground Reaction AFO.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"High quality polypropylene material"}', '{"Used specifically to apply forces to assist in knee extension (straightening) in walking & stabilising the ankle/foot complex."}', 'Move');
INSERT INTO public.products VALUES (84, 'Hinged Knee Brace', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Hinged Knee Brace.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Front opening, lightweight design."," Dual axis hinges allowing for range of movement from 0 to 120 flexion & 0 to 70 extension."," Adjustable 6 straps for ease of application & removal."}', '{" ACl, PCl, MCl & lCl injuries. "," Tibial plateau fractures."," Osteochondral repairs. "," Meniscal repairs."," Patella tendon repairs. "," Acute knee sprains / strains."," High tibial osteotomy."}', 'Move');
INSERT INTO public.products VALUES (85, 'Ankle Brace', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Ankle Brace.jpg"}', 0, true, 'S to XXXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Contoured design, made of high quality neoprene which guarantees warmth and compression."," Figure - 8-shaped lock calcaneus bone in addition to medial & lateral metal stays providing ideal inversion / eversion control and support the ankle joint."," Fits comfortably into athletic or street shoes."}', '{"Ankle sprains & strains. "," Soft tissue injuries."," Ankle joint immobilization."}', 'Move');
INSERT INTO public.products VALUES (86, 'Ankle Gel Support', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Ankle Gel Support.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Rigid thermoplastic shells with adjustable heel strap to prevent inversion / eversion."," Gel bladder used for cold therapy to treat tender or swollen ankles."," Contact closure straps for ease of application & removal."," Fits right & left ankles"}', '{" Ankle sprain and strains."," Prophylactic use in chronic ankle instability."}', 'Move');
INSERT INTO public.products VALUES (88, 'Long Air Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Long Air Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Molded plastic exterior with foam lining & circumferential strapping."," Inflatable air chambers to accommodate changes in edema & maximize patient compliance."," Cushioned inner sole."," Non-slip rocker sole for easy motion, increased stability & comfort"}', '{" Acute ankle sprains. "," Post-operative use. "," Achilles tendon ruptures."," A better alternative of casting in case of stable fractures of lower leg, foot and ankle."}', 'Move');
INSERT INTO public.products VALUES (92, 'Rocking Short Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Rocking Short Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"Rigid, non-slip rocker sole."," Anti-bending shoe neck made of micro-perforated fabric for proper aeration (avoid sweating)."," 3 Velcro straps for easy fitting."," Washable footwear to keep good shape."}', '{"Diabetic foot ulcers."," Neuro-ischemic ulcer."," Management of injured foot. "," Metatarsal fractures."," Post-rehabilitation. "," Post-operative."}', 'Move');
INSERT INTO public.products VALUES (16, 'Posture Corrector Brace', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Posture Corrector Brace.jpg"}', NULL, true, 'S to XXXL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Durable brace that covers the entire spine."," Made of durable, breathable materials with adjustable Velcro straps for proper fitting."," Contains 2 metal splints on the back side for firm support & pressure reduction."," X-shape waist strap for extra support."}', '{" Postural disorders."," Back pain."}', 'Move');
INSERT INTO public.products VALUES (79, 'Patella Strap', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Patella Strap 0 .jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Made of latex-free, high quality neoprene which guarantees warmth and compression."," Contact closures that secure uniform compression & customized fit."}', '{"Relieves anterior knee pain caused by:- Patellar tendonitis. - Chondromalacia. - Osgood Schlatter disease."}', 'Move');
INSERT INTO public.products VALUES (82, 'Knee Immobilizer', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Knee Immobilizer.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Made of soft breathable foam material."," Adjustable straps for ease of application & removal."," Medial & lateral stays in addition to rigid posterior stay that provide stability and secure knee immobilization."," Guarantees zero flexion of the knee."}', '{"Post-operative knee immobilization."," Knee injuries where full extension of the leg is desired."}', 'Move');
INSERT INTO public.products VALUES (52, 'Supra Malleolar Orthosis', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Supra Malleolar Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"High quality polypropylene material"}', '{"Foot deformity"}', 'Move');
INSERT INTO public.products VALUES (55, 'Standing Frame', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Standing Frame.jpg"}', NULL, true, '75 - 80 - 90 - 100 - 110 - 115 - 120-130 -135 -140 -150 cm', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"To provide external support for children with inadequate postural control of the neck, head, and trunk in standing position"}', '{" Cerebral Palsy"}', 'Move');
INSERT INTO public.products VALUES (56, 'Ankle Foot Orthosis', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Ankle Foot Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{" Helps dorsiflexion while providing minor medial and lateral support for ankles."," To give more support to the forefoot, the foot plate is larger than normal."," The lightweight orthosis is rigid to resist mild extensor spasticity"}', '{" Foot drop"}', 'Move');
INSERT INTO public.products VALUES (12, 'Soft Cervical Collar', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Soft Cervical Collar.jpg"}', NULL, true, 'S to XXL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Made of medium density foam."," Contoured design with soft cotton stockinette cover for enhanced comfort."," Velcro straps allowing easy fit & removal."}', '{" Neck traumas."," Post-operative."," Cervical sprains & strains."," Degenerative disc disease."}', 'Move');
INSERT INTO public.products VALUES (14, 'Clavicle Support', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Clavicle Support.jpg"}', NULL, true, 'S to XXXL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Foam padded shoulder straps covered with stockinette."," 3-way adjustment buckles closure."}', '{" Postural problems."," Clavicular fractures."," Sternoclavicular dislocations."}', 'Move');
INSERT INTO public.products VALUES (15, 'Posture Corrector', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Posture Corrector.jpg"}', NULL, true, 'S to XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Made of high quality neoprene that provides warmth & compression."," Adjustable Velcro straps."}', '{" Postural disorders."," Back pain."}', 'Move');
INSERT INTO public.products VALUES (126, 'Cervical Pad', NULL, NULL, '{"../../../../uploads/products/5-Lifestyle/Cervical Pad.jpg"}', NULL, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{" Made of memory foam covered with soft velour."}', '{"Relieves the pressure on the cervical area.","The best choice for those who suffer from cervical spondylosis.","Prevents headache & neck pain.","Used while travelling or driving for long distance."}', 'Move');
INSERT INTO public.products VALUES (128, 'Cold Cure Cervical Pillow', '1', NULL, '{"../../../../uploads/products/5-Lifestyle/Cold Cure Cervical Pillow.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{"Made of cold cure foam with cotton cover."}', '{"Improves sleep.","Alleviates headache & other problems resulted from inadequate sleep."}', 'Move');
INSERT INTO public.products VALUES (130, 'Lumbar Pad', '1', NULL, '{"../../../../uploads/products/5-Lifestyle/Lumbar Pad 1.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{"Made of cold cure covered with black mesh fabric.","Dual adjustable straps."}', '{"Provides ultimate comfort by improving the posture.","Supports the low back area.","Relieves low back pain.","Recommended for car, home & office usage."}', 'Move');
INSERT INTO public.products VALUES (81, 'Hinged Knee Support', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Hinged Knee Support.jpg"}', 0, true, 'S to 4XL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable Velcro closures. "," Open patella."," Dual axis polycentric hinges (medial & lateral)."," Wraparound design."}', '{"Medial/lateral knee instability. "," Hyperextended knee."," Ligament weakness or injury. "," Tendonitis."," Arthritis. "," Degenerative joint disease."}', 'Move');
INSERT INTO public.products VALUES (87, 'Short Air Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Short Air Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Molded plastic exterior with foam lining & circumferential strapping."," Inflatable air chambers to accommodate changes in edema & maximize patient compliance."," Cushioned inner sole."," Non-slip, rocker sole for easy motion, increased stability & comfort."}', '{"Acute ankle sprains. "," Post-operative. "," Achilles tendon ruptures."," A better alternative of casting in case of stable fractures of lower leg, foot and ankle."}', 'Move');
INSERT INTO public.products VALUES (89, 'Short CAM Walker', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Short CAM Walker.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{" Wide footbed for increased stability & accommodation of edema or bandages."," Anterior/Posterior & Medial/Lateral shells for better fixation & support."," Cushioned sole designed to absorb shock upon heel strike."," Padded with foam for extra comfort."," Contact closure straps for ease of application & removal."," Rocker sole to promote natural gait & reduce plantar pressures."}', '{" Acute ankle sprains. "," Post - operative use."," Fractures of the lower leg, foot & ankle."}', 'Move');
INSERT INTO public.products VALUES (108, 'Diabetic Shoes (D-120)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-120).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (74, 'Hip Knee Ankle Foot Orthosis', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Hip Knee Ankle Foot Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{" High quality polypropylene material."," It improves body alignment and posture."," It increases bone and muscle strength."}', '{" Cerebral Palsy."," Paraplagia"," Hip, knee & ankle muscle weakness & instability."}', 'Move');
INSERT INTO public.products VALUES (70, 'Boston Brace Orthosis', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Boston Brace Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"The Boston Brace is a plastic body jacket used in The treatment of adolescents with idiopathic scoliosis.","The Boston Brace, also referred to as a Thoraco-Lumbo-Sacral Orthosis (TLSO) Brace, wraps under The arms and around The rib cage, lower back and hips in order to cast The spine into a straighter position."}', '{" Idiopathic Scoliosis"}', 'Move');
INSERT INTO public.products VALUES (71, 'Short Genu Recurvatum Brace', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Short Genu Recurvatum Brace.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"Lightweight,"," Adjustable, posterior pressure pad,"," Improves joint function"," Improves ambulation"," Permits knee flexion, restricts extension"}', '{" Knee hyperextension, genu recurvatum"}', 'Move');
INSERT INTO public.products VALUES (9, 'Mallet Finger Splint', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Mallet Finger Splint.jpg"}', NULL, true, 'Short & Long', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Immobilization and protection of injured fingers for faster healing."," Keeps interphalangeal joints in the right position."}', '{" Mallet fingers"," Osteoarthritis"," Finger stiffness"," Finger sprain"," Finger fracture"}', 'Move');
INSERT INTO public.products VALUES (45, 'Dennis Brown Splint', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Dennis Brown Splint.jpg"}', NULL, true, 'Bar: 6 - 12 inches , Sandal: 14 to 24', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 8, '{"Made of highly durable components."," The splint is equipped with wing nuts to allow individual abduction of each foot."," Ankle strap to ensure that the heel fits inside the shoes."," Sandal is made of high quality leather."}', '{"Congenital Talipes Equinovarus."," Tibia vara."}', 'Move');
INSERT INTO public.products VALUES (48, 'Flat Foot Shoes', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Flat Foot Shoes.jpg"}', NULL, true, '14 to 34', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"Specially designed handmade shoes for flat foot."," Produced with premium quality soft leather."," Secured arch support."," High neck to secure stability."," Straight outside heel."}', '{"Correction of flat foot & genu-valgus."," Improves foot balance & minimizes pronation."}', 'Move');
INSERT INTO public.products VALUES (54, 'Corner Chair', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Corner Chair.jpg"}', NULL, true, '35 - 40 - 45 -50 & 60 cm', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"To provide external support for children with inadequate control of the neck, head & trunk who are inclined to fall sideways or back if they overstretch."}', '{"Cerebral Palsy"}', 'Move');
INSERT INTO public.products VALUES (13, 'Philadelphia Collar', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Philadelphia Collar.jpg"}', NULL, true, 'S to XL (2.25; 3.25; 4.25; 525)', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" Ready-made molded latex-free foam."," Anterior & posterior rigid plastic reinforcements that limit the neck movement."," Frontal trachea opening to alleviate heat & moisture."," The collar maintains the head in neutral position & supports occipital & mandibular areas."}', '{" Degenerative disc diseases."," Immobilization after trauma or surgery."," Spinal stenosis. "," Spondylolisthesis."}', 'Move');
INSERT INTO public.products VALUES (129, 'Cold Cure Cervical Pillow', '1', NULL, '{"../../../../uploads/products/5-Lifestyle/Cold Cure Cervical Pillow.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 2, '{" Made of cold cure foam with cotton cover."}', '{"Improves sleep.","Alleviates headache & other problems resulted from inadequate sleep."}', 'Move');
INSERT INTO public.products VALUES (91, 'Cast Boot', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Cast Boot.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 5, '{"Ribbed, non-skid sole."," Upper contact closure straps for ease of application & removal."," Open toes & heel for comfort & breathability."}', '{" Lower leg casted fractures."}', 'Move');
INSERT INTO public.products VALUES (49, 'Hip Abduction Splint', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Hip Abduction Splint.jpg"}', NULL, true, 'XS to XL', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"High quality polypropylene material."}', '{"Developmental Dysplasia of the hip."}', 'Move');
INSERT INTO public.products VALUES (97, 'Rocking Diabetic Sandal', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Rocking Diabetic Sandal .jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Rigid, non-slip rocker sole."," Breathable, washable & micro-perforated fabric with 2 Velcro straps."}', '{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus surgery."," Hammer toe surgery."," Morton Neuroma surgery."," Toe fractures."}', 'Move');
INSERT INTO public.products VALUES (98, 'Diabetic Shoes "Leather" "Gold', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes Leather Gold.jpg"}', 0, true, '38 to 49', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of leather and mesh for maximum comfort and areation."}', '{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer Toes"," Post-operative rehabilitation."}', 'Move');
INSERT INTO public.products VALUES (99, 'Diabetic Shoes with Side Velcro', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes with Side Velcro.jpg"}', 0, true, '38 to 46', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Wide, non-slip shock absorber sole."," Well cushioned with Velcro closure strap for easy fitting & foot deformities accommodation."," Made of high quality material for maximum comfort and fast healing."}', '{" Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer Toes"," Post-operative rehabilitation."}', 'Move');
INSERT INTO public.products VALUES (102, 'Diabetic Slipper', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Slipper.jpg"}', 0, true, '37 to 46', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Wide , non-slip shock absorber sole."," Well cushioned with velcro closure straps for easy fitting & foot deformities."," Open design for areation."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (95, 'Offloading Shoes (Metatarsal)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Offloading Shoes (Metatarsal).jpg"}', 0, true, 'XS to XL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"Square toe design."," Ankle strap that holds foot firmly in shoe."," Removable forefoot closure straps."," Non-slip, rigid rocker sole."}', '{" Relieve pressure on ulcerated areas of the forefoot during the treatment of diabetic foot ulcers to allow healing."}', 'Move');
INSERT INTO public.products VALUES (101, 'Diabetic Sandal', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Sandal.jpg"}', 0, true, '30 to 50', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Made of high quality material for maximum comfort and fast healing."," Open design padded with foam & wide shock absorber sole."," Extra depth footwear with wide Velcro closure strap."}', '{" Accommodates foot deformities."," Diabetic foot as it distributes plantar surface pressure & reduces pain."," Hallux valgus"," Hammer toes."," Metatarsalgia"}', 'Move');
INSERT INTO public.products VALUES (103, 'Diabetic Insole', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Insole.jpg"}', 0, true, '38 to 46', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Specific custom made insole made by foot print system to redistribute pressure anf off load pressure from the ulcer site"}', '{"Diabetic Ulcers"}', 'Move');
INSERT INTO public.products VALUES (104, 'Diabetic Sports Shoes (D-200)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Sports Shoes (D-200).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (73, 'Knee Ankle Foot Orthosis', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Knee Ankle Foot Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"High quality polypropylene material","It improves leg alignment and posture in normal position, increases bone and muscle strength."}', '{" Knee Instability.","Hip, knee & ankle muscle weakness.","Knee contracture","Knee hyperextension"," Foot and ankle control"}', 'Move');
INSERT INTO public.products VALUES (46, 'Bebax', NULL, NULL, '{../../../../uploads/products/4-PediatricProducts/Bebax.jpg}', NULL, true, '7.5,8,8.5,10,10.5,11.5,12,12.5,13.5', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{" For the first time - made in Egypt by Orthomedics."," Lightweight alternative to casting or splints, hence eliminates skin problems commonly associated with casting."," Has multi-directional hinge that is quickly & easily adjusted to adjust the forefoot in the desired position."," Provides serial casting & contact moulding to forefoot & heel without plaster."}', '{"Congenital forefoot deformities e.g. Metatarsus Varus & Pes Valgus"," Prevents retraction due to muscular or neurological disorders."}', 'Move');
INSERT INTO public.products VALUES (17, 'Rib Belt', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Rib Belt.jpg"}', NULL, true, 'S to XXXL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material."," Extra Velcro closure."}', '{" Fractured or bruised rib."," Intercostal muscle strains."}', 'Move');
INSERT INTO public.products VALUES (94, 'Offloading Shoes (Heel Off)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Offloading Shoes (Heel Off).jpg"}', 0, true, 'XS to XL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"Square toe design."," Ankle strap that holds foot firmly in shoe to reduce heel slippage & eliminate friction."," Removable forefoot closure straps."," Non-slip, rigid rocker sole."}', '{"Relieve pressure on ulcerated areas of the heel during the treatment of diabetic foot ulcers to allow healing."}', 'Move');
INSERT INTO public.products VALUES (69, 'Fracture Elbow Orthosis', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Fracture Elbow Orthosis.jpg"}', NULL, true, 'One Size', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"Protect your forearm, elbow and upper arm after injury or surgery.","This splint provides comfort and secures immobilization of your elbow at 90-degree angle.","For progressive rehabilitation after ligament injuries and tears"}', '{"Broken elbow.","Distal humerus fracture.","Proximal ulnar fracture After Elbow surgery."," Elbow hyperextension."}', 'Move');
INSERT INTO public.products VALUES (110, 'Diabetic Shoes (D-80)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-80).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (112, 'Diabetic Shoes (D-50)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-50).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners.","4- Wide toe-box and stretchable upper part To alleviate foot and toe pressures"}', '{Bunion}', 'Move');
INSERT INTO public.products VALUES (114, 'Orthotic High - Neck Shoes (H-10)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (H-10).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (115, 'Orthotic High - Neck Shoes (H-20)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (H-20).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (116, 'Diabetic Shoes (D-70)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-70).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (118, 'Diabetic Shoes (D-30)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-30).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (119, 'Orthotic High - Neck Shoes (O -20)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (O -20).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (120, 'Orthopedic High - Neck Shoes (H-70)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-70).jpg"}', 0, true, '33 to 38', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (121, 'Diabetic Sports Shoes (D-100)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Sports Shoes (D-100).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (51, 'Sitting, Walking, Standing Hip Abduction', NULL, NULL, '{../../../../uploads/products/4-PediatricProducts/Sitting,Walking,"Standing Hip Abduction.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"High quality polypropylene material"}', '{"Developmental Dysplasia of the hip."}', 'Move');
INSERT INTO public.products VALUES (107, 'Diabetic Shoes (D-10)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-10).jpg"}', 0, true, '40 to 45', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (109, 'Diabetic Shoes (D-20)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-20).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (111, 'Diabetic Shoes (D-90)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-90).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability."}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (113, 'Diabetic Shoes (D-60)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Diabetic Shoes (D-60).jpg"}', 0, true, '36 to 41', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Comfortable velcro fasteners"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (117, 'Orthopedic High - Neck Shoes (H-30)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-30).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (11, 'Hard Cervical Collar', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Hard Cervical Collar.jpg"}', NULL, true, 'S to XL', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 7, '{" Made of rigid plastic."," The collar height & length can be easily adjusted by Velcro straps."," Well ventilated for enhanced comfort."}', '{" Cervical spine immobilization."," Post-operative discectomy & cervical vertebrae fusion."," Neck injuries."," Degenerative diseases of cervical vertebrae."}', 'Move');
INSERT INTO public.products VALUES (123, 'Orthopedic High - Neck Shoes (H-50)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-50).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (125, 'Heel Lift', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Heel lift.JPG"}', 0, true, 'One Size', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{" Pressure offloading device"," Padded internally by velvet cotton material"," Externally made of Iycra fabric padded with sponge."," 3 Velcro straps for easy fit"}', '{"Management of heel pressure ulcers"}', 'Move');
INSERT INTO public.products VALUES (24, 'Arch Flat Foot Insoles - Adult', NULL, NULL, '{"../../../../uploads/products/6-silicone/Arch Flat Foot Insoles - Pediatrics.jpg"}', 0, true, 'S to XL', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials.","Provide comfortable arch support.","Lifting for both high arch & flat foot.","Reduce pressure & stabilize the arch."}', '{"Flat Foot"}', 'Move');
INSERT INTO public.products VALUES (78, 'Total Body Support Orthosis', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Total Body Support Orthosis.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 4, '{"High quality polypropylene material."," It improves body alignment and posture."," It increases bone and muscle strength."}', '{" Whole body instability & muscle weakness."}', 'Move');
INSERT INTO public.products VALUES (68, 'Humeral Fracture Brace', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Humeral Fracture Brace.jpg"}', NULL, true, 'S to XXL', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"Two-part medial/lateral construction increases circumferential compression.","Plastic deltoid extension adds protection and helps prevent distal migration."}', '{"Management of mid-shaft and distal third humeral fractures."}', 'Move');
INSERT INTO public.products VALUES (2, 'Elbow Orthosis', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Elbow Orthosis.jpg"}', NULL, true, 'One Size', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Lightweight design provides static adjustable stretch of the elbow in flexion & extension."," Calibrated control knob easy to read & assists in monitoring therapy progress."," Manufactured from rigid polyethylene laminated shells lined with foam."," Velcro straps closure system."}', '{" Fracture dislocation elbow. "," Biceps / triceps tendon rupture."," Elbow arthroplasty."," Ligament repair."}', 'Move');
INSERT INTO public.products VALUES (7, 'Wrist & Thumb Support', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Wrist Support-2.png"}', NULL, true, 'S to XXL - RT & LT', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Soft, breathable elastic material."," Dual removable stays supporting the palmar surface of wrist & the thumb."," Adjustable Velcro closure straps."}', '{" De Quervain''s Syndrome."," Tendonitis."," Thumb strains or sprains."," Post-cast removal."}', 'Move');
INSERT INTO public.products VALUES (8, 'Tennis Elbow', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Tennis Elbow.jpg"}', NULL, true, 'XS to XXL', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{"High grade neoprene"}', '{" Lateral epicondylitis (Tennis elbow)."," Medial epicondylitis (Golfer''s elbow)."," Bursitis."," Elbow strain, sprain."," Tendonitis."}', 'Move');
INSERT INTO public.products VALUES (50, 'Above Knee Splint', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Above Knee Splint.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"High quality polypropylene material"}', '{"Cerebral Palsy","Muscle weakness"}', 'Move');
INSERT INTO public.products VALUES (25, 'Arch Flat Foot Insoles - Pediatrics', '1', NULL, '{"../../../../uploads/products/6-silicone/Arch Flat Foot Insoles - Adult.jpg"}', 0, true, 'XS to XL', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials.","Provide comfortable arch support.","Lifting for both high arch & flat foot.","Reduce pressure & stabilize the arch."}', '{"Flat Foot"}', 'Move');
INSERT INTO public.products VALUES (132, 'Pediatric Shoes (P - 20)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 20).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (44, 'Pavlik Harness', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pavlik Harness.jpg"}', NULL, true, 'XS to L', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 8, '{" Soft padded straps."," Strong cotton webbing with comfort padding."," Hook & loop fastening straps."," Soft cotton bootees."}', '{"Correct the developmental dysplasia of the hip from birth to 6 months of age."}', 'Move');
INSERT INTO public.products VALUES (124, 'Orthopedic High - Neck Shoes (H-60)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-60).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (67, 'Tibial Fracture Brace', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Tibial Fracture Brace.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.341+03', '2024-06-26 14:36:42.341+03', 1, 4, '{" Foam lined polypropylene brace, that provides intimate contact needed for effective support of tibial fractures and aids in healing and alignment of an injured bone."}', '{"Fracture of Tibia"}', 'Move');
INSERT INTO public.products VALUES (77, 'Taylor Spinal Brace', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Taylor Spinal Brace.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 4, '{" Durable, light weight rigid splints that provide effective immobilization & cover the dorsal, thoracic, lumbar & sacral parts."," Adjustable shoulder straps that correct the shoulder posture.,"," Maintains the spine in neutral position and allows accurate posture correction."}', '{" Thoraco-Iumbar injuries & intervertebral disc problems."," Supports weak dorsolumbar spine, post-operative rehabilitation, and osteoporosis."," Supports thoracic vertebrae fracture."," Any indication requiring dorso-Iumbar immobilizations"}', 'Move');
INSERT INTO public.products VALUES (61, 'Pediatric Shoes (P - 80)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 80).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather to support foot & ankle.","2- Open design to make the product more comfortable to wear.","3- Open design to reduce moisture & sweating.","4- Convenient buckle system to secure fixation.","5- High rigid neck for ankle support.","6- Non - slippery outsole that secures safety & durability.","7 - Available in different cheerful colors for kids."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (65, 'Pediatric Shoes (P - 90)', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Pediatric Shoes (P - 90).jpg"}', NULL, true, '23 to 32', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"1- Manufactured from high quality leather.","2- High rigid neck for ankle support.","3- Rubber, non - slippery outsole for safety & durability, to absorb shocks and reduce pain during playing & daily activities.","4- Straight last sole to keep the foot in normal position for more support & control.","5- Lacing to allow secure fixation.","6- Available in a different cheerful colors & stylish design for more comfort & confidence."}', '{"Pediatric Foot Deformity"}', 'Move');
INSERT INTO public.products VALUES (42, 'Elastic Wrist Support', NULL, NULL, '{"../../../../uploads/products/7-Elastic/Elastic Wrist Support.jpg"}', NULL, true, 'M to 3XL', '2024-06-26 14:36:42.348+03', '2024-06-26 14:36:42.348+03', 1, 6, '{"Wraparound breathable support","Leads to thermo-compression & ankle stabilization.","Smart design which allows perfect customized adaptation to the patient.","Wearable in shoes & during simple activities."}', '{"Ankle sprains & strains","Soft tissue injuries"}', 'Move');
INSERT INTO public.products VALUES (105, 'Orthotic High - Neck Shoes (O-10)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthotic High - Neck Shoes (O-10).jpg"}', 0, true, '36 to 42', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{"1- Manufactured from high quality leather."," 2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (122, 'Orthopedic High - Neck Shoes (H-40)', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Orthopedic High - Neck Shoes (H-40).jpg"}', 0, true, '39 to 45', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 5, '{"1- Manufactured from high quality leather.","2- Non - slippery outsole for safety & durability.","3- Adjustable in the heel & collar"}', '{"Diabetic Foot"}', 'Move');
INSERT INTO public.products VALUES (26, 'Full Length Silicone Insoles', '1', NULL, '{"../../../../uploads/products/6-silicone/Full Length Silicone Insoles.jpg"}', 0, true, 'S to XL', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials","Made of silicone with two different densities.","Provide relief & comfort by preventing pressure in the heel & metatarsal areas."}', '{"Plantar Fasciitis",Metatarsalgia,"Flat Foot",Talalgia}', 'Move');
INSERT INTO public.products VALUES (27, 'Heel Cup', '1', NULL, '{"../../../../uploads/products/6-silicone/Heel Cup.jpg"}', 0, true, 'S to L', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials","Made of silicone with two different densities.","Provide relief & comfort by preventing pressure in the heel & metatarsal areas."}', '{"Calcanean Spur"}', 'Move');
INSERT INTO public.products VALUES (28, 'Toe Separator', '1', NULL, '{"../../../../uploads/products/6-silicone/Toe Separator.jpg"}', 0, true, 'S to L', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials.","Straightens & aligns the big toe.","Prevents toe overlapping.","Relieves bunion pain."}', '{"Hallux Valgus.","Overlapping Toes."}', 'Move');
INSERT INTO public.products VALUES (29, 'metatarsal Cushion Insoles', '1', NULL, '{"../../../../uploads/products/6-silicone/Metatarsal Cushion Insoles.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials.","Ensure better stress distribution.","Pain reduction at the metatarsal area by reducing the pressure & rubbing when walking.","Eliminates calluses of the foot sale."}', '{Metatarsalgia}', 'Move');
INSERT INTO public.products VALUES (72, 'Cock - Up', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Cock - Up.jpg"}', NULL, true, 'S to 2XL - RT & LT', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{" Immobilization of the wrist joint for restriction of motion, pain relief, joint alignment, functional support, and/ or positioning for healing."}', '{" Fractures."," Nerve compressions (Carpal tunnel syndrome)."," Wrist sprains."," Tendonitis."," Arthritis."," Post-surgical conditions."}', 'Move');
INSERT INTO public.products VALUES (31, 'Toe Separator with Ring', '1', NULL, '{"../../../../uploads/products/6-silicone/Toe Separator with Ring.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials"," Incorporates a loop that holds the separator in place while providing protection to the other toe."}', '{"Hammer Toes","Claw Toes","Mallet Toes","Toenail Injuries","Fractured Toes"}', 'Move');
INSERT INTO public.products VALUES (1, 'Adult Arm Sling', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Arm Sling.jpg"}', NULL, true, 'S to XXL', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Seamless, lightweight durable materials."," Thumb loop prevents wrist drop."," Adjustable shoulder strap for ease of application & removal."}', '{" Cast support to maintain the arm in the neutral position."," Injuries to the arm, Upper limb injuries."," Provides elevation, protection, immobilization & support to hand, arm & shoulder."}', 'Move');
INSERT INTO public.products VALUES (10, 'Shoulder Immobilizer', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Shoulder Immobilizer.jpg"}', NULL, true, 'One Size', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Padded shoulder strap covered with breathable mesh material."," The whole product is made of soft material that does not contain hard materials such as plastics and metals."," Adjustable"," Universal: it could be used for the left and right shoulder."," Suitable for men and women use."}', '{" Shoulder joint injuries & dislocation."}', 'Move');
INSERT INTO public.products VALUES (3, 'Shoulder Support', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Shoulder Support.jpg"}', NULL, true, 'S to XXL - RT & LT', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" Made of high quality neoprene which guarantees warmth and compression."," Adjustable elastic shoulder strap."}', '{" Post shoulder dislocation."," As part of physical therapy after strains or rehabilitation program."," Sport injuries."," Arthritis."," Post-Operative."}', 'Move');
INSERT INTO public.products VALUES (75, 'Hyperextension TLSO', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Hyperextension TLSO.jpg"}', NULL, true, 'Custom - Made', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{"High quality material."," Soft padding."," High quality velcro closures."}', '{"Spinal Fractures"," Post operative"," Post traumatic"," Severe kyphosis"}', 'Move');
INSERT INTO public.products VALUES (4, 'Shoulder Abductor Support', NULL, NULL, '{"../../../../uploads/products/2-upperLimb/Shoulder Abductor Support.jpg"}', NULL, true, 'One Size', '2024-06-26 14:36:42.344+03', '2024-06-26 14:36:42.344+03', 1, 9, '{" High density foam cushion that provides 15 degrees of abduction for optimal support."," Adjustable waist strap."," Padded shoulder strap covered with breathable mesh material."}', '{" Shoulder dislocation & subluxation."}', 'Move');
INSERT INTO public.products VALUES (47, 'Talipes Shoes', NULL, NULL, '{"../../../../uploads/products/4-PediatricProducts/Talipes Shoes.jpg"}', NULL, true, '14 to 40', '2024-06-26 14:36:42.345+03', '2024-06-26 14:36:42.345+03', 1, 8, '{"Specially designed handmade shoes for Talipes Equinovarus."," Produced with premium quality soft leather."," Leather insole."," Available in black & colored models."}', '{"Congenital Talipes Equinovarus"}', 'Move');
INSERT INTO public.products VALUES (19, 'Thoracolumbar Support', NULL, NULL, '{"../../../../uploads/products/1-spin2&neck/Thoracolumbar Support.jpg"}', NULL, true, 'S to 4XL', '2024-06-26 14:36:42.347+03', '2024-06-26 14:36:42.347+03', 1, 7, '{" High grade elastic material lined with cotton."," Extra X-shaped wide straps for additional support."," 4 posterior metallic stays to support the thoracolumbar zone."," 2 anterior metallic stays for abdominal support."," Contact closures for additional support."," Grade 2+ straps guarantee high quality and durability."}', '{" Lumbar & lower thoracic spine strains & sprains."," Mild osteoporosis."," Posture control. "," Compression fractures."}', 'Move');
INSERT INTO public.products VALUES (33, 'Heel Cup - Lateral', '1', NULL, '{"../../../../uploads/products/6-silicone/Heel Cup - Lateral.jpg"}', 0, true, 'S to L', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"German, high - grade, hypo-allergic silicone material."}', '{"Heel pain.","Calceneal spur."}', 'Move');
INSERT INTO public.products VALUES (35, 'Big Toe Protector with Ring', '1', NULL, '{"../../../../uploads/products/6-silicone/Big Toe Protector with Ring.jpg"}', 0, true, 'One Size', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{" German, high - grade, hypo-allergic silicone material."}', '{Bunion,"Hallux valgus"}', 'Move');
INSERT INTO public.products VALUES (30, 'Anti - Varus / Anti - Valgus Heel Cup', '1', NULL, '{"../../../../uploads/products/6-silicone/Anti - Varus  Anti - Valgus Heel Cup.jpg"}', 0, true, 'M to 2XL', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{" Top quality, German, & non-toxic silicone materials."}', '{"Conservative treatment of Genu-Valgus & Genu-Varum.","Heel spur.","Achilles Tendonitis."}', 'Move');
INSERT INTO public.products VALUES (34, 'Bunion Night Splint', '1', NULL, '{"../../../../uploads/products/6-silicone/Bunion Night Splint.jpg"}', 0, true, 'One Size - RT & LT', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Aligns big toe.","Ideal for treating early stage bunions.","Semi-flexible plastic provides comfortable adjustment.","Realign toe bones while sleeping."}', '{Bunion,"Hallux valgus"}', 'Move');
INSERT INTO public.products VALUES (36, 'Tired Silicone Insole', NULL, NULL, '{"../../../../uploads/products/6-silicone/Tired Silicone Insole.jpg"}', NULL, true, 'S to XL', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{" German, high - grade, hypo-allergic silicone material."}', '{Sports.,"Long standing."}', 'Move');
INSERT INTO public.products VALUES (32, 'Toe Elevator', '1', NULL, '{"../../../../uploads/products/6-silicone/Toe Elevator.jpg"}', 0, true, 'S to L', '2024-06-26 14:36:42.35+03', '2024-06-26 14:36:42.35+03', 1, 3, '{"Top quality, German, & non-toxic silicone materials","Toe crests with loop.","Placed under the toes where they adapt anatomically"}', '{"Correct toe flexion","Claw & Hammer Toes"}', 'Move');
INSERT INTO public.products VALUES (76, 'Swedish A.F.O', NULL, NULL, '{"../../../../uploads/products/8-Orthoses/Swedish A.F.O.jpg"}', NULL, true, 'M to L - RT & LT', '2024-06-26 14:36:42.343+03', '2024-06-26 14:36:42.343+03', 1, 4, '{" Provides static dorsiflexion assistance and lateral stability for the ankle/foot area."," The low arch and open heel give a neat shape which fits into the shoes easily."}', '{"Foot Drop"}', 'Move');
INSERT INTO public.products VALUES (96, 'Rocking Diabetic Shoes', '1', NULL, '{"../../../../uploads/products/3-lowerLimb/Rocking Diabetic Shoes.jpg"}', 0, true, 'S to XXL', '2024-06-26 14:36:42.349+03', '2024-06-26 14:36:42.349+03', 1, 5, '{" Rigid, non-slip rocker sole."," Breathable, washable & micro-perforated fabric with 3 Velcro straps."}', '{" Distributes plantar surface pressure."," Supports diabetic foot & reduces pain."," Hindfoot instability."," Hallux valgus surgery."," Hammer toe surgery."," Morton Neuroma surgery."," Toe fractures."}', 'Move');


--
-- TOC entry 7305 (class 0 OID 1588949)
-- Dependencies: 227
-- Data for Name: productsIds; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 7304 (class 0 OID 1588936)
-- Dependencies: 226
-- Data for Name: purchasingOrders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."purchasingOrders" VALUES (1, 200, '{3}', 'cash', '2024-07-01 09:01:28.764+03', '2024-07-01 09:01:28.764+03', 13, 'testt', '{"id": 3, "quantity": 6}');


--
-- TOC entry 7300 (class 0 OID 1588900)
-- Dependencies: 222
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sectors VALUES (6, 'Elastic', 'uploads/sectors/image-1719211176226-cEBtKn8iADumWJE1yfRfx6-bands.jpg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (4, 'Orthoses', 'uploads/sectors/image-1719211229348-aUg0osrNevGYgpE9d0TbD3-Orthotics- Therapeutic Shoes.jpeg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (3, 'Silicone', 'uploads/sectors/image-1719211246424-CO4zV1lNyt2dcYrJBx53O2-Silicone.jpg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (2, 'Lifestyle', 'uploads/sectors/image-1719211266871-MFzPNWrThXEDhrMLxKCgf1-lifestyle.jpg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (9, 'Upper Limb', 'uploads/sectors/image-1719211067058-PlPCuLbEh3aQmgbwae8l-8-uppderLimb.jpeg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (8, 'Pediatric', 'uploads/sectors/image-1719211104165-2wPOYw-PrD7KiAbP3vTHr7-Pediatric.jpeg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (5, 'Lower Limb', 'uploads/sectors/image-1719211205427-0sBhja1Sj0T-qXh0ow66v4-Modular Orthotic Joint System.jpeg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');
INSERT INTO public.sectors VALUES (7, 'Spine & Neck', 'uploads/sectors/image-1719211130103-X2uDXzUK6Srew4menusF35-Spine&Neck.jpeg', '2024-06-26 02:59:27.034+03', '2024-06-26 02:59:27.034+03');


--
-- TOC entry 7309 (class 0 OID 2412764)
-- Dependencies: 231
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 7294 (class 0 OID 1588868)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, NULL, 'rolawafi209@outlook.com', '$2b$09$gmPPAUgv2jwvTOk27twpkuqBsAXTu6wceVEceVCxJxrRa9knVaSdW', NULL, 'admin', NULL, '2024-06-26 02:59:26.757+03', '2024-06-26 02:59:26.757+03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.users VALUES (12, NULL, 'rolawafi209@gmail.com', '$2b$09$G5rHgMU.SFvOquq9bXJkf.Np7hkLfpqehx.Gi3Y8/VAKIJtrYWpAi', NULL, 'user', NULL, '2024-06-27 07:56:55.463+03', '2024-06-27 07:56:55.463+03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.users VALUES (13, NULL, 'rolaahmed1807542@miuegypt.edu.eg', '$2b$09$sBWFhNXkNM5DBByGvZ0zBuu/WwsvkotJaPqqJ2Y8c8IbfKZI9B3Cq', NULL, 'user', NULL, '2024-06-27 08:00:52.456+03', '2024-06-27 08:00:52.456+03', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 7324 (class 0 OID 0)
-- Dependencies: 217
-- Name: contactUs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."contactUs_id_seq"', 3, true);


--
-- TOC entry 7325 (class 0 OID 0)
-- Dependencies: 219
-- Name: factories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factories_id_seq', 1, false);


--
-- TOC entry 7326 (class 0 OID 0)
-- Dependencies: 228
-- Name: ordersProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ordersProducts_id_seq"', 1, true);


--
-- TOC entry 7327 (class 0 OID 0)
-- Dependencies: 223
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 7328 (class 0 OID 0)
-- Dependencies: 225
-- Name: purchasingOrders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."purchasingOrders_id_seq"', 1, true);


--
-- TOC entry 7329 (class 0 OID 0)
-- Dependencies: 221
-- Name: sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sectors_id_seq', 1, false);


--
-- TOC entry 7330 (class 0 OID 0)
-- Dependencies: 230
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- TOC entry 7331 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- TOC entry 5555 (class 2606 OID 1588887)
-- Name: contactUs contactUs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."contactUs"
    ADD CONSTRAINT "contactUs_pkey" PRIMARY KEY (id);


--
-- TOC entry 5557 (class 2606 OID 2739438)
-- Name: factories factories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key UNIQUE (name);


--
-- TOC entry 5559 (class 2606 OID 2739642)
-- Name: factories factories_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key1 UNIQUE (name);


--
-- TOC entry 5561 (class 2606 OID 2739284)
-- Name: factories factories_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key10 UNIQUE (name);


--
-- TOC entry 5563 (class 2606 OID 2739710)
-- Name: factories factories_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key100 UNIQUE (name);


--
-- TOC entry 5565 (class 2606 OID 2739216)
-- Name: factories factories_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key101 UNIQUE (name);


--
-- TOC entry 5567 (class 2606 OID 2739712)
-- Name: factories factories_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key102 UNIQUE (name);


--
-- TOC entry 5569 (class 2606 OID 2739714)
-- Name: factories factories_name_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key103 UNIQUE (name);


--
-- TOC entry 5571 (class 2606 OID 2739086)
-- Name: factories factories_name_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key104 UNIQUE (name);


--
-- TOC entry 5573 (class 2606 OID 2739088)
-- Name: factories factories_name_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key105 UNIQUE (name);


--
-- TOC entry 5575 (class 2606 OID 2739672)
-- Name: factories factories_name_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key106 UNIQUE (name);


--
-- TOC entry 5577 (class 2606 OID 2739090)
-- Name: factories factories_name_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key107 UNIQUE (name);


--
-- TOC entry 5579 (class 2606 OID 2739670)
-- Name: factories factories_name_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key108 UNIQUE (name);


--
-- TOC entry 5581 (class 2606 OID 2739092)
-- Name: factories factories_name_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key109 UNIQUE (name);


--
-- TOC entry 5583 (class 2606 OID 2739286)
-- Name: factories factories_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key11 UNIQUE (name);


--
-- TOC entry 5585 (class 2606 OID 2739094)
-- Name: factories factories_name_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key110 UNIQUE (name);


--
-- TOC entry 5587 (class 2606 OID 2739110)
-- Name: factories factories_name_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key111 UNIQUE (name);


--
-- TOC entry 5589 (class 2606 OID 2739112)
-- Name: factories factories_name_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key112 UNIQUE (name);


--
-- TOC entry 5591 (class 2606 OID 2739114)
-- Name: factories factories_name_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key113 UNIQUE (name);


--
-- TOC entry 5593 (class 2606 OID 2739116)
-- Name: factories factories_name_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key114 UNIQUE (name);


--
-- TOC entry 5595 (class 2606 OID 2739668)
-- Name: factories factories_name_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key115 UNIQUE (name);


--
-- TOC entry 5597 (class 2606 OID 2739118)
-- Name: factories factories_name_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key116 UNIQUE (name);


--
-- TOC entry 5599 (class 2606 OID 2739120)
-- Name: factories factories_name_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key117 UNIQUE (name);


--
-- TOC entry 5601 (class 2606 OID 2739122)
-- Name: factories factories_name_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key118 UNIQUE (name);


--
-- TOC entry 5603 (class 2606 OID 2739124)
-- Name: factories factories_name_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key119 UNIQUE (name);


--
-- TOC entry 5605 (class 2606 OID 2739288)
-- Name: factories factories_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key12 UNIQUE (name);


--
-- TOC entry 5607 (class 2606 OID 2739126)
-- Name: factories factories_name_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key120 UNIQUE (name);


--
-- TOC entry 5609 (class 2606 OID 2739666)
-- Name: factories factories_name_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key121 UNIQUE (name);


--
-- TOC entry 5611 (class 2606 OID 2739128)
-- Name: factories factories_name_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key122 UNIQUE (name);


--
-- TOC entry 5613 (class 2606 OID 2739130)
-- Name: factories factories_name_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key123 UNIQUE (name);


--
-- TOC entry 5615 (class 2606 OID 2739132)
-- Name: factories factories_name_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key124 UNIQUE (name);


--
-- TOC entry 5617 (class 2606 OID 2739134)
-- Name: factories factories_name_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key125 UNIQUE (name);


--
-- TOC entry 5619 (class 2606 OID 2739136)
-- Name: factories factories_name_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key126 UNIQUE (name);


--
-- TOC entry 5621 (class 2606 OID 2739138)
-- Name: factories factories_name_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key127 UNIQUE (name);


--
-- TOC entry 5623 (class 2606 OID 2739140)
-- Name: factories factories_name_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key128 UNIQUE (name);


--
-- TOC entry 5625 (class 2606 OID 2739142)
-- Name: factories factories_name_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key129 UNIQUE (name);


--
-- TOC entry 5627 (class 2606 OID 2739290)
-- Name: factories factories_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key13 UNIQUE (name);


--
-- TOC entry 5629 (class 2606 OID 2739144)
-- Name: factories factories_name_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key130 UNIQUE (name);


--
-- TOC entry 5631 (class 2606 OID 2739146)
-- Name: factories factories_name_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key131 UNIQUE (name);


--
-- TOC entry 5633 (class 2606 OID 2739148)
-- Name: factories factories_name_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key132 UNIQUE (name);


--
-- TOC entry 5635 (class 2606 OID 2739150)
-- Name: factories factories_name_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key133 UNIQUE (name);


--
-- TOC entry 5637 (class 2606 OID 2739152)
-- Name: factories factories_name_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key134 UNIQUE (name);


--
-- TOC entry 5639 (class 2606 OID 2739154)
-- Name: factories factories_name_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key135 UNIQUE (name);


--
-- TOC entry 5641 (class 2606 OID 2739156)
-- Name: factories factories_name_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key136 UNIQUE (name);


--
-- TOC entry 5643 (class 2606 OID 2739158)
-- Name: factories factories_name_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key137 UNIQUE (name);


--
-- TOC entry 5645 (class 2606 OID 2739160)
-- Name: factories factories_name_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key138 UNIQUE (name);


--
-- TOC entry 5647 (class 2606 OID 2739162)
-- Name: factories factories_name_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key139 UNIQUE (name);


--
-- TOC entry 5649 (class 2606 OID 2739072)
-- Name: factories factories_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key14 UNIQUE (name);


--
-- TOC entry 5651 (class 2606 OID 2739164)
-- Name: factories factories_name_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key140 UNIQUE (name);


--
-- TOC entry 5653 (class 2606 OID 2739166)
-- Name: factories factories_name_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key141 UNIQUE (name);


--
-- TOC entry 5655 (class 2606 OID 2739528)
-- Name: factories factories_name_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key142 UNIQUE (name);


--
-- TOC entry 5657 (class 2606 OID 2739530)
-- Name: factories factories_name_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key143 UNIQUE (name);


--
-- TOC entry 5659 (class 2606 OID 2739214)
-- Name: factories factories_name_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key144 UNIQUE (name);


--
-- TOC entry 5661 (class 2606 OID 2739532)
-- Name: factories factories_name_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key145 UNIQUE (name);


--
-- TOC entry 5663 (class 2606 OID 2739534)
-- Name: factories factories_name_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key146 UNIQUE (name);


--
-- TOC entry 5665 (class 2606 OID 2739536)
-- Name: factories factories_name_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key147 UNIQUE (name);


--
-- TOC entry 5667 (class 2606 OID 2739538)
-- Name: factories factories_name_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key148 UNIQUE (name);


--
-- TOC entry 5669 (class 2606 OID 2739540)
-- Name: factories factories_name_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key149 UNIQUE (name);


--
-- TOC entry 5671 (class 2606 OID 2739074)
-- Name: factories factories_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key15 UNIQUE (name);


--
-- TOC entry 5673 (class 2606 OID 2739212)
-- Name: factories factories_name_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key150 UNIQUE (name);


--
-- TOC entry 5675 (class 2606 OID 2739542)
-- Name: factories factories_name_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key151 UNIQUE (name);


--
-- TOC entry 5677 (class 2606 OID 2739544)
-- Name: factories factories_name_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key152 UNIQUE (name);


--
-- TOC entry 5679 (class 2606 OID 2739546)
-- Name: factories factories_name_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key153 UNIQUE (name);


--
-- TOC entry 5681 (class 2606 OID 2739548)
-- Name: factories factories_name_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key154 UNIQUE (name);


--
-- TOC entry 5683 (class 2606 OID 2739210)
-- Name: factories factories_name_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key155 UNIQUE (name);


--
-- TOC entry 5685 (class 2606 OID 2739550)
-- Name: factories factories_name_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key156 UNIQUE (name);


--
-- TOC entry 5687 (class 2606 OID 2739552)
-- Name: factories factories_name_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key157 UNIQUE (name);


--
-- TOC entry 5689 (class 2606 OID 2739554)
-- Name: factories factories_name_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key158 UNIQUE (name);


--
-- TOC entry 5691 (class 2606 OID 2739556)
-- Name: factories factories_name_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key159 UNIQUE (name);


--
-- TOC entry 5693 (class 2606 OID 2739076)
-- Name: factories factories_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key16 UNIQUE (name);


--
-- TOC entry 5695 (class 2606 OID 2739558)
-- Name: factories factories_name_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key160 UNIQUE (name);


--
-- TOC entry 5697 (class 2606 OID 2739560)
-- Name: factories factories_name_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key161 UNIQUE (name);


--
-- TOC entry 5699 (class 2606 OID 2739562)
-- Name: factories factories_name_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key162 UNIQUE (name);


--
-- TOC entry 5701 (class 2606 OID 2739564)
-- Name: factories factories_name_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key163 UNIQUE (name);


--
-- TOC entry 5703 (class 2606 OID 2739566)
-- Name: factories factories_name_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key164 UNIQUE (name);


--
-- TOC entry 5705 (class 2606 OID 2739208)
-- Name: factories factories_name_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key165 UNIQUE (name);


--
-- TOC entry 5707 (class 2606 OID 2739568)
-- Name: factories factories_name_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key166 UNIQUE (name);


--
-- TOC entry 5709 (class 2606 OID 2739622)
-- Name: factories factories_name_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key167 UNIQUE (name);


--
-- TOC entry 5711 (class 2606 OID 2739624)
-- Name: factories factories_name_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key168 UNIQUE (name);


--
-- TOC entry 5713 (class 2606 OID 2739626)
-- Name: factories factories_name_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key169 UNIQUE (name);


--
-- TOC entry 5715 (class 2606 OID 2739436)
-- Name: factories factories_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key17 UNIQUE (name);


--
-- TOC entry 5717 (class 2606 OID 2739628)
-- Name: factories factories_name_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key170 UNIQUE (name);


--
-- TOC entry 5719 (class 2606 OID 2739206)
-- Name: factories factories_name_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key171 UNIQUE (name);


--
-- TOC entry 5721 (class 2606 OID 2739630)
-- Name: factories factories_name_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key172 UNIQUE (name);


--
-- TOC entry 5723 (class 2606 OID 2739168)
-- Name: factories factories_name_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key173 UNIQUE (name);


--
-- TOC entry 5725 (class 2606 OID 2739292)
-- Name: factories factories_name_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key174 UNIQUE (name);


--
-- TOC entry 5727 (class 2606 OID 2739294)
-- Name: factories factories_name_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key175 UNIQUE (name);


--
-- TOC entry 5729 (class 2606 OID 2739204)
-- Name: factories factories_name_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key176 UNIQUE (name);


--
-- TOC entry 5731 (class 2606 OID 2739296)
-- Name: factories factories_name_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key177 UNIQUE (name);


--
-- TOC entry 5733 (class 2606 OID 2739298)
-- Name: factories factories_name_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key178 UNIQUE (name);


--
-- TOC entry 5735 (class 2606 OID 2739300)
-- Name: factories factories_name_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key179 UNIQUE (name);


--
-- TOC entry 5737 (class 2606 OID 2739686)
-- Name: factories factories_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key18 UNIQUE (name);


--
-- TOC entry 5739 (class 2606 OID 2739302)
-- Name: factories factories_name_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key180 UNIQUE (name);


--
-- TOC entry 5741 (class 2606 OID 2739304)
-- Name: factories factories_name_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key181 UNIQUE (name);


--
-- TOC entry 5743 (class 2606 OID 2739306)
-- Name: factories factories_name_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key182 UNIQUE (name);


--
-- TOC entry 5745 (class 2606 OID 2739308)
-- Name: factories factories_name_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key183 UNIQUE (name);


--
-- TOC entry 5747 (class 2606 OID 2739310)
-- Name: factories factories_name_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key184 UNIQUE (name);


--
-- TOC entry 5749 (class 2606 OID 2739202)
-- Name: factories factories_name_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key185 UNIQUE (name);


--
-- TOC entry 5751 (class 2606 OID 2739312)
-- Name: factories factories_name_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key186 UNIQUE (name);


--
-- TOC entry 5753 (class 2606 OID 2739314)
-- Name: factories factories_name_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key187 UNIQUE (name);


--
-- TOC entry 5755 (class 2606 OID 2739316)
-- Name: factories factories_name_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key188 UNIQUE (name);


--
-- TOC entry 5757 (class 2606 OID 2739318)
-- Name: factories factories_name_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key189 UNIQUE (name);


--
-- TOC entry 5759 (class 2606 OID 2739078)
-- Name: factories factories_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key19 UNIQUE (name);


--
-- TOC entry 5761 (class 2606 OID 2739320)
-- Name: factories factories_name_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key190 UNIQUE (name);


--
-- TOC entry 5763 (class 2606 OID 2739322)
-- Name: factories factories_name_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key191 UNIQUE (name);


--
-- TOC entry 5765 (class 2606 OID 2739324)
-- Name: factories factories_name_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key192 UNIQUE (name);


--
-- TOC entry 5767 (class 2606 OID 2739200)
-- Name: factories factories_name_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key193 UNIQUE (name);


--
-- TOC entry 5769 (class 2606 OID 2739326)
-- Name: factories factories_name_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key194 UNIQUE (name);


--
-- TOC entry 5771 (class 2606 OID 2739328)
-- Name: factories factories_name_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key195 UNIQUE (name);


--
-- TOC entry 5773 (class 2606 OID 2739330)
-- Name: factories factories_name_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key196 UNIQUE (name);


--
-- TOC entry 5775 (class 2606 OID 2739332)
-- Name: factories factories_name_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key197 UNIQUE (name);


--
-- TOC entry 5777 (class 2606 OID 2739334)
-- Name: factories factories_name_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key198 UNIQUE (name);


--
-- TOC entry 5779 (class 2606 OID 2739336)
-- Name: factories factories_name_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key199 UNIQUE (name);


--
-- TOC entry 5781 (class 2606 OID 2739644)
-- Name: factories factories_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key2 UNIQUE (name);


--
-- TOC entry 5783 (class 2606 OID 2739080)
-- Name: factories factories_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key20 UNIQUE (name);


--
-- TOC entry 5785 (class 2606 OID 2739198)
-- Name: factories factories_name_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key200 UNIQUE (name);


--
-- TOC entry 5787 (class 2606 OID 2739338)
-- Name: factories factories_name_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key201 UNIQUE (name);


--
-- TOC entry 5789 (class 2606 OID 2739340)
-- Name: factories factories_name_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key202 UNIQUE (name);


--
-- TOC entry 5791 (class 2606 OID 2739342)
-- Name: factories factories_name_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key203 UNIQUE (name);


--
-- TOC entry 5793 (class 2606 OID 2739344)
-- Name: factories factories_name_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key204 UNIQUE (name);


--
-- TOC entry 5795 (class 2606 OID 2739346)
-- Name: factories factories_name_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key205 UNIQUE (name);


--
-- TOC entry 5797 (class 2606 OID 2739196)
-- Name: factories factories_name_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key206 UNIQUE (name);


--
-- TOC entry 5799 (class 2606 OID 2739348)
-- Name: factories factories_name_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key207 UNIQUE (name);


--
-- TOC entry 5801 (class 2606 OID 2739350)
-- Name: factories factories_name_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key208 UNIQUE (name);


--
-- TOC entry 5803 (class 2606 OID 2739352)
-- Name: factories factories_name_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key209 UNIQUE (name);


--
-- TOC entry 5805 (class 2606 OID 2739684)
-- Name: factories factories_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key21 UNIQUE (name);


--
-- TOC entry 5807 (class 2606 OID 2739354)
-- Name: factories factories_name_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key210 UNIQUE (name);


--
-- TOC entry 5809 (class 2606 OID 2739194)
-- Name: factories factories_name_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key211 UNIQUE (name);


--
-- TOC entry 5811 (class 2606 OID 2739356)
-- Name: factories factories_name_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key212 UNIQUE (name);


--
-- TOC entry 5813 (class 2606 OID 2739358)
-- Name: factories factories_name_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key213 UNIQUE (name);


--
-- TOC entry 5815 (class 2606 OID 2739360)
-- Name: factories factories_name_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key214 UNIQUE (name);


--
-- TOC entry 5817 (class 2606 OID 2739362)
-- Name: factories factories_name_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key215 UNIQUE (name);


--
-- TOC entry 5819 (class 2606 OID 2739192)
-- Name: factories factories_name_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key216 UNIQUE (name);


--
-- TOC entry 5821 (class 2606 OID 2739364)
-- Name: factories factories_name_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key217 UNIQUE (name);


--
-- TOC entry 5823 (class 2606 OID 2739366)
-- Name: factories factories_name_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key218 UNIQUE (name);


--
-- TOC entry 5825 (class 2606 OID 2739368)
-- Name: factories factories_name_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key219 UNIQUE (name);


--
-- TOC entry 5827 (class 2606 OID 2739082)
-- Name: factories factories_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key22 UNIQUE (name);


--
-- TOC entry 5829 (class 2606 OID 2739370)
-- Name: factories factories_name_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key220 UNIQUE (name);


--
-- TOC entry 5831 (class 2606 OID 2739190)
-- Name: factories factories_name_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key221 UNIQUE (name);


--
-- TOC entry 5833 (class 2606 OID 2739174)
-- Name: factories factories_name_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key222 UNIQUE (name);


--
-- TOC entry 5835 (class 2606 OID 2739176)
-- Name: factories factories_name_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key223 UNIQUE (name);


--
-- TOC entry 5837 (class 2606 OID 2739188)
-- Name: factories factories_name_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key224 UNIQUE (name);


--
-- TOC entry 5839 (class 2606 OID 2739178)
-- Name: factories factories_name_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key225 UNIQUE (name);


--
-- TOC entry 5841 (class 2606 OID 2739186)
-- Name: factories factories_name_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key226 UNIQUE (name);


--
-- TOC entry 5843 (class 2606 OID 2739180)
-- Name: factories factories_name_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key227 UNIQUE (name);


--
-- TOC entry 5845 (class 2606 OID 2739184)
-- Name: factories factories_name_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key228 UNIQUE (name);


--
-- TOC entry 5847 (class 2606 OID 2739182)
-- Name: factories factories_name_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key229 UNIQUE (name);


--
-- TOC entry 5849 (class 2606 OID 2739084)
-- Name: factories factories_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key23 UNIQUE (name);


--
-- TOC entry 5851 (class 2606 OID 2739760)
-- Name: factories factories_name_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key230 UNIQUE (name);


--
-- TOC entry 5853 (class 2606 OID 2739762)
-- Name: factories factories_name_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key231 UNIQUE (name);


--
-- TOC entry 5855 (class 2606 OID 2739764)
-- Name: factories factories_name_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key232 UNIQUE (name);


--
-- TOC entry 5857 (class 2606 OID 2739226)
-- Name: factories factories_name_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key233 UNIQUE (name);


--
-- TOC entry 5859 (class 2606 OID 2739278)
-- Name: factories factories_name_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key234 UNIQUE (name);


--
-- TOC entry 5861 (class 2606 OID 2739228)
-- Name: factories factories_name_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key235 UNIQUE (name);


--
-- TOC entry 5863 (class 2606 OID 2739230)
-- Name: factories factories_name_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key236 UNIQUE (name);


--
-- TOC entry 5865 (class 2606 OID 2739232)
-- Name: factories factories_name_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key237 UNIQUE (name);


--
-- TOC entry 5867 (class 2606 OID 2739234)
-- Name: factories factories_name_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key238 UNIQUE (name);


--
-- TOC entry 5869 (class 2606 OID 2739276)
-- Name: factories factories_name_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key239 UNIQUE (name);


--
-- TOC entry 5871 (class 2606 OID 2739682)
-- Name: factories factories_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key24 UNIQUE (name);


--
-- TOC entry 5873 (class 2606 OID 2739236)
-- Name: factories factories_name_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key240 UNIQUE (name);


--
-- TOC entry 5875 (class 2606 OID 2739238)
-- Name: factories factories_name_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key241 UNIQUE (name);


--
-- TOC entry 5877 (class 2606 OID 2739274)
-- Name: factories factories_name_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key242 UNIQUE (name);


--
-- TOC entry 5879 (class 2606 OID 2739240)
-- Name: factories factories_name_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key243 UNIQUE (name);


--
-- TOC entry 5881 (class 2606 OID 2739242)
-- Name: factories factories_name_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key244 UNIQUE (name);


--
-- TOC entry 5883 (class 2606 OID 2739244)
-- Name: factories factories_name_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key245 UNIQUE (name);


--
-- TOC entry 5885 (class 2606 OID 2739246)
-- Name: factories factories_name_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key246 UNIQUE (name);


--
-- TOC entry 5887 (class 2606 OID 2739248)
-- Name: factories factories_name_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key247 UNIQUE (name);


--
-- TOC entry 5889 (class 2606 OID 2739272)
-- Name: factories factories_name_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key248 UNIQUE (name);


--
-- TOC entry 5891 (class 2606 OID 2739250)
-- Name: factories factories_name_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key249 UNIQUE (name);


--
-- TOC entry 5893 (class 2606 OID 2739674)
-- Name: factories factories_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key25 UNIQUE (name);


--
-- TOC entry 5895 (class 2606 OID 2739252)
-- Name: factories factories_name_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key250 UNIQUE (name);


--
-- TOC entry 5897 (class 2606 OID 2739254)
-- Name: factories factories_name_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key251 UNIQUE (name);


--
-- TOC entry 5899 (class 2606 OID 2739256)
-- Name: factories factories_name_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key252 UNIQUE (name);


--
-- TOC entry 5901 (class 2606 OID 2739270)
-- Name: factories factories_name_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key253 UNIQUE (name);


--
-- TOC entry 5903 (class 2606 OID 2739268)
-- Name: factories factories_name_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key254 UNIQUE (name);


--
-- TOC entry 5905 (class 2606 OID 2739258)
-- Name: factories factories_name_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key255 UNIQUE (name);


--
-- TOC entry 5907 (class 2606 OID 2739260)
-- Name: factories factories_name_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key256 UNIQUE (name);


--
-- TOC entry 5909 (class 2606 OID 2739262)
-- Name: factories factories_name_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key257 UNIQUE (name);


--
-- TOC entry 5911 (class 2606 OID 2739264)
-- Name: factories factories_name_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key258 UNIQUE (name);


--
-- TOC entry 5913 (class 2606 OID 2739266)
-- Name: factories factories_name_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key259 UNIQUE (name);


--
-- TOC entry 5915 (class 2606 OID 2739676)
-- Name: factories factories_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key26 UNIQUE (name);


--
-- TOC entry 5917 (class 2606 OID 2739570)
-- Name: factories factories_name_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key260 UNIQUE (name);


--
-- TOC entry 5919 (class 2606 OID 2739620)
-- Name: factories factories_name_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key261 UNIQUE (name);


--
-- TOC entry 5921 (class 2606 OID 2739572)
-- Name: factories factories_name_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key262 UNIQUE (name);


--
-- TOC entry 5923 (class 2606 OID 2739574)
-- Name: factories factories_name_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key263 UNIQUE (name);


--
-- TOC entry 5925 (class 2606 OID 2739576)
-- Name: factories factories_name_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key264 UNIQUE (name);


--
-- TOC entry 5927 (class 2606 OID 2739578)
-- Name: factories factories_name_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key265 UNIQUE (name);


--
-- TOC entry 5929 (class 2606 OID 2739580)
-- Name: factories factories_name_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key266 UNIQUE (name);


--
-- TOC entry 5931 (class 2606 OID 2739618)
-- Name: factories factories_name_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key267 UNIQUE (name);


--
-- TOC entry 5933 (class 2606 OID 2739616)
-- Name: factories factories_name_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key268 UNIQUE (name);


--
-- TOC entry 5935 (class 2606 OID 2739582)
-- Name: factories factories_name_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key269 UNIQUE (name);


--
-- TOC entry 5937 (class 2606 OID 2739678)
-- Name: factories factories_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key27 UNIQUE (name);


--
-- TOC entry 5939 (class 2606 OID 2739584)
-- Name: factories factories_name_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key270 UNIQUE (name);


--
-- TOC entry 5941 (class 2606 OID 2739586)
-- Name: factories factories_name_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key271 UNIQUE (name);


--
-- TOC entry 5943 (class 2606 OID 2739614)
-- Name: factories factories_name_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key272 UNIQUE (name);


--
-- TOC entry 5945 (class 2606 OID 2739588)
-- Name: factories factories_name_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key273 UNIQUE (name);


--
-- TOC entry 5947 (class 2606 OID 2739590)
-- Name: factories factories_name_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key274 UNIQUE (name);


--
-- TOC entry 5949 (class 2606 OID 2739592)
-- Name: factories factories_name_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key275 UNIQUE (name);


--
-- TOC entry 5951 (class 2606 OID 2739612)
-- Name: factories factories_name_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key276 UNIQUE (name);


--
-- TOC entry 5953 (class 2606 OID 2739594)
-- Name: factories factories_name_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key277 UNIQUE (name);


--
-- TOC entry 5955 (class 2606 OID 2739596)
-- Name: factories factories_name_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key278 UNIQUE (name);


--
-- TOC entry 5957 (class 2606 OID 2739610)
-- Name: factories factories_name_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key279 UNIQUE (name);


--
-- TOC entry 5959 (class 2606 OID 2739680)
-- Name: factories factories_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key28 UNIQUE (name);


--
-- TOC entry 5961 (class 2606 OID 2739598)
-- Name: factories factories_name_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key280 UNIQUE (name);


--
-- TOC entry 5963 (class 2606 OID 2739600)
-- Name: factories factories_name_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key281 UNIQUE (name);


--
-- TOC entry 5965 (class 2606 OID 2739602)
-- Name: factories factories_name_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key282 UNIQUE (name);


--
-- TOC entry 5967 (class 2606 OID 2739604)
-- Name: factories factories_name_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key283 UNIQUE (name);


--
-- TOC entry 5969 (class 2606 OID 2739608)
-- Name: factories factories_name_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key284 UNIQUE (name);


--
-- TOC entry 5971 (class 2606 OID 2739606)
-- Name: factories factories_name_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key285 UNIQUE (name);


--
-- TOC entry 5973 (class 2606 OID 2739440)
-- Name: factories factories_name_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key286 UNIQUE (name);


--
-- TOC entry 5975 (class 2606 OID 2739442)
-- Name: factories factories_name_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key287 UNIQUE (name);


--
-- TOC entry 5977 (class 2606 OID 2739444)
-- Name: factories factories_name_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key288 UNIQUE (name);


--
-- TOC entry 5979 (class 2606 OID 2739446)
-- Name: factories factories_name_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key289 UNIQUE (name);


--
-- TOC entry 5981 (class 2606 OID 2739758)
-- Name: factories factories_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key29 UNIQUE (name);


--
-- TOC entry 5983 (class 2606 OID 2739448)
-- Name: factories factories_name_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key290 UNIQUE (name);


--
-- TOC entry 5985 (class 2606 OID 2739450)
-- Name: factories factories_name_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key291 UNIQUE (name);


--
-- TOC entry 5987 (class 2606 OID 2739452)
-- Name: factories factories_name_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key292 UNIQUE (name);


--
-- TOC entry 5989 (class 2606 OID 2739454)
-- Name: factories factories_name_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key293 UNIQUE (name);


--
-- TOC entry 5991 (class 2606 OID 2739640)
-- Name: factories factories_name_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key294 UNIQUE (name);


--
-- TOC entry 5993 (class 2606 OID 2739456)
-- Name: factories factories_name_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key295 UNIQUE (name);


--
-- TOC entry 5995 (class 2606 OID 2739458)
-- Name: factories factories_name_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key296 UNIQUE (name);


--
-- TOC entry 5997 (class 2606 OID 2739460)
-- Name: factories factories_name_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key297 UNIQUE (name);


--
-- TOC entry 5999 (class 2606 OID 2739462)
-- Name: factories factories_name_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key298 UNIQUE (name);


--
-- TOC entry 6001 (class 2606 OID 2739638)
-- Name: factories factories_name_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key299 UNIQUE (name);


--
-- TOC entry 6003 (class 2606 OID 2739646)
-- Name: factories factories_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key3 UNIQUE (name);


--
-- TOC entry 6005 (class 2606 OID 2739280)
-- Name: factories factories_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key30 UNIQUE (name);


--
-- TOC entry 6007 (class 2606 OID 2739464)
-- Name: factories factories_name_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key300 UNIQUE (name);


--
-- TOC entry 6009 (class 2606 OID 2739466)
-- Name: factories factories_name_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key301 UNIQUE (name);


--
-- TOC entry 6011 (class 2606 OID 2739468)
-- Name: factories factories_name_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key302 UNIQUE (name);


--
-- TOC entry 6013 (class 2606 OID 2739470)
-- Name: factories factories_name_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key303 UNIQUE (name);


--
-- TOC entry 6015 (class 2606 OID 2739472)
-- Name: factories factories_name_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key304 UNIQUE (name);


--
-- TOC entry 6017 (class 2606 OID 2739474)
-- Name: factories factories_name_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key305 UNIQUE (name);


--
-- TOC entry 6019 (class 2606 OID 2739476)
-- Name: factories factories_name_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key306 UNIQUE (name);


--
-- TOC entry 6021 (class 2606 OID 2739478)
-- Name: factories factories_name_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key307 UNIQUE (name);


--
-- TOC entry 6023 (class 2606 OID 2739480)
-- Name: factories factories_name_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key308 UNIQUE (name);


--
-- TOC entry 6025 (class 2606 OID 2739482)
-- Name: factories factories_name_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key309 UNIQUE (name);


--
-- TOC entry 6027 (class 2606 OID 2739688)
-- Name: factories factories_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key31 UNIQUE (name);


--
-- TOC entry 6029 (class 2606 OID 2739636)
-- Name: factories factories_name_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key310 UNIQUE (name);


--
-- TOC entry 6031 (class 2606 OID 2739484)
-- Name: factories factories_name_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key311 UNIQUE (name);


--
-- TOC entry 6033 (class 2606 OID 2739486)
-- Name: factories factories_name_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key312 UNIQUE (name);


--
-- TOC entry 6035 (class 2606 OID 2739488)
-- Name: factories factories_name_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key313 UNIQUE (name);


--
-- TOC entry 6037 (class 2606 OID 2739490)
-- Name: factories factories_name_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key314 UNIQUE (name);


--
-- TOC entry 6039 (class 2606 OID 2739492)
-- Name: factories factories_name_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key315 UNIQUE (name);


--
-- TOC entry 6041 (class 2606 OID 2739634)
-- Name: factories factories_name_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key316 UNIQUE (name);


--
-- TOC entry 6043 (class 2606 OID 2739494)
-- Name: factories factories_name_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key317 UNIQUE (name);


--
-- TOC entry 6045 (class 2606 OID 2739496)
-- Name: factories factories_name_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key318 UNIQUE (name);


--
-- TOC entry 6047 (class 2606 OID 2739498)
-- Name: factories factories_name_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key319 UNIQUE (name);


--
-- TOC entry 6049 (class 2606 OID 2739380)
-- Name: factories factories_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key32 UNIQUE (name);


--
-- TOC entry 6051 (class 2606 OID 2739500)
-- Name: factories factories_name_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key320 UNIQUE (name);


--
-- TOC entry 6053 (class 2606 OID 2739632)
-- Name: factories factories_name_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key321 UNIQUE (name);


--
-- TOC entry 6055 (class 2606 OID 2739502)
-- Name: factories factories_name_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key322 UNIQUE (name);


--
-- TOC entry 6057 (class 2606 OID 2739504)
-- Name: factories factories_name_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key323 UNIQUE (name);


--
-- TOC entry 6059 (class 2606 OID 2739526)
-- Name: factories factories_name_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key324 UNIQUE (name);


--
-- TOC entry 6061 (class 2606 OID 2739506)
-- Name: factories factories_name_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key325 UNIQUE (name);


--
-- TOC entry 6063 (class 2606 OID 2739508)
-- Name: factories factories_name_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key326 UNIQUE (name);


--
-- TOC entry 6065 (class 2606 OID 2739510)
-- Name: factories factories_name_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key327 UNIQUE (name);


--
-- TOC entry 6067 (class 2606 OID 2739512)
-- Name: factories factories_name_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key328 UNIQUE (name);


--
-- TOC entry 6069 (class 2606 OID 2739524)
-- Name: factories factories_name_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key329 UNIQUE (name);


--
-- TOC entry 6071 (class 2606 OID 2739382)
-- Name: factories factories_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key33 UNIQUE (name);


--
-- TOC entry 6073 (class 2606 OID 2739514)
-- Name: factories factories_name_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key330 UNIQUE (name);


--
-- TOC entry 6075 (class 2606 OID 2739516)
-- Name: factories factories_name_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key331 UNIQUE (name);


--
-- TOC entry 6077 (class 2606 OID 2739522)
-- Name: factories factories_name_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key332 UNIQUE (name);


--
-- TOC entry 6079 (class 2606 OID 2739518)
-- Name: factories factories_name_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key333 UNIQUE (name);


--
-- TOC entry 6081 (class 2606 OID 2739520)
-- Name: factories factories_name_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key334 UNIQUE (name);


--
-- TOC entry 6083 (class 2606 OID 2739766)
-- Name: factories factories_name_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key335 UNIQUE (name);


--
-- TOC entry 6085 (class 2606 OID 2739224)
-- Name: factories factories_name_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key336 UNIQUE (name);


--
-- TOC entry 6087 (class 2606 OID 2739004)
-- Name: factories factories_name_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key337 UNIQUE (name);


--
-- TOC entry 6089 (class 2606 OID 2739006)
-- Name: factories factories_name_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key338 UNIQUE (name);


--
-- TOC entry 6091 (class 2606 OID 2739222)
-- Name: factories factories_name_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key339 UNIQUE (name);


--
-- TOC entry 6093 (class 2606 OID 2739384)
-- Name: factories factories_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key34 UNIQUE (name);


--
-- TOC entry 6095 (class 2606 OID 2739008)
-- Name: factories factories_name_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key340 UNIQUE (name);


--
-- TOC entry 6097 (class 2606 OID 2739220)
-- Name: factories factories_name_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key341 UNIQUE (name);


--
-- TOC entry 6099 (class 2606 OID 2739010)
-- Name: factories factories_name_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key342 UNIQUE (name);


--
-- TOC entry 6101 (class 2606 OID 2739012)
-- Name: factories factories_name_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key343 UNIQUE (name);


--
-- TOC entry 6103 (class 2606 OID 2739014)
-- Name: factories factories_name_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key344 UNIQUE (name);


--
-- TOC entry 6105 (class 2606 OID 2739016)
-- Name: factories factories_name_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key345 UNIQUE (name);


--
-- TOC entry 6107 (class 2606 OID 2739018)
-- Name: factories factories_name_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key346 UNIQUE (name);


--
-- TOC entry 6109 (class 2606 OID 2739172)
-- Name: factories factories_name_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key347 UNIQUE (name);


--
-- TOC entry 6111 (class 2606 OID 2739020)
-- Name: factories factories_name_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key348 UNIQUE (name);


--
-- TOC entry 6113 (class 2606 OID 2739022)
-- Name: factories factories_name_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key349 UNIQUE (name);


--
-- TOC entry 6115 (class 2606 OID 2739434)
-- Name: factories factories_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key35 UNIQUE (name);


--
-- TOC entry 6117 (class 2606 OID 2739024)
-- Name: factories factories_name_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key350 UNIQUE (name);


--
-- TOC entry 6119 (class 2606 OID 2739170)
-- Name: factories factories_name_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key351 UNIQUE (name);


--
-- TOC entry 6121 (class 2606 OID 2739026)
-- Name: factories factories_name_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key352 UNIQUE (name);


--
-- TOC entry 6123 (class 2606 OID 2739028)
-- Name: factories factories_name_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key353 UNIQUE (name);


--
-- TOC entry 6125 (class 2606 OID 2739030)
-- Name: factories factories_name_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key354 UNIQUE (name);


--
-- TOC entry 6127 (class 2606 OID 2739070)
-- Name: factories factories_name_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key355 UNIQUE (name);


--
-- TOC entry 6129 (class 2606 OID 2739032)
-- Name: factories factories_name_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key356 UNIQUE (name);


--
-- TOC entry 6131 (class 2606 OID 2739034)
-- Name: factories factories_name_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key357 UNIQUE (name);


--
-- TOC entry 6133 (class 2606 OID 2739036)
-- Name: factories factories_name_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key358 UNIQUE (name);


--
-- TOC entry 6135 (class 2606 OID 2739038)
-- Name: factories factories_name_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key359 UNIQUE (name);


--
-- TOC entry 6137 (class 2606 OID 2739386)
-- Name: factories factories_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key36 UNIQUE (name);


--
-- TOC entry 6139 (class 2606 OID 2739040)
-- Name: factories factories_name_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key360 UNIQUE (name);


--
-- TOC entry 6141 (class 2606 OID 2739042)
-- Name: factories factories_name_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key361 UNIQUE (name);


--
-- TOC entry 6143 (class 2606 OID 2739068)
-- Name: factories factories_name_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key362 UNIQUE (name);


--
-- TOC entry 6145 (class 2606 OID 2739044)
-- Name: factories factories_name_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key363 UNIQUE (name);


--
-- TOC entry 6147 (class 2606 OID 2739046)
-- Name: factories factories_name_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key364 UNIQUE (name);


--
-- TOC entry 6149 (class 2606 OID 2739066)
-- Name: factories factories_name_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key365 UNIQUE (name);


--
-- TOC entry 6151 (class 2606 OID 2739048)
-- Name: factories factories_name_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key366 UNIQUE (name);


--
-- TOC entry 6153 (class 2606 OID 2739050)
-- Name: factories factories_name_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key367 UNIQUE (name);


--
-- TOC entry 6155 (class 2606 OID 2739052)
-- Name: factories factories_name_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key368 UNIQUE (name);


--
-- TOC entry 6157 (class 2606 OID 2739054)
-- Name: factories factories_name_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key369 UNIQUE (name);


--
-- TOC entry 6159 (class 2606 OID 2739388)
-- Name: factories factories_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key37 UNIQUE (name);


--
-- TOC entry 6161 (class 2606 OID 2739056)
-- Name: factories factories_name_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key370 UNIQUE (name);


--
-- TOC entry 6163 (class 2606 OID 2739058)
-- Name: factories factories_name_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key371 UNIQUE (name);


--
-- TOC entry 6165 (class 2606 OID 2739060)
-- Name: factories factories_name_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key372 UNIQUE (name);


--
-- TOC entry 6167 (class 2606 OID 2739062)
-- Name: factories factories_name_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key373 UNIQUE (name);


--
-- TOC entry 6169 (class 2606 OID 2739064)
-- Name: factories factories_name_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key374 UNIQUE (name);


--
-- TOC entry 6171 (class 2606 OID 2739108)
-- Name: factories factories_name_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key375 UNIQUE (name);


--
-- TOC entry 6173 (class 2606 OID 2739096)
-- Name: factories factories_name_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key376 UNIQUE (name);


--
-- TOC entry 6175 (class 2606 OID 2739106)
-- Name: factories factories_name_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key377 UNIQUE (name);


--
-- TOC entry 6177 (class 2606 OID 2739098)
-- Name: factories factories_name_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key378 UNIQUE (name);


--
-- TOC entry 6179 (class 2606 OID 2739104)
-- Name: factories factories_name_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key379 UNIQUE (name);


--
-- TOC entry 6181 (class 2606 OID 2739390)
-- Name: factories factories_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key38 UNIQUE (name);


--
-- TOC entry 6183 (class 2606 OID 2739102)
-- Name: factories factories_name_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key380 UNIQUE (name);


--
-- TOC entry 6185 (class 2606 OID 2739100)
-- Name: factories factories_name_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key381 UNIQUE (name);


--
-- TOC entry 6187 (class 2606 OID 2739768)
-- Name: factories factories_name_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key382 UNIQUE (name);


--
-- TOC entry 6189 (class 2606 OID 2739770)
-- Name: factories factories_name_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key383 UNIQUE (name);


--
-- TOC entry 6191 (class 2606 OID 2739772)
-- Name: factories factories_name_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key384 UNIQUE (name);


--
-- TOC entry 6193 (class 2606 OID 2739774)
-- Name: factories factories_name_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key385 UNIQUE (name);


--
-- TOC entry 6195 (class 2606 OID 2739002)
-- Name: factories factories_name_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key386 UNIQUE (name);


--
-- TOC entry 6197 (class 2606 OID 2739776)
-- Name: factories factories_name_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key387 UNIQUE (name);


--
-- TOC entry 6199 (class 2606 OID 2739778)
-- Name: factories factories_name_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key388 UNIQUE (name);


--
-- TOC entry 6201 (class 2606 OID 2739780)
-- Name: factories factories_name_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key389 UNIQUE (name);


--
-- TOC entry 6203 (class 2606 OID 2739392)
-- Name: factories factories_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key39 UNIQUE (name);


--
-- TOC entry 6205 (class 2606 OID 2739782)
-- Name: factories factories_name_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key390 UNIQUE (name);


--
-- TOC entry 6207 (class 2606 OID 2739784)
-- Name: factories factories_name_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key391 UNIQUE (name);


--
-- TOC entry 6209 (class 2606 OID 2739648)
-- Name: factories factories_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key4 UNIQUE (name);


--
-- TOC entry 6211 (class 2606 OID 2739394)
-- Name: factories factories_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key40 UNIQUE (name);


--
-- TOC entry 6213 (class 2606 OID 2739396)
-- Name: factories factories_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key41 UNIQUE (name);


--
-- TOC entry 6215 (class 2606 OID 2739398)
-- Name: factories factories_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key42 UNIQUE (name);


--
-- TOC entry 6217 (class 2606 OID 2739400)
-- Name: factories factories_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key43 UNIQUE (name);


--
-- TOC entry 6219 (class 2606 OID 2739402)
-- Name: factories factories_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key44 UNIQUE (name);


--
-- TOC entry 6221 (class 2606 OID 2739432)
-- Name: factories factories_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key45 UNIQUE (name);


--
-- TOC entry 6223 (class 2606 OID 2739404)
-- Name: factories factories_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key46 UNIQUE (name);


--
-- TOC entry 6225 (class 2606 OID 2739406)
-- Name: factories factories_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key47 UNIQUE (name);


--
-- TOC entry 6227 (class 2606 OID 2739408)
-- Name: factories factories_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key48 UNIQUE (name);


--
-- TOC entry 6229 (class 2606 OID 2739410)
-- Name: factories factories_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key49 UNIQUE (name);


--
-- TOC entry 6231 (class 2606 OID 2739750)
-- Name: factories factories_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key5 UNIQUE (name);


--
-- TOC entry 6233 (class 2606 OID 2739412)
-- Name: factories factories_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key50 UNIQUE (name);


--
-- TOC entry 6235 (class 2606 OID 2739430)
-- Name: factories factories_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key51 UNIQUE (name);


--
-- TOC entry 6237 (class 2606 OID 2739414)
-- Name: factories factories_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key52 UNIQUE (name);


--
-- TOC entry 6239 (class 2606 OID 2739416)
-- Name: factories factories_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key53 UNIQUE (name);


--
-- TOC entry 6241 (class 2606 OID 2739418)
-- Name: factories factories_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key54 UNIQUE (name);


--
-- TOC entry 6243 (class 2606 OID 2739420)
-- Name: factories factories_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key55 UNIQUE (name);


--
-- TOC entry 6245 (class 2606 OID 2739428)
-- Name: factories factories_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key56 UNIQUE (name);


--
-- TOC entry 6247 (class 2606 OID 2739422)
-- Name: factories factories_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key57 UNIQUE (name);


--
-- TOC entry 6249 (class 2606 OID 2739424)
-- Name: factories factories_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key58 UNIQUE (name);


--
-- TOC entry 6251 (class 2606 OID 2739426)
-- Name: factories factories_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key59 UNIQUE (name);


--
-- TOC entry 6253 (class 2606 OID 2739752)
-- Name: factories factories_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key6 UNIQUE (name);


--
-- TOC entry 6255 (class 2606 OID 2739748)
-- Name: factories factories_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key60 UNIQUE (name);


--
-- TOC entry 6257 (class 2606 OID 2739650)
-- Name: factories factories_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key61 UNIQUE (name);


--
-- TOC entry 6259 (class 2606 OID 2739652)
-- Name: factories factories_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key62 UNIQUE (name);


--
-- TOC entry 6261 (class 2606 OID 2739654)
-- Name: factories factories_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key63 UNIQUE (name);


--
-- TOC entry 6263 (class 2606 OID 2739656)
-- Name: factories factories_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key64 UNIQUE (name);


--
-- TOC entry 6265 (class 2606 OID 2739658)
-- Name: factories factories_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key65 UNIQUE (name);


--
-- TOC entry 6267 (class 2606 OID 2739660)
-- Name: factories factories_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key66 UNIQUE (name);


--
-- TOC entry 6269 (class 2606 OID 2739662)
-- Name: factories factories_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key67 UNIQUE (name);


--
-- TOC entry 6271 (class 2606 OID 2739664)
-- Name: factories factories_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key68 UNIQUE (name);


--
-- TOC entry 6273 (class 2606 OID 2739716)
-- Name: factories factories_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key69 UNIQUE (name);


--
-- TOC entry 6275 (class 2606 OID 2739754)
-- Name: factories factories_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key7 UNIQUE (name);


--
-- TOC entry 6277 (class 2606 OID 2739718)
-- Name: factories factories_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key70 UNIQUE (name);


--
-- TOC entry 6279 (class 2606 OID 2739720)
-- Name: factories factories_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key71 UNIQUE (name);


--
-- TOC entry 6281 (class 2606 OID 2739722)
-- Name: factories factories_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key72 UNIQUE (name);


--
-- TOC entry 6283 (class 2606 OID 2739746)
-- Name: factories factories_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key73 UNIQUE (name);


--
-- TOC entry 6285 (class 2606 OID 2739724)
-- Name: factories factories_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key74 UNIQUE (name);


--
-- TOC entry 6287 (class 2606 OID 2739726)
-- Name: factories factories_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key75 UNIQUE (name);


--
-- TOC entry 6289 (class 2606 OID 2739728)
-- Name: factories factories_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key76 UNIQUE (name);


--
-- TOC entry 6291 (class 2606 OID 2739730)
-- Name: factories factories_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key77 UNIQUE (name);


--
-- TOC entry 6293 (class 2606 OID 2739732)
-- Name: factories factories_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key78 UNIQUE (name);


--
-- TOC entry 6295 (class 2606 OID 2739734)
-- Name: factories factories_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key79 UNIQUE (name);


--
-- TOC entry 6297 (class 2606 OID 2739756)
-- Name: factories factories_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key8 UNIQUE (name);


--
-- TOC entry 6299 (class 2606 OID 2739736)
-- Name: factories factories_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key80 UNIQUE (name);


--
-- TOC entry 6301 (class 2606 OID 2739738)
-- Name: factories factories_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key81 UNIQUE (name);


--
-- TOC entry 6303 (class 2606 OID 2739740)
-- Name: factories factories_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key82 UNIQUE (name);


--
-- TOC entry 6305 (class 2606 OID 2739742)
-- Name: factories factories_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key83 UNIQUE (name);


--
-- TOC entry 6307 (class 2606 OID 2739744)
-- Name: factories factories_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key84 UNIQUE (name);


--
-- TOC entry 6309 (class 2606 OID 2739690)
-- Name: factories factories_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key85 UNIQUE (name);


--
-- TOC entry 6311 (class 2606 OID 2739378)
-- Name: factories factories_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key86 UNIQUE (name);


--
-- TOC entry 6313 (class 2606 OID 2739692)
-- Name: factories factories_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key87 UNIQUE (name);


--
-- TOC entry 6315 (class 2606 OID 2739694)
-- Name: factories factories_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key88 UNIQUE (name);


--
-- TOC entry 6317 (class 2606 OID 2739696)
-- Name: factories factories_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key89 UNIQUE (name);


--
-- TOC entry 6319 (class 2606 OID 2739282)
-- Name: factories factories_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key9 UNIQUE (name);


--
-- TOC entry 6321 (class 2606 OID 2739698)
-- Name: factories factories_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key90 UNIQUE (name);


--
-- TOC entry 6323 (class 2606 OID 2739700)
-- Name: factories factories_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key91 UNIQUE (name);


--
-- TOC entry 6325 (class 2606 OID 2739702)
-- Name: factories factories_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key92 UNIQUE (name);


--
-- TOC entry 6327 (class 2606 OID 2739376)
-- Name: factories factories_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key93 UNIQUE (name);


--
-- TOC entry 6329 (class 2606 OID 2739704)
-- Name: factories factories_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key94 UNIQUE (name);


--
-- TOC entry 6331 (class 2606 OID 2739706)
-- Name: factories factories_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key95 UNIQUE (name);


--
-- TOC entry 6333 (class 2606 OID 2739374)
-- Name: factories factories_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key96 UNIQUE (name);


--
-- TOC entry 6335 (class 2606 OID 2739708)
-- Name: factories factories_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key97 UNIQUE (name);


--
-- TOC entry 6337 (class 2606 OID 2739372)
-- Name: factories factories_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key98 UNIQUE (name);


--
-- TOC entry 6339 (class 2606 OID 2739218)
-- Name: factories factories_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_name_key99 UNIQUE (name);


--
-- TOC entry 6341 (class 2606 OID 1588896)
-- Name: factories factories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factories
    ADD CONSTRAINT factories_pkey PRIMARY KEY (id);


--
-- TOC entry 7131 (class 2606 OID 1588970)
-- Name: ordersProducts ordersProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_pkey" PRIMARY KEY (id);


--
-- TOC entry 7129 (class 2606 OID 1588953)
-- Name: productsIds productsIds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_pkey" PRIMARY KEY ("purchasingOrderId", "productId");


--
-- TOC entry 7125 (class 2606 OID 1588919)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 7127 (class 2606 OID 1588943)
-- Name: purchasingOrders purchasingOrders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders"
    ADD CONSTRAINT "purchasingOrders_pkey" PRIMARY KEY (id);


--
-- TOC entry 6343 (class 2606 OID 2740096)
-- Name: sectors sectors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key UNIQUE (name);


--
-- TOC entry 6345 (class 2606 OID 2740098)
-- Name: sectors sectors_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key1 UNIQUE (name);


--
-- TOC entry 6347 (class 2606 OID 2740354)
-- Name: sectors sectors_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key10 UNIQUE (name);


--
-- TOC entry 6349 (class 2606 OID 2740190)
-- Name: sectors sectors_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key100 UNIQUE (name);


--
-- TOC entry 6351 (class 2606 OID 2739994)
-- Name: sectors sectors_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key101 UNIQUE (name);


--
-- TOC entry 6353 (class 2606 OID 2740192)
-- Name: sectors sectors_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key102 UNIQUE (name);


--
-- TOC entry 6355 (class 2606 OID 2739992)
-- Name: sectors sectors_name_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key103 UNIQUE (name);


--
-- TOC entry 6357 (class 2606 OID 2740194)
-- Name: sectors sectors_name_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key104 UNIQUE (name);


--
-- TOC entry 6359 (class 2606 OID 2740196)
-- Name: sectors sectors_name_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key105 UNIQUE (name);


--
-- TOC entry 6361 (class 2606 OID 2739990)
-- Name: sectors sectors_name_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key106 UNIQUE (name);


--
-- TOC entry 6363 (class 2606 OID 2740274)
-- Name: sectors sectors_name_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key107 UNIQUE (name);


--
-- TOC entry 6365 (class 2606 OID 2739988)
-- Name: sectors sectors_name_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key108 UNIQUE (name);


--
-- TOC entry 6367 (class 2606 OID 2740276)
-- Name: sectors sectors_name_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key109 UNIQUE (name);


--
-- TOC entry 6369 (class 2606 OID 2740356)
-- Name: sectors sectors_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key11 UNIQUE (name);


--
-- TOC entry 6371 (class 2606 OID 2740278)
-- Name: sectors sectors_name_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key110 UNIQUE (name);


--
-- TOC entry 6373 (class 2606 OID 2740280)
-- Name: sectors sectors_name_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key111 UNIQUE (name);


--
-- TOC entry 6375 (class 2606 OID 2740282)
-- Name: sectors sectors_name_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key112 UNIQUE (name);


--
-- TOC entry 6377 (class 2606 OID 2740284)
-- Name: sectors sectors_name_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key113 UNIQUE (name);


--
-- TOC entry 6379 (class 2606 OID 2740286)
-- Name: sectors sectors_name_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key114 UNIQUE (name);


--
-- TOC entry 6381 (class 2606 OID 2739986)
-- Name: sectors sectors_name_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key115 UNIQUE (name);


--
-- TOC entry 6383 (class 2606 OID 2740288)
-- Name: sectors sectors_name_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key116 UNIQUE (name);


--
-- TOC entry 6385 (class 2606 OID 2740290)
-- Name: sectors sectors_name_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key117 UNIQUE (name);


--
-- TOC entry 6387 (class 2606 OID 2740292)
-- Name: sectors sectors_name_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key118 UNIQUE (name);


--
-- TOC entry 6389 (class 2606 OID 2740294)
-- Name: sectors sectors_name_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key119 UNIQUE (name);


--
-- TOC entry 6391 (class 2606 OID 2740358)
-- Name: sectors sectors_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key12 UNIQUE (name);


--
-- TOC entry 6393 (class 2606 OID 2740296)
-- Name: sectors sectors_name_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key120 UNIQUE (name);


--
-- TOC entry 6395 (class 2606 OID 2740298)
-- Name: sectors sectors_name_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key121 UNIQUE (name);


--
-- TOC entry 6397 (class 2606 OID 2740326)
-- Name: sectors sectors_name_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key122 UNIQUE (name);


--
-- TOC entry 6399 (class 2606 OID 2740328)
-- Name: sectors sectors_name_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key123 UNIQUE (name);


--
-- TOC entry 6401 (class 2606 OID 2740060)
-- Name: sectors sectors_name_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key124 UNIQUE (name);


--
-- TOC entry 6403 (class 2606 OID 2740062)
-- Name: sectors sectors_name_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key125 UNIQUE (name);


--
-- TOC entry 6405 (class 2606 OID 2740064)
-- Name: sectors sectors_name_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key126 UNIQUE (name);


--
-- TOC entry 6407 (class 2606 OID 2740066)
-- Name: sectors sectors_name_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key127 UNIQUE (name);


--
-- TOC entry 6409 (class 2606 OID 2740068)
-- Name: sectors sectors_name_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key128 UNIQUE (name);


--
-- TOC entry 6411 (class 2606 OID 2740070)
-- Name: sectors sectors_name_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key129 UNIQUE (name);


--
-- TOC entry 6413 (class 2606 OID 2740360)
-- Name: sectors sectors_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key13 UNIQUE (name);


--
-- TOC entry 6415 (class 2606 OID 2740072)
-- Name: sectors sectors_name_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key130 UNIQUE (name);


--
-- TOC entry 6417 (class 2606 OID 2740074)
-- Name: sectors sectors_name_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key131 UNIQUE (name);


--
-- TOC entry 6419 (class 2606 OID 2740076)
-- Name: sectors sectors_name_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key132 UNIQUE (name);


--
-- TOC entry 6421 (class 2606 OID 2740078)
-- Name: sectors sectors_name_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key133 UNIQUE (name);


--
-- TOC entry 6423 (class 2606 OID 2740080)
-- Name: sectors sectors_name_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key134 UNIQUE (name);


--
-- TOC entry 6425 (class 2606 OID 2740082)
-- Name: sectors sectors_name_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key135 UNIQUE (name);


--
-- TOC entry 6427 (class 2606 OID 2740084)
-- Name: sectors sectors_name_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key136 UNIQUE (name);


--
-- TOC entry 6429 (class 2606 OID 2740086)
-- Name: sectors sectors_name_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key137 UNIQUE (name);


--
-- TOC entry 6431 (class 2606 OID 2740088)
-- Name: sectors sectors_name_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key138 UNIQUE (name);


--
-- TOC entry 6433 (class 2606 OID 2740090)
-- Name: sectors sectors_name_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key139 UNIQUE (name);


--
-- TOC entry 6435 (class 2606 OID 2740362)
-- Name: sectors sectors_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key14 UNIQUE (name);


--
-- TOC entry 6437 (class 2606 OID 2739856)
-- Name: sectors sectors_name_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key140 UNIQUE (name);


--
-- TOC entry 6439 (class 2606 OID 2739858)
-- Name: sectors sectors_name_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key141 UNIQUE (name);


--
-- TOC entry 6441 (class 2606 OID 2739860)
-- Name: sectors sectors_name_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key142 UNIQUE (name);


--
-- TOC entry 6443 (class 2606 OID 2739862)
-- Name: sectors sectors_name_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key143 UNIQUE (name);


--
-- TOC entry 6445 (class 2606 OID 2739984)
-- Name: sectors sectors_name_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key144 UNIQUE (name);


--
-- TOC entry 6447 (class 2606 OID 2739864)
-- Name: sectors sectors_name_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key145 UNIQUE (name);


--
-- TOC entry 6449 (class 2606 OID 2739866)
-- Name: sectors sectors_name_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key146 UNIQUE (name);


--
-- TOC entry 6451 (class 2606 OID 2739868)
-- Name: sectors sectors_name_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key147 UNIQUE (name);


--
-- TOC entry 6453 (class 2606 OID 2739870)
-- Name: sectors sectors_name_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key148 UNIQUE (name);


--
-- TOC entry 6455 (class 2606 OID 2739872)
-- Name: sectors sectors_name_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key149 UNIQUE (name);


--
-- TOC entry 6457 (class 2606 OID 2740364)
-- Name: sectors sectors_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key15 UNIQUE (name);


--
-- TOC entry 6459 (class 2606 OID 2739982)
-- Name: sectors sectors_name_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key150 UNIQUE (name);


--
-- TOC entry 6461 (class 2606 OID 2739874)
-- Name: sectors sectors_name_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key151 UNIQUE (name);


--
-- TOC entry 6463 (class 2606 OID 2739876)
-- Name: sectors sectors_name_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key152 UNIQUE (name);


--
-- TOC entry 6465 (class 2606 OID 2739950)
-- Name: sectors sectors_name_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key153 UNIQUE (name);


--
-- TOC entry 6467 (class 2606 OID 2739952)
-- Name: sectors sectors_name_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key154 UNIQUE (name);


--
-- TOC entry 6469 (class 2606 OID 2739980)
-- Name: sectors sectors_name_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key155 UNIQUE (name);


--
-- TOC entry 6471 (class 2606 OID 2739954)
-- Name: sectors sectors_name_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key156 UNIQUE (name);


--
-- TOC entry 6473 (class 2606 OID 2739956)
-- Name: sectors sectors_name_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key157 UNIQUE (name);


--
-- TOC entry 6475 (class 2606 OID 2739958)
-- Name: sectors sectors_name_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key158 UNIQUE (name);


--
-- TOC entry 6477 (class 2606 OID 2739960)
-- Name: sectors sectors_name_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key159 UNIQUE (name);


--
-- TOC entry 6479 (class 2606 OID 2740366)
-- Name: sectors sectors_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key16 UNIQUE (name);


--
-- TOC entry 6481 (class 2606 OID 2739962)
-- Name: sectors sectors_name_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key160 UNIQUE (name);


--
-- TOC entry 6483 (class 2606 OID 2739878)
-- Name: sectors sectors_name_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key161 UNIQUE (name);


--
-- TOC entry 6485 (class 2606 OID 2739880)
-- Name: sectors sectors_name_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key162 UNIQUE (name);


--
-- TOC entry 6487 (class 2606 OID 2739882)
-- Name: sectors sectors_name_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key163 UNIQUE (name);


--
-- TOC entry 6489 (class 2606 OID 2739884)
-- Name: sectors sectors_name_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key164 UNIQUE (name);


--
-- TOC entry 6491 (class 2606 OID 2739978)
-- Name: sectors sectors_name_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key165 UNIQUE (name);


--
-- TOC entry 6493 (class 2606 OID 2739886)
-- Name: sectors sectors_name_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key166 UNIQUE (name);


--
-- TOC entry 6495 (class 2606 OID 2739888)
-- Name: sectors sectors_name_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key167 UNIQUE (name);


--
-- TOC entry 6497 (class 2606 OID 2739890)
-- Name: sectors sectors_name_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key168 UNIQUE (name);


--
-- TOC entry 6499 (class 2606 OID 2739892)
-- Name: sectors sectors_name_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key169 UNIQUE (name);


--
-- TOC entry 6501 (class 2606 OID 2740094)
-- Name: sectors sectors_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key17 UNIQUE (name);


--
-- TOC entry 6503 (class 2606 OID 2739894)
-- Name: sectors sectors_name_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key170 UNIQUE (name);


--
-- TOC entry 6505 (class 2606 OID 2739976)
-- Name: sectors sectors_name_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key171 UNIQUE (name);


--
-- TOC entry 6507 (class 2606 OID 2739896)
-- Name: sectors sectors_name_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key172 UNIQUE (name);


--
-- TOC entry 6509 (class 2606 OID 2739898)
-- Name: sectors sectors_name_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key173 UNIQUE (name);


--
-- TOC entry 6511 (class 2606 OID 2739900)
-- Name: sectors sectors_name_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key174 UNIQUE (name);


--
-- TOC entry 6513 (class 2606 OID 2739902)
-- Name: sectors sectors_name_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key175 UNIQUE (name);


--
-- TOC entry 6515 (class 2606 OID 2739904)
-- Name: sectors sectors_name_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key176 UNIQUE (name);


--
-- TOC entry 6517 (class 2606 OID 2740532)
-- Name: sectors sectors_name_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key177 UNIQUE (name);


--
-- TOC entry 6519 (class 2606 OID 2740534)
-- Name: sectors sectors_name_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key178 UNIQUE (name);


--
-- TOC entry 6521 (class 2606 OID 2740536)
-- Name: sectors sectors_name_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key179 UNIQUE (name);


--
-- TOC entry 6523 (class 2606 OID 2740368)
-- Name: sectors sectors_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key18 UNIQUE (name);


--
-- TOC entry 6525 (class 2606 OID 2740538)
-- Name: sectors sectors_name_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key180 UNIQUE (name);


--
-- TOC entry 6527 (class 2606 OID 2740540)
-- Name: sectors sectors_name_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key181 UNIQUE (name);


--
-- TOC entry 6529 (class 2606 OID 2740542)
-- Name: sectors sectors_name_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key182 UNIQUE (name);


--
-- TOC entry 6531 (class 2606 OID 2740544)
-- Name: sectors sectors_name_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key183 UNIQUE (name);


--
-- TOC entry 6533 (class 2606 OID 2740546)
-- Name: sectors sectors_name_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key184 UNIQUE (name);


--
-- TOC entry 6535 (class 2606 OID 2739974)
-- Name: sectors sectors_name_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key185 UNIQUE (name);


--
-- TOC entry 6537 (class 2606 OID 2740548)
-- Name: sectors sectors_name_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key186 UNIQUE (name);


--
-- TOC entry 6539 (class 2606 OID 2739810)
-- Name: sectors sectors_name_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key187 UNIQUE (name);


--
-- TOC entry 6541 (class 2606 OID 2739812)
-- Name: sectors sectors_name_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key188 UNIQUE (name);


--
-- TOC entry 6543 (class 2606 OID 2739814)
-- Name: sectors sectors_name_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key189 UNIQUE (name);


--
-- TOC entry 6545 (class 2606 OID 2740370)
-- Name: sectors sectors_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key19 UNIQUE (name);


--
-- TOC entry 6547 (class 2606 OID 2739794)
-- Name: sectors sectors_name_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key190 UNIQUE (name);


--
-- TOC entry 6549 (class 2606 OID 2739796)
-- Name: sectors sectors_name_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key191 UNIQUE (name);


--
-- TOC entry 6551 (class 2606 OID 2739798)
-- Name: sectors sectors_name_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key192 UNIQUE (name);


--
-- TOC entry 6553 (class 2606 OID 2739972)
-- Name: sectors sectors_name_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key193 UNIQUE (name);


--
-- TOC entry 6555 (class 2606 OID 2739800)
-- Name: sectors sectors_name_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key194 UNIQUE (name);


--
-- TOC entry 6557 (class 2606 OID 2739802)
-- Name: sectors sectors_name_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key195 UNIQUE (name);


--
-- TOC entry 6559 (class 2606 OID 2739804)
-- Name: sectors sectors_name_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key196 UNIQUE (name);


--
-- TOC entry 6561 (class 2606 OID 2739966)
-- Name: sectors sectors_name_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key197 UNIQUE (name);


--
-- TOC entry 6563 (class 2606 OID 2739968)
-- Name: sectors sectors_name_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key198 UNIQUE (name);


--
-- TOC entry 6565 (class 2606 OID 2739970)
-- Name: sectors sectors_name_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key199 UNIQUE (name);


--
-- TOC entry 6567 (class 2606 OID 2740100)
-- Name: sectors sectors_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key2 UNIQUE (name);


--
-- TOC entry 6569 (class 2606 OID 2740372)
-- Name: sectors sectors_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key20 UNIQUE (name);


--
-- TOC entry 6571 (class 2606 OID 2740058)
-- Name: sectors sectors_name_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key200 UNIQUE (name);


--
-- TOC entry 6573 (class 2606 OID 2740330)
-- Name: sectors sectors_name_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key201 UNIQUE (name);


--
-- TOC entry 6575 (class 2606 OID 2740332)
-- Name: sectors sectors_name_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key202 UNIQUE (name);


--
-- TOC entry 6577 (class 2606 OID 2740334)
-- Name: sectors sectors_name_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key203 UNIQUE (name);


--
-- TOC entry 6579 (class 2606 OID 2740018)
-- Name: sectors sectors_name_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key204 UNIQUE (name);


--
-- TOC entry 6581 (class 2606 OID 2740056)
-- Name: sectors sectors_name_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key205 UNIQUE (name);


--
-- TOC entry 6583 (class 2606 OID 2740020)
-- Name: sectors sectors_name_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key206 UNIQUE (name);


--
-- TOC entry 6585 (class 2606 OID 2740022)
-- Name: sectors sectors_name_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key207 UNIQUE (name);


--
-- TOC entry 6587 (class 2606 OID 2740024)
-- Name: sectors sectors_name_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key208 UNIQUE (name);


--
-- TOC entry 6589 (class 2606 OID 2740026)
-- Name: sectors sectors_name_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key209 UNIQUE (name);


--
-- TOC entry 6591 (class 2606 OID 2740092)
-- Name: sectors sectors_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key21 UNIQUE (name);


--
-- TOC entry 6593 (class 2606 OID 2740054)
-- Name: sectors sectors_name_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key210 UNIQUE (name);


--
-- TOC entry 6595 (class 2606 OID 2740028)
-- Name: sectors sectors_name_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key211 UNIQUE (name);


--
-- TOC entry 6597 (class 2606 OID 2740030)
-- Name: sectors sectors_name_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key212 UNIQUE (name);


--
-- TOC entry 6599 (class 2606 OID 2740032)
-- Name: sectors sectors_name_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key213 UNIQUE (name);


--
-- TOC entry 6601 (class 2606 OID 2740034)
-- Name: sectors sectors_name_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key214 UNIQUE (name);


--
-- TOC entry 6603 (class 2606 OID 2740052)
-- Name: sectors sectors_name_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key215 UNIQUE (name);


--
-- TOC entry 6605 (class 2606 OID 2740036)
-- Name: sectors sectors_name_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key216 UNIQUE (name);


--
-- TOC entry 6607 (class 2606 OID 2740038)
-- Name: sectors sectors_name_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key217 UNIQUE (name);


--
-- TOC entry 6609 (class 2606 OID 2740040)
-- Name: sectors sectors_name_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key218 UNIQUE (name);


--
-- TOC entry 6611 (class 2606 OID 2740042)
-- Name: sectors sectors_name_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key219 UNIQUE (name);


--
-- TOC entry 6613 (class 2606 OID 2740374)
-- Name: sectors sectors_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key22 UNIQUE (name);


--
-- TOC entry 6615 (class 2606 OID 2740050)
-- Name: sectors sectors_name_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key220 UNIQUE (name);


--
-- TOC entry 6617 (class 2606 OID 2740044)
-- Name: sectors sectors_name_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key221 UNIQUE (name);


--
-- TOC entry 6619 (class 2606 OID 2740046)
-- Name: sectors sectors_name_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key222 UNIQUE (name);


--
-- TOC entry 6621 (class 2606 OID 2740048)
-- Name: sectors sectors_name_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key223 UNIQUE (name);


--
-- TOC entry 6623 (class 2606 OID 2740336)
-- Name: sectors sectors_name_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key224 UNIQUE (name);


--
-- TOC entry 6625 (class 2606 OID 2740016)
-- Name: sectors sectors_name_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key225 UNIQUE (name);


--
-- TOC entry 6627 (class 2606 OID 2740338)
-- Name: sectors sectors_name_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key226 UNIQUE (name);


--
-- TOC entry 6629 (class 2606 OID 2740012)
-- Name: sectors sectors_name_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key227 UNIQUE (name);


--
-- TOC entry 6631 (class 2606 OID 2740340)
-- Name: sectors sectors_name_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key228 UNIQUE (name);


--
-- TOC entry 6633 (class 2606 OID 2740342)
-- Name: sectors sectors_name_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key229 UNIQUE (name);


--
-- TOC entry 6635 (class 2606 OID 2740112)
-- Name: sectors sectors_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key23 UNIQUE (name);


--
-- TOC entry 6637 (class 2606 OID 2740344)
-- Name: sectors sectors_name_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key230 UNIQUE (name);


--
-- TOC entry 6639 (class 2606 OID 2740346)
-- Name: sectors sectors_name_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key231 UNIQUE (name);


--
-- TOC entry 6641 (class 2606 OID 2740348)
-- Name: sectors sectors_name_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key232 UNIQUE (name);


--
-- TOC entry 6643 (class 2606 OID 2740530)
-- Name: sectors sectors_name_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key233 UNIQUE (name);


--
-- TOC entry 6645 (class 2606 OID 2740520)
-- Name: sectors sectors_name_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key234 UNIQUE (name);


--
-- TOC entry 6647 (class 2606 OID 2740522)
-- Name: sectors sectors_name_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key235 UNIQUE (name);


--
-- TOC entry 6649 (class 2606 OID 2740524)
-- Name: sectors sectors_name_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key236 UNIQUE (name);


--
-- TOC entry 6651 (class 2606 OID 2740526)
-- Name: sectors sectors_name_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key237 UNIQUE (name);


--
-- TOC entry 6653 (class 2606 OID 2740528)
-- Name: sectors sectors_name_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key238 UNIQUE (name);


--
-- TOC entry 6655 (class 2606 OID 2740492)
-- Name: sectors sectors_name_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key239 UNIQUE (name);


--
-- TOC entry 6657 (class 2606 OID 2739934)
-- Name: sectors sectors_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key24 UNIQUE (name);


--
-- TOC entry 6659 (class 2606 OID 2740494)
-- Name: sectors sectors_name_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key240 UNIQUE (name);


--
-- TOC entry 6661 (class 2606 OID 2740518)
-- Name: sectors sectors_name_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key241 UNIQUE (name);


--
-- TOC entry 6663 (class 2606 OID 2740498)
-- Name: sectors sectors_name_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key242 UNIQUE (name);


--
-- TOC entry 6665 (class 2606 OID 2740500)
-- Name: sectors sectors_name_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key243 UNIQUE (name);


--
-- TOC entry 6667 (class 2606 OID 2740502)
-- Name: sectors sectors_name_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key244 UNIQUE (name);


--
-- TOC entry 6669 (class 2606 OID 2740504)
-- Name: sectors sectors_name_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key245 UNIQUE (name);


--
-- TOC entry 6671 (class 2606 OID 2740516)
-- Name: sectors sectors_name_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key246 UNIQUE (name);


--
-- TOC entry 6673 (class 2606 OID 2740506)
-- Name: sectors sectors_name_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key247 UNIQUE (name);


--
-- TOC entry 6675 (class 2606 OID 2740508)
-- Name: sectors sectors_name_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key248 UNIQUE (name);


--
-- TOC entry 6677 (class 2606 OID 2740510)
-- Name: sectors sectors_name_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key249 UNIQUE (name);


--
-- TOC entry 6679 (class 2606 OID 2740114)
-- Name: sectors sectors_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key25 UNIQUE (name);


--
-- TOC entry 6681 (class 2606 OID 2740512)
-- Name: sectors sectors_name_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key250 UNIQUE (name);


--
-- TOC entry 6683 (class 2606 OID 2740514)
-- Name: sectors sectors_name_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key251 UNIQUE (name);


--
-- TOC entry 6685 (class 2606 OID 2740496)
-- Name: sectors sectors_name_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key252 UNIQUE (name);


--
-- TOC entry 6687 (class 2606 OID 2740300)
-- Name: sectors sectors_name_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key253 UNIQUE (name);


--
-- TOC entry 6689 (class 2606 OID 2740302)
-- Name: sectors sectors_name_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key254 UNIQUE (name);


--
-- TOC entry 6691 (class 2606 OID 2740304)
-- Name: sectors sectors_name_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key255 UNIQUE (name);


--
-- TOC entry 6693 (class 2606 OID 2740324)
-- Name: sectors sectors_name_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key256 UNIQUE (name);


--
-- TOC entry 6695 (class 2606 OID 2740306)
-- Name: sectors sectors_name_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key257 UNIQUE (name);


--
-- TOC entry 6697 (class 2606 OID 2740308)
-- Name: sectors sectors_name_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key258 UNIQUE (name);


--
-- TOC entry 6699 (class 2606 OID 2740322)
-- Name: sectors sectors_name_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key259 UNIQUE (name);


--
-- TOC entry 6701 (class 2606 OID 2740116)
-- Name: sectors sectors_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key26 UNIQUE (name);


--
-- TOC entry 6703 (class 2606 OID 2740310)
-- Name: sectors sectors_name_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key260 UNIQUE (name);


--
-- TOC entry 6705 (class 2606 OID 2740312)
-- Name: sectors sectors_name_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key261 UNIQUE (name);


--
-- TOC entry 6707 (class 2606 OID 2740314)
-- Name: sectors sectors_name_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key262 UNIQUE (name);


--
-- TOC entry 6709 (class 2606 OID 2740316)
-- Name: sectors sectors_name_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key263 UNIQUE (name);


--
-- TOC entry 6711 (class 2606 OID 2740318)
-- Name: sectors sectors_name_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key264 UNIQUE (name);


--
-- TOC entry 6713 (class 2606 OID 2740320)
-- Name: sectors sectors_name_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key265 UNIQUE (name);


--
-- TOC entry 6715 (class 2606 OID 2740272)
-- Name: sectors sectors_name_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key266 UNIQUE (name);


--
-- TOC entry 6717 (class 2606 OID 2740198)
-- Name: sectors sectors_name_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key267 UNIQUE (name);


--
-- TOC entry 6719 (class 2606 OID 2740200)
-- Name: sectors sectors_name_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key268 UNIQUE (name);


--
-- TOC entry 6721 (class 2606 OID 2740202)
-- Name: sectors sectors_name_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key269 UNIQUE (name);


--
-- TOC entry 6723 (class 2606 OID 2740120)
-- Name: sectors sectors_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key27 UNIQUE (name);


--
-- TOC entry 6725 (class 2606 OID 2740270)
-- Name: sectors sectors_name_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key270 UNIQUE (name);


--
-- TOC entry 6727 (class 2606 OID 2740262)
-- Name: sectors sectors_name_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key271 UNIQUE (name);


--
-- TOC entry 6729 (class 2606 OID 2740264)
-- Name: sectors sectors_name_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key272 UNIQUE (name);


--
-- TOC entry 6731 (class 2606 OID 2740266)
-- Name: sectors sectors_name_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key273 UNIQUE (name);


--
-- TOC entry 6733 (class 2606 OID 2740268)
-- Name: sectors sectors_name_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key274 UNIQUE (name);


--
-- TOC entry 6735 (class 2606 OID 2740376)
-- Name: sectors sectors_name_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key275 UNIQUE (name);


--
-- TOC entry 6737 (class 2606 OID 2740378)
-- Name: sectors sectors_name_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key276 UNIQUE (name);


--
-- TOC entry 6739 (class 2606 OID 2739792)
-- Name: sectors sectors_name_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key277 UNIQUE (name);


--
-- TOC entry 6741 (class 2606 OID 2740380)
-- Name: sectors sectors_name_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key278 UNIQUE (name);


--
-- TOC entry 6743 (class 2606 OID 2740382)
-- Name: sectors sectors_name_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key279 UNIQUE (name);


--
-- TOC entry 6745 (class 2606 OID 2739932)
-- Name: sectors sectors_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key28 UNIQUE (name);


--
-- TOC entry 6747 (class 2606 OID 2740384)
-- Name: sectors sectors_name_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key280 UNIQUE (name);


--
-- TOC entry 6749 (class 2606 OID 2740386)
-- Name: sectors sectors_name_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key281 UNIQUE (name);


--
-- TOC entry 6751 (class 2606 OID 2739964)
-- Name: sectors sectors_name_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key282 UNIQUE (name);


--
-- TOC entry 6753 (class 2606 OID 2740388)
-- Name: sectors sectors_name_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key283 UNIQUE (name);


--
-- TOC entry 6755 (class 2606 OID 2740390)
-- Name: sectors sectors_name_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key284 UNIQUE (name);


--
-- TOC entry 6757 (class 2606 OID 2740392)
-- Name: sectors sectors_name_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key285 UNIQUE (name);


--
-- TOC entry 6759 (class 2606 OID 2740394)
-- Name: sectors sectors_name_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key286 UNIQUE (name);


--
-- TOC entry 6761 (class 2606 OID 2740396)
-- Name: sectors sectors_name_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key287 UNIQUE (name);


--
-- TOC entry 6763 (class 2606 OID 2740398)
-- Name: sectors sectors_name_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key288 UNIQUE (name);


--
-- TOC entry 6765 (class 2606 OID 2740400)
-- Name: sectors sectors_name_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key289 UNIQUE (name);


--
-- TOC entry 6767 (class 2606 OID 2740122)
-- Name: sectors sectors_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key29 UNIQUE (name);


--
-- TOC entry 6769 (class 2606 OID 2740402)
-- Name: sectors sectors_name_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key290 UNIQUE (name);


--
-- TOC entry 6771 (class 2606 OID 2740404)
-- Name: sectors sectors_name_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key291 UNIQUE (name);


--
-- TOC entry 6773 (class 2606 OID 2739948)
-- Name: sectors sectors_name_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key292 UNIQUE (name);


--
-- TOC entry 6775 (class 2606 OID 2740406)
-- Name: sectors sectors_name_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key293 UNIQUE (name);


--
-- TOC entry 6777 (class 2606 OID 2740408)
-- Name: sectors sectors_name_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key294 UNIQUE (name);


--
-- TOC entry 6779 (class 2606 OID 2740410)
-- Name: sectors sectors_name_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key295 UNIQUE (name);


--
-- TOC entry 6781 (class 2606 OID 2739946)
-- Name: sectors sectors_name_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key296 UNIQUE (name);


--
-- TOC entry 6783 (class 2606 OID 2740412)
-- Name: sectors sectors_name_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key297 UNIQUE (name);


--
-- TOC entry 6785 (class 2606 OID 2740414)
-- Name: sectors sectors_name_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key298 UNIQUE (name);


--
-- TOC entry 6787 (class 2606 OID 2740416)
-- Name: sectors sectors_name_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key299 UNIQUE (name);


--
-- TOC entry 6789 (class 2606 OID 2740102)
-- Name: sectors sectors_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key3 UNIQUE (name);


--
-- TOC entry 6791 (class 2606 OID 2739930)
-- Name: sectors sectors_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key30 UNIQUE (name);


--
-- TOC entry 6793 (class 2606 OID 2740418)
-- Name: sectors sectors_name_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key300 UNIQUE (name);


--
-- TOC entry 6795 (class 2606 OID 2740420)
-- Name: sectors sectors_name_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key301 UNIQUE (name);


--
-- TOC entry 6797 (class 2606 OID 2740422)
-- Name: sectors sectors_name_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key302 UNIQUE (name);


--
-- TOC entry 6799 (class 2606 OID 2740424)
-- Name: sectors sectors_name_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key303 UNIQUE (name);


--
-- TOC entry 6801 (class 2606 OID 2740426)
-- Name: sectors sectors_name_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key304 UNIQUE (name);


--
-- TOC entry 6803 (class 2606 OID 2740428)
-- Name: sectors sectors_name_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key305 UNIQUE (name);


--
-- TOC entry 6805 (class 2606 OID 2740430)
-- Name: sectors sectors_name_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key306 UNIQUE (name);


--
-- TOC entry 6807 (class 2606 OID 2739944)
-- Name: sectors sectors_name_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key307 UNIQUE (name);


--
-- TOC entry 6809 (class 2606 OID 2740432)
-- Name: sectors sectors_name_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key308 UNIQUE (name);


--
-- TOC entry 6811 (class 2606 OID 2740434)
-- Name: sectors sectors_name_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key309 UNIQUE (name);


--
-- TOC entry 6813 (class 2606 OID 2740124)
-- Name: sectors sectors_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key31 UNIQUE (name);


--
-- TOC entry 6815 (class 2606 OID 2740436)
-- Name: sectors sectors_name_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key310 UNIQUE (name);


--
-- TOC entry 6817 (class 2606 OID 2740438)
-- Name: sectors sectors_name_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key311 UNIQUE (name);


--
-- TOC entry 6819 (class 2606 OID 2740440)
-- Name: sectors sectors_name_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key312 UNIQUE (name);


--
-- TOC entry 6821 (class 2606 OID 2739942)
-- Name: sectors sectors_name_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key313 UNIQUE (name);


--
-- TOC entry 6823 (class 2606 OID 2740442)
-- Name: sectors sectors_name_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key314 UNIQUE (name);


--
-- TOC entry 6825 (class 2606 OID 2740444)
-- Name: sectors sectors_name_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key315 UNIQUE (name);


--
-- TOC entry 6827 (class 2606 OID 2740446)
-- Name: sectors sectors_name_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key316 UNIQUE (name);


--
-- TOC entry 6829 (class 2606 OID 2740448)
-- Name: sectors sectors_name_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key317 UNIQUE (name);


--
-- TOC entry 6831 (class 2606 OID 2740450)
-- Name: sectors sectors_name_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key318 UNIQUE (name);


--
-- TOC entry 6833 (class 2606 OID 2740452)
-- Name: sectors sectors_name_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key319 UNIQUE (name);


--
-- TOC entry 6835 (class 2606 OID 2740126)
-- Name: sectors sectors_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key32 UNIQUE (name);


--
-- TOC entry 6837 (class 2606 OID 2740454)
-- Name: sectors sectors_name_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key320 UNIQUE (name);


--
-- TOC entry 6839 (class 2606 OID 2739940)
-- Name: sectors sectors_name_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key321 UNIQUE (name);


--
-- TOC entry 6841 (class 2606 OID 2740456)
-- Name: sectors sectors_name_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key322 UNIQUE (name);


--
-- TOC entry 6843 (class 2606 OID 2740458)
-- Name: sectors sectors_name_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key323 UNIQUE (name);


--
-- TOC entry 6845 (class 2606 OID 2740460)
-- Name: sectors sectors_name_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key324 UNIQUE (name);


--
-- TOC entry 6847 (class 2606 OID 2740462)
-- Name: sectors sectors_name_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key325 UNIQUE (name);


--
-- TOC entry 6849 (class 2606 OID 2739938)
-- Name: sectors sectors_name_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key326 UNIQUE (name);


--
-- TOC entry 6851 (class 2606 OID 2739820)
-- Name: sectors sectors_name_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key327 UNIQUE (name);


--
-- TOC entry 6853 (class 2606 OID 2739822)
-- Name: sectors sectors_name_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key328 UNIQUE (name);


--
-- TOC entry 6855 (class 2606 OID 2739936)
-- Name: sectors sectors_name_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key329 UNIQUE (name);


--
-- TOC entry 6857 (class 2606 OID 2740128)
-- Name: sectors sectors_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key33 UNIQUE (name);


--
-- TOC entry 6859 (class 2606 OID 2739824)
-- Name: sectors sectors_name_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key330 UNIQUE (name);


--
-- TOC entry 6861 (class 2606 OID 2739826)
-- Name: sectors sectors_name_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key331 UNIQUE (name);


--
-- TOC entry 6863 (class 2606 OID 2739828)
-- Name: sectors sectors_name_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key332 UNIQUE (name);


--
-- TOC entry 6865 (class 2606 OID 2739854)
-- Name: sectors sectors_name_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key333 UNIQUE (name);


--
-- TOC entry 6867 (class 2606 OID 2739830)
-- Name: sectors sectors_name_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key334 UNIQUE (name);


--
-- TOC entry 6869 (class 2606 OID 2739832)
-- Name: sectors sectors_name_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key335 UNIQUE (name);


--
-- TOC entry 6871 (class 2606 OID 2739852)
-- Name: sectors sectors_name_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key336 UNIQUE (name);


--
-- TOC entry 6873 (class 2606 OID 2739834)
-- Name: sectors sectors_name_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key337 UNIQUE (name);


--
-- TOC entry 6875 (class 2606 OID 2739850)
-- Name: sectors sectors_name_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key338 UNIQUE (name);


--
-- TOC entry 6877 (class 2606 OID 2739836)
-- Name: sectors sectors_name_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key339 UNIQUE (name);


--
-- TOC entry 6879 (class 2606 OID 2740130)
-- Name: sectors sectors_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key34 UNIQUE (name);


--
-- TOC entry 6881 (class 2606 OID 2739838)
-- Name: sectors sectors_name_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key340 UNIQUE (name);


--
-- TOC entry 6883 (class 2606 OID 2739840)
-- Name: sectors sectors_name_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key341 UNIQUE (name);


--
-- TOC entry 6885 (class 2606 OID 2739848)
-- Name: sectors sectors_name_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key342 UNIQUE (name);


--
-- TOC entry 6887 (class 2606 OID 2739842)
-- Name: sectors sectors_name_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key343 UNIQUE (name);


--
-- TOC entry 6889 (class 2606 OID 2739844)
-- Name: sectors sectors_name_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key344 UNIQUE (name);


--
-- TOC entry 6891 (class 2606 OID 2739846)
-- Name: sectors sectors_name_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key345 UNIQUE (name);


--
-- TOC entry 6893 (class 2606 OID 2740140)
-- Name: sectors sectors_name_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key346 UNIQUE (name);


--
-- TOC entry 6895 (class 2606 OID 2740142)
-- Name: sectors sectors_name_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key347 UNIQUE (name);


--
-- TOC entry 6897 (class 2606 OID 2740144)
-- Name: sectors sectors_name_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key348 UNIQUE (name);


--
-- TOC entry 6899 (class 2606 OID 2740146)
-- Name: sectors sectors_name_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key349 UNIQUE (name);


--
-- TOC entry 6901 (class 2606 OID 2740132)
-- Name: sectors sectors_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key35 UNIQUE (name);


--
-- TOC entry 6903 (class 2606 OID 2740466)
-- Name: sectors sectors_name_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key350 UNIQUE (name);


--
-- TOC entry 6905 (class 2606 OID 2740148)
-- Name: sectors sectors_name_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key351 UNIQUE (name);


--
-- TOC entry 6907 (class 2606 OID 2740150)
-- Name: sectors sectors_name_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key352 UNIQUE (name);


--
-- TOC entry 6909 (class 2606 OID 2740152)
-- Name: sectors sectors_name_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key353 UNIQUE (name);


--
-- TOC entry 6911 (class 2606 OID 2740154)
-- Name: sectors sectors_name_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key354 UNIQUE (name);


--
-- TOC entry 6913 (class 2606 OID 2740156)
-- Name: sectors sectors_name_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key355 UNIQUE (name);


--
-- TOC entry 6915 (class 2606 OID 2740464)
-- Name: sectors sectors_name_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key356 UNIQUE (name);


--
-- TOC entry 6917 (class 2606 OID 2740158)
-- Name: sectors sectors_name_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key357 UNIQUE (name);


--
-- TOC entry 6919 (class 2606 OID 2740160)
-- Name: sectors sectors_name_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key358 UNIQUE (name);


--
-- TOC entry 6921 (class 2606 OID 2740162)
-- Name: sectors sectors_name_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key359 UNIQUE (name);


--
-- TOC entry 6923 (class 2606 OID 2740134)
-- Name: sectors sectors_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key36 UNIQUE (name);


--
-- TOC entry 6925 (class 2606 OID 2740206)
-- Name: sectors sectors_name_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key360 UNIQUE (name);


--
-- TOC entry 6927 (class 2606 OID 2740164)
-- Name: sectors sectors_name_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key361 UNIQUE (name);


--
-- TOC entry 6929 (class 2606 OID 2740166)
-- Name: sectors sectors_name_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key362 UNIQUE (name);


--
-- TOC entry 6931 (class 2606 OID 2740168)
-- Name: sectors sectors_name_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key363 UNIQUE (name);


--
-- TOC entry 6933 (class 2606 OID 2740170)
-- Name: sectors sectors_name_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key364 UNIQUE (name);


--
-- TOC entry 6935 (class 2606 OID 2740172)
-- Name: sectors sectors_name_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key365 UNIQUE (name);


--
-- TOC entry 6937 (class 2606 OID 2740174)
-- Name: sectors sectors_name_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key366 UNIQUE (name);


--
-- TOC entry 6939 (class 2606 OID 2740176)
-- Name: sectors sectors_name_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key367 UNIQUE (name);


--
-- TOC entry 6941 (class 2606 OID 2740204)
-- Name: sectors sectors_name_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key368 UNIQUE (name);


--
-- TOC entry 6943 (class 2606 OID 2740178)
-- Name: sectors sectors_name_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key369 UNIQUE (name);


--
-- TOC entry 6945 (class 2606 OID 2740136)
-- Name: sectors sectors_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key37 UNIQUE (name);


--
-- TOC entry 6947 (class 2606 OID 2740188)
-- Name: sectors sectors_name_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key370 UNIQUE (name);


--
-- TOC entry 6949 (class 2606 OID 2740180)
-- Name: sectors sectors_name_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key371 UNIQUE (name);


--
-- TOC entry 6951 (class 2606 OID 2740186)
-- Name: sectors sectors_name_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key372 UNIQUE (name);


--
-- TOC entry 6953 (class 2606 OID 2740118)
-- Name: sectors sectors_name_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key373 UNIQUE (name);


--
-- TOC entry 6955 (class 2606 OID 2740184)
-- Name: sectors sectors_name_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key374 UNIQUE (name);


--
-- TOC entry 6957 (class 2606 OID 2740014)
-- Name: sectors sectors_name_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key375 UNIQUE (name);


--
-- TOC entry 6959 (class 2606 OID 2740182)
-- Name: sectors sectors_name_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key376 UNIQUE (name);


--
-- TOC entry 6961 (class 2606 OID 2740550)
-- Name: sectors sectors_name_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key377 UNIQUE (name);


--
-- TOC entry 6963 (class 2606 OID 2739808)
-- Name: sectors sectors_name_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key378 UNIQUE (name);


--
-- TOC entry 6965 (class 2606 OID 2739806)
-- Name: sectors sectors_name_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key379 UNIQUE (name);


--
-- TOC entry 6967 (class 2606 OID 2740138)
-- Name: sectors sectors_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key38 UNIQUE (name);


--
-- TOC entry 6969 (class 2606 OID 2740552)
-- Name: sectors sectors_name_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key380 UNIQUE (name);


--
-- TOC entry 6971 (class 2606 OID 2740554)
-- Name: sectors sectors_name_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key381 UNIQUE (name);


--
-- TOC entry 6973 (class 2606 OID 2740556)
-- Name: sectors sectors_name_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key382 UNIQUE (name);


--
-- TOC entry 6975 (class 2606 OID 2740558)
-- Name: sectors sectors_name_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key383 UNIQUE (name);


--
-- TOC entry 6977 (class 2606 OID 2739790)
-- Name: sectors sectors_name_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key384 UNIQUE (name);


--
-- TOC entry 6979 (class 2606 OID 2740560)
-- Name: sectors sectors_name_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key385 UNIQUE (name);


--
-- TOC entry 6981 (class 2606 OID 2740562)
-- Name: sectors sectors_name_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key386 UNIQUE (name);


--
-- TOC entry 6983 (class 2606 OID 2740564)
-- Name: sectors sectors_name_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key387 UNIQUE (name);


--
-- TOC entry 6985 (class 2606 OID 2740566)
-- Name: sectors sectors_name_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key388 UNIQUE (name);


--
-- TOC entry 6987 (class 2606 OID 2739788)
-- Name: sectors sectors_name_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key389 UNIQUE (name);


--
-- TOC entry 6989 (class 2606 OID 2740468)
-- Name: sectors sectors_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key39 UNIQUE (name);


--
-- TOC entry 6991 (class 2606 OID 2740104)
-- Name: sectors sectors_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key4 UNIQUE (name);


--
-- TOC entry 6993 (class 2606 OID 2740470)
-- Name: sectors sectors_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key40 UNIQUE (name);


--
-- TOC entry 6995 (class 2606 OID 2740472)
-- Name: sectors sectors_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key41 UNIQUE (name);


--
-- TOC entry 6997 (class 2606 OID 2740474)
-- Name: sectors sectors_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key42 UNIQUE (name);


--
-- TOC entry 6999 (class 2606 OID 2740476)
-- Name: sectors sectors_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key43 UNIQUE (name);


--
-- TOC entry 7001 (class 2606 OID 2740478)
-- Name: sectors sectors_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key44 UNIQUE (name);


--
-- TOC entry 7003 (class 2606 OID 2740480)
-- Name: sectors sectors_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key45 UNIQUE (name);


--
-- TOC entry 7005 (class 2606 OID 2740482)
-- Name: sectors sectors_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key46 UNIQUE (name);


--
-- TOC entry 7007 (class 2606 OID 2740484)
-- Name: sectors sectors_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key47 UNIQUE (name);


--
-- TOC entry 7009 (class 2606 OID 2740486)
-- Name: sectors sectors_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key48 UNIQUE (name);


--
-- TOC entry 7011 (class 2606 OID 2740488)
-- Name: sectors sectors_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key49 UNIQUE (name);


--
-- TOC entry 7013 (class 2606 OID 2740106)
-- Name: sectors sectors_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key5 UNIQUE (name);


--
-- TOC entry 7015 (class 2606 OID 2740008)
-- Name: sectors sectors_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key50 UNIQUE (name);


--
-- TOC entry 7017 (class 2606 OID 2739928)
-- Name: sectors sectors_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key51 UNIQUE (name);


--
-- TOC entry 7019 (class 2606 OID 2740010)
-- Name: sectors sectors_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key52 UNIQUE (name);


--
-- TOC entry 7021 (class 2606 OID 2739906)
-- Name: sectors sectors_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key53 UNIQUE (name);


--
-- TOC entry 7023 (class 2606 OID 2739908)
-- Name: sectors sectors_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key54 UNIQUE (name);


--
-- TOC entry 7025 (class 2606 OID 2739910)
-- Name: sectors sectors_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key55 UNIQUE (name);


--
-- TOC entry 7027 (class 2606 OID 2739926)
-- Name: sectors sectors_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key56 UNIQUE (name);


--
-- TOC entry 7029 (class 2606 OID 2739912)
-- Name: sectors sectors_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key57 UNIQUE (name);


--
-- TOC entry 7031 (class 2606 OID 2739914)
-- Name: sectors sectors_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key58 UNIQUE (name);


--
-- TOC entry 7033 (class 2606 OID 2739924)
-- Name: sectors sectors_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key59 UNIQUE (name);


--
-- TOC entry 7035 (class 2606 OID 2740108)
-- Name: sectors sectors_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key6 UNIQUE (name);


--
-- TOC entry 7037 (class 2606 OID 2739922)
-- Name: sectors sectors_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key60 UNIQUE (name);


--
-- TOC entry 7039 (class 2606 OID 2739916)
-- Name: sectors sectors_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key61 UNIQUE (name);


--
-- TOC entry 7041 (class 2606 OID 2739918)
-- Name: sectors sectors_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key62 UNIQUE (name);


--
-- TOC entry 7043 (class 2606 OID 2739920)
-- Name: sectors sectors_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key63 UNIQUE (name);


--
-- TOC entry 7045 (class 2606 OID 2740490)
-- Name: sectors sectors_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key64 UNIQUE (name);


--
-- TOC entry 7047 (class 2606 OID 2739816)
-- Name: sectors sectors_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key65 UNIQUE (name);


--
-- TOC entry 7049 (class 2606 OID 2739818)
-- Name: sectors sectors_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key66 UNIQUE (name);


--
-- TOC entry 7051 (class 2606 OID 2740208)
-- Name: sectors sectors_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key67 UNIQUE (name);


--
-- TOC entry 7053 (class 2606 OID 2740210)
-- Name: sectors sectors_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key68 UNIQUE (name);


--
-- TOC entry 7055 (class 2606 OID 2740212)
-- Name: sectors sectors_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key69 UNIQUE (name);


--
-- TOC entry 7057 (class 2606 OID 2740110)
-- Name: sectors sectors_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key7 UNIQUE (name);


--
-- TOC entry 7059 (class 2606 OID 2740214)
-- Name: sectors sectors_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key70 UNIQUE (name);


--
-- TOC entry 7061 (class 2606 OID 2740216)
-- Name: sectors sectors_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key71 UNIQUE (name);


--
-- TOC entry 7063 (class 2606 OID 2740218)
-- Name: sectors sectors_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key72 UNIQUE (name);


--
-- TOC entry 7065 (class 2606 OID 2740006)
-- Name: sectors sectors_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key73 UNIQUE (name);


--
-- TOC entry 7067 (class 2606 OID 2740220)
-- Name: sectors sectors_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key74 UNIQUE (name);


--
-- TOC entry 7069 (class 2606 OID 2740222)
-- Name: sectors sectors_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key75 UNIQUE (name);


--
-- TOC entry 7071 (class 2606 OID 2740224)
-- Name: sectors sectors_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key76 UNIQUE (name);


--
-- TOC entry 7073 (class 2606 OID 2740226)
-- Name: sectors sectors_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key77 UNIQUE (name);


--
-- TOC entry 7075 (class 2606 OID 2740228)
-- Name: sectors sectors_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key78 UNIQUE (name);


--
-- TOC entry 7077 (class 2606 OID 2740230)
-- Name: sectors sectors_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key79 UNIQUE (name);


--
-- TOC entry 7079 (class 2606 OID 2740352)
-- Name: sectors sectors_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key8 UNIQUE (name);


--
-- TOC entry 7081 (class 2606 OID 2740232)
-- Name: sectors sectors_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key80 UNIQUE (name);


--
-- TOC entry 7083 (class 2606 OID 2740234)
-- Name: sectors sectors_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key81 UNIQUE (name);


--
-- TOC entry 7085 (class 2606 OID 2740236)
-- Name: sectors sectors_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key82 UNIQUE (name);


--
-- TOC entry 7087 (class 2606 OID 2740238)
-- Name: sectors sectors_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key83 UNIQUE (name);


--
-- TOC entry 7089 (class 2606 OID 2740004)
-- Name: sectors sectors_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key84 UNIQUE (name);


--
-- TOC entry 7091 (class 2606 OID 2740240)
-- Name: sectors sectors_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key85 UNIQUE (name);


--
-- TOC entry 7093 (class 2606 OID 2740002)
-- Name: sectors sectors_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key86 UNIQUE (name);


--
-- TOC entry 7095 (class 2606 OID 2740242)
-- Name: sectors sectors_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key87 UNIQUE (name);


--
-- TOC entry 7097 (class 2606 OID 2740244)
-- Name: sectors sectors_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key88 UNIQUE (name);


--
-- TOC entry 7099 (class 2606 OID 2740246)
-- Name: sectors sectors_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key89 UNIQUE (name);


--
-- TOC entry 7101 (class 2606 OID 2740350)
-- Name: sectors sectors_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key9 UNIQUE (name);


--
-- TOC entry 7103 (class 2606 OID 2740248)
-- Name: sectors sectors_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key90 UNIQUE (name);


--
-- TOC entry 7105 (class 2606 OID 2740250)
-- Name: sectors sectors_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key91 UNIQUE (name);


--
-- TOC entry 7107 (class 2606 OID 2740252)
-- Name: sectors sectors_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key92 UNIQUE (name);


--
-- TOC entry 7109 (class 2606 OID 2740000)
-- Name: sectors sectors_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key93 UNIQUE (name);


--
-- TOC entry 7111 (class 2606 OID 2740254)
-- Name: sectors sectors_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key94 UNIQUE (name);


--
-- TOC entry 7113 (class 2606 OID 2740256)
-- Name: sectors sectors_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key95 UNIQUE (name);


--
-- TOC entry 7115 (class 2606 OID 2739998)
-- Name: sectors sectors_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key96 UNIQUE (name);


--
-- TOC entry 7117 (class 2606 OID 2740258)
-- Name: sectors sectors_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key97 UNIQUE (name);


--
-- TOC entry 7119 (class 2606 OID 2739996)
-- Name: sectors sectors_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key98 UNIQUE (name);


--
-- TOC entry 7121 (class 2606 OID 2740260)
-- Name: sectors sectors_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_name_key99 UNIQUE (name);


--
-- TOC entry 7123 (class 2606 OID 1588907)
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- TOC entry 7133 (class 2606 OID 2416671)
-- Name: subscriptions subscriptions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key UNIQUE (name);


--
-- TOC entry 7135 (class 2606 OID 2416669)
-- Name: subscriptions subscriptions_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key1 UNIQUE (name);


--
-- TOC entry 7137 (class 2606 OID 2416673)
-- Name: subscriptions subscriptions_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key2 UNIQUE (name);


--
-- TOC entry 7139 (class 2606 OID 2416675)
-- Name: subscriptions subscriptions_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_name_key3 UNIQUE (name);


--
-- TOC entry 7141 (class 2606 OID 2412771)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 2738666)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4755 (class 2606 OID 2738668)
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- TOC entry 4757 (class 2606 OID 2738624)
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- TOC entry 4759 (class 2606 OID 2738384)
-- Name: users users_email_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);


--
-- TOC entry 4761 (class 2606 OID 2738600)
-- Name: users users_email_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);


--
-- TOC entry 4763 (class 2606 OID 2738386)
-- Name: users users_email_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);


--
-- TOC entry 4765 (class 2606 OID 2738388)
-- Name: users users_email_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);


--
-- TOC entry 4767 (class 2606 OID 2738390)
-- Name: users users_email_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);


--
-- TOC entry 4769 (class 2606 OID 2738392)
-- Name: users users_email_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);


--
-- TOC entry 4771 (class 2606 OID 2738352)
-- Name: users users_email_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);


--
-- TOC entry 4773 (class 2606 OID 2738350)
-- Name: users users_email_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);


--
-- TOC entry 4775 (class 2606 OID 2738348)
-- Name: users users_email_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);


--
-- TOC entry 4777 (class 2606 OID 2738346)
-- Name: users users_email_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);


--
-- TOC entry 4779 (class 2606 OID 2738664)
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- TOC entry 4781 (class 2606 OID 2738394)
-- Name: users users_email_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);


--
-- TOC entry 4783 (class 2606 OID 2738396)
-- Name: users users_email_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);


--
-- TOC entry 4785 (class 2606 OID 2738398)
-- Name: users users_email_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);


--
-- TOC entry 4787 (class 2606 OID 2738400)
-- Name: users users_email_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);


--
-- TOC entry 4789 (class 2606 OID 2738402)
-- Name: users users_email_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);


--
-- TOC entry 4791 (class 2606 OID 2738344)
-- Name: users users_email_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key115 UNIQUE (email);


--
-- TOC entry 4793 (class 2606 OID 2738334)
-- Name: users users_email_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key116 UNIQUE (email);


--
-- TOC entry 4795 (class 2606 OID 2738336)
-- Name: users users_email_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key117 UNIQUE (email);


--
-- TOC entry 4797 (class 2606 OID 2738338)
-- Name: users users_email_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key118 UNIQUE (email);


--
-- TOC entry 4799 (class 2606 OID 2738342)
-- Name: users users_email_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key119 UNIQUE (email);


--
-- TOC entry 4801 (class 2606 OID 2738626)
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- TOC entry 4803 (class 2606 OID 2738592)
-- Name: users users_email_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key120 UNIQUE (email);


--
-- TOC entry 4805 (class 2606 OID 2738340)
-- Name: users users_email_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key121 UNIQUE (email);


--
-- TOC entry 4807 (class 2606 OID 2738696)
-- Name: users users_email_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key122 UNIQUE (email);


--
-- TOC entry 4809 (class 2606 OID 2738512)
-- Name: users users_email_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key123 UNIQUE (email);


--
-- TOC entry 4811 (class 2606 OID 2738416)
-- Name: users users_email_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key124 UNIQUE (email);


--
-- TOC entry 4813 (class 2606 OID 2738510)
-- Name: users users_email_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key125 UNIQUE (email);


--
-- TOC entry 4815 (class 2606 OID 2738540)
-- Name: users users_email_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key126 UNIQUE (email);


--
-- TOC entry 4817 (class 2606 OID 2738680)
-- Name: users users_email_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key127 UNIQUE (email);


--
-- TOC entry 4819 (class 2606 OID 2738508)
-- Name: users users_email_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key128 UNIQUE (email);


--
-- TOC entry 4821 (class 2606 OID 2738580)
-- Name: users users_email_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key129 UNIQUE (email);


--
-- TOC entry 4823 (class 2606 OID 2738630)
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- TOC entry 4825 (class 2606 OID 2738418)
-- Name: users users_email_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key130 UNIQUE (email);


--
-- TOC entry 4827 (class 2606 OID 2738420)
-- Name: users users_email_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key131 UNIQUE (email);


--
-- TOC entry 4829 (class 2606 OID 2738422)
-- Name: users users_email_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key132 UNIQUE (email);


--
-- TOC entry 4831 (class 2606 OID 2738424)
-- Name: users users_email_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key133 UNIQUE (email);


--
-- TOC entry 4833 (class 2606 OID 2738506)
-- Name: users users_email_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key134 UNIQUE (email);


--
-- TOC entry 4835 (class 2606 OID 2738648)
-- Name: users users_email_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key135 UNIQUE (email);


--
-- TOC entry 4837 (class 2606 OID 2738670)
-- Name: users users_email_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key136 UNIQUE (email);


--
-- TOC entry 4839 (class 2606 OID 2738426)
-- Name: users users_email_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key137 UNIQUE (email);


--
-- TOC entry 4841 (class 2606 OID 2738474)
-- Name: users users_email_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key138 UNIQUE (email);


--
-- TOC entry 4843 (class 2606 OID 2738504)
-- Name: users users_email_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key139 UNIQUE (email);


--
-- TOC entry 4845 (class 2606 OID 2738662)
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- TOC entry 4847 (class 2606 OID 2738640)
-- Name: users users_email_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key140 UNIQUE (email);


--
-- TOC entry 4849 (class 2606 OID 2738654)
-- Name: users users_email_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key141 UNIQUE (email);


--
-- TOC entry 4851 (class 2606 OID 2738502)
-- Name: users users_email_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key142 UNIQUE (email);


--
-- TOC entry 4853 (class 2606 OID 2738628)
-- Name: users users_email_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key143 UNIQUE (email);


--
-- TOC entry 4855 (class 2606 OID 2738500)
-- Name: users users_email_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key144 UNIQUE (email);


--
-- TOC entry 4857 (class 2606 OID 2738476)
-- Name: users users_email_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key145 UNIQUE (email);


--
-- TOC entry 4859 (class 2606 OID 2738478)
-- Name: users users_email_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key146 UNIQUE (email);


--
-- TOC entry 4861 (class 2606 OID 2738480)
-- Name: users users_email_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key147 UNIQUE (email);


--
-- TOC entry 4863 (class 2606 OID 2738482)
-- Name: users users_email_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key148 UNIQUE (email);


--
-- TOC entry 4865 (class 2606 OID 2738484)
-- Name: users users_email_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key149 UNIQUE (email);


--
-- TOC entry 4867 (class 2606 OID 2738596)
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- TOC entry 4869 (class 2606 OID 2738498)
-- Name: users users_email_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key150 UNIQUE (email);


--
-- TOC entry 4871 (class 2606 OID 2738486)
-- Name: users users_email_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key151 UNIQUE (email);


--
-- TOC entry 4873 (class 2606 OID 2738488)
-- Name: users users_email_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key152 UNIQUE (email);


--
-- TOC entry 4875 (class 2606 OID 2738490)
-- Name: users users_email_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key153 UNIQUE (email);


--
-- TOC entry 4877 (class 2606 OID 2738492)
-- Name: users users_email_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key154 UNIQUE (email);


--
-- TOC entry 4879 (class 2606 OID 2738494)
-- Name: users users_email_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key155 UNIQUE (email);


--
-- TOC entry 4881 (class 2606 OID 2738496)
-- Name: users users_email_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key156 UNIQUE (email);


--
-- TOC entry 4883 (class 2606 OID 2738428)
-- Name: users users_email_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key157 UNIQUE (email);


--
-- TOC entry 4885 (class 2606 OID 2738430)
-- Name: users users_email_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key158 UNIQUE (email);


--
-- TOC entry 4887 (class 2606 OID 2738432)
-- Name: users users_email_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key159 UNIQUE (email);


--
-- TOC entry 4889 (class 2606 OID 2738660)
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- TOC entry 4891 (class 2606 OID 2738434)
-- Name: users users_email_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key160 UNIQUE (email);


--
-- TOC entry 4893 (class 2606 OID 2738436)
-- Name: users users_email_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key161 UNIQUE (email);


--
-- TOC entry 4895 (class 2606 OID 2738438)
-- Name: users users_email_key162; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key162 UNIQUE (email);


--
-- TOC entry 4897 (class 2606 OID 2738440)
-- Name: users users_email_key163; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key163 UNIQUE (email);


--
-- TOC entry 4899 (class 2606 OID 2738442)
-- Name: users users_email_key164; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key164 UNIQUE (email);


--
-- TOC entry 4901 (class 2606 OID 2738444)
-- Name: users users_email_key165; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key165 UNIQUE (email);


--
-- TOC entry 4903 (class 2606 OID 2738446)
-- Name: users users_email_key166; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key166 UNIQUE (email);


--
-- TOC entry 4905 (class 2606 OID 2738472)
-- Name: users users_email_key167; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key167 UNIQUE (email);


--
-- TOC entry 4907 (class 2606 OID 2738448)
-- Name: users users_email_key168; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key168 UNIQUE (email);


--
-- TOC entry 4909 (class 2606 OID 2738450)
-- Name: users users_email_key169; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key169 UNIQUE (email);


--
-- TOC entry 4911 (class 2606 OID 2738598)
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- TOC entry 4913 (class 2606 OID 2738452)
-- Name: users users_email_key170; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key170 UNIQUE (email);


--
-- TOC entry 4915 (class 2606 OID 2738454)
-- Name: users users_email_key171; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key171 UNIQUE (email);


--
-- TOC entry 4917 (class 2606 OID 2738456)
-- Name: users users_email_key172; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key172 UNIQUE (email);


--
-- TOC entry 4919 (class 2606 OID 2738470)
-- Name: users users_email_key173; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key173 UNIQUE (email);


--
-- TOC entry 4921 (class 2606 OID 2738458)
-- Name: users users_email_key174; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key174 UNIQUE (email);


--
-- TOC entry 4923 (class 2606 OID 2738460)
-- Name: users users_email_key175; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key175 UNIQUE (email);


--
-- TOC entry 4925 (class 2606 OID 2738462)
-- Name: users users_email_key176; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key176 UNIQUE (email);


--
-- TOC entry 4927 (class 2606 OID 2738468)
-- Name: users users_email_key177; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key177 UNIQUE (email);


--
-- TOC entry 4929 (class 2606 OID 2738464)
-- Name: users users_email_key178; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key178 UNIQUE (email);


--
-- TOC entry 4931 (class 2606 OID 2738466)
-- Name: users users_email_key179; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key179 UNIQUE (email);


--
-- TOC entry 4933 (class 2606 OID 2738656)
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- TOC entry 4935 (class 2606 OID 2738700)
-- Name: users users_email_key180; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key180 UNIQUE (email);


--
-- TOC entry 4937 (class 2606 OID 2738790)
-- Name: users users_email_key181; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key181 UNIQUE (email);


--
-- TOC entry 4939 (class 2606 OID 2738374)
-- Name: users users_email_key182; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key182 UNIQUE (email);


--
-- TOC entry 4941 (class 2606 OID 2738412)
-- Name: users users_email_key183; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key183 UNIQUE (email);


--
-- TOC entry 4943 (class 2606 OID 2738788)
-- Name: users users_email_key184; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key184 UNIQUE (email);


--
-- TOC entry 4945 (class 2606 OID 2738802)
-- Name: users users_email_key185; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key185 UNIQUE (email);


--
-- TOC entry 4947 (class 2606 OID 2738786)
-- Name: users users_email_key186; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key186 UNIQUE (email);


--
-- TOC entry 4949 (class 2606 OID 2738366)
-- Name: users users_email_key187; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key187 UNIQUE (email);


--
-- TOC entry 4951 (class 2606 OID 2738784)
-- Name: users users_email_key188; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key188 UNIQUE (email);


--
-- TOC entry 4953 (class 2606 OID 2738702)
-- Name: users users_email_key189; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key189 UNIQUE (email);


--
-- TOC entry 4955 (class 2606 OID 2738632)
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- TOC entry 4957 (class 2606 OID 2738704)
-- Name: users users_email_key190; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key190 UNIQUE (email);


--
-- TOC entry 4959 (class 2606 OID 2738706)
-- Name: users users_email_key191; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key191 UNIQUE (email);


--
-- TOC entry 4961 (class 2606 OID 2738708)
-- Name: users users_email_key192; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key192 UNIQUE (email);


--
-- TOC entry 4963 (class 2606 OID 2738710)
-- Name: users users_email_key193; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key193 UNIQUE (email);


--
-- TOC entry 4965 (class 2606 OID 2738712)
-- Name: users users_email_key194; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key194 UNIQUE (email);


--
-- TOC entry 4967 (class 2606 OID 2738714)
-- Name: users users_email_key195; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key195 UNIQUE (email);


--
-- TOC entry 4969 (class 2606 OID 2738782)
-- Name: users users_email_key196; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key196 UNIQUE (email);


--
-- TOC entry 4971 (class 2606 OID 2738716)
-- Name: users users_email_key197; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key197 UNIQUE (email);


--
-- TOC entry 4973 (class 2606 OID 2738718)
-- Name: users users_email_key198; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key198 UNIQUE (email);


--
-- TOC entry 4975 (class 2606 OID 2738720)
-- Name: users users_email_key199; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key199 UNIQUE (email);


--
-- TOC entry 4977 (class 2606 OID 2738672)
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- TOC entry 4979 (class 2606 OID 2738678)
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- TOC entry 4981 (class 2606 OID 2738722)
-- Name: users users_email_key200; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key200 UNIQUE (email);


--
-- TOC entry 4983 (class 2606 OID 2738724)
-- Name: users users_email_key201; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key201 UNIQUE (email);


--
-- TOC entry 4985 (class 2606 OID 2738726)
-- Name: users users_email_key202; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key202 UNIQUE (email);


--
-- TOC entry 4987 (class 2606 OID 2738780)
-- Name: users users_email_key203; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key203 UNIQUE (email);


--
-- TOC entry 4989 (class 2606 OID 2738728)
-- Name: users users_email_key204; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key204 UNIQUE (email);


--
-- TOC entry 4991 (class 2606 OID 2738730)
-- Name: users users_email_key205; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key205 UNIQUE (email);


--
-- TOC entry 4993 (class 2606 OID 2738732)
-- Name: users users_email_key206; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key206 UNIQUE (email);


--
-- TOC entry 4995 (class 2606 OID 2738734)
-- Name: users users_email_key207; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key207 UNIQUE (email);


--
-- TOC entry 4997 (class 2606 OID 2738736)
-- Name: users users_email_key208; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key208 UNIQUE (email);


--
-- TOC entry 4999 (class 2606 OID 2738778)
-- Name: users users_email_key209; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key209 UNIQUE (email);


--
-- TOC entry 5001 (class 2606 OID 2738652)
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- TOC entry 5003 (class 2606 OID 2738738)
-- Name: users users_email_key210; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key210 UNIQUE (email);


--
-- TOC entry 5005 (class 2606 OID 2738740)
-- Name: users users_email_key211; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key211 UNIQUE (email);


--
-- TOC entry 5007 (class 2606 OID 2738742)
-- Name: users users_email_key212; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key212 UNIQUE (email);


--
-- TOC entry 5009 (class 2606 OID 2738744)
-- Name: users users_email_key213; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key213 UNIQUE (email);


--
-- TOC entry 5011 (class 2606 OID 2738776)
-- Name: users users_email_key214; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key214 UNIQUE (email);


--
-- TOC entry 5013 (class 2606 OID 2738746)
-- Name: users users_email_key215; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key215 UNIQUE (email);


--
-- TOC entry 5015 (class 2606 OID 2738748)
-- Name: users users_email_key216; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key216 UNIQUE (email);


--
-- TOC entry 5017 (class 2606 OID 2738752)
-- Name: users users_email_key217; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key217 UNIQUE (email);


--
-- TOC entry 5019 (class 2606 OID 2738754)
-- Name: users users_email_key218; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key218 UNIQUE (email);


--
-- TOC entry 5021 (class 2606 OID 2738774)
-- Name: users users_email_key219; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key219 UNIQUE (email);


--
-- TOC entry 5023 (class 2606 OID 2738634)
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- TOC entry 5025 (class 2606 OID 2738772)
-- Name: users users_email_key220; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key220 UNIQUE (email);


--
-- TOC entry 5027 (class 2606 OID 2738756)
-- Name: users users_email_key221; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key221 UNIQUE (email);


--
-- TOC entry 5029 (class 2606 OID 2738758)
-- Name: users users_email_key222; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key222 UNIQUE (email);


--
-- TOC entry 5031 (class 2606 OID 2738760)
-- Name: users users_email_key223; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key223 UNIQUE (email);


--
-- TOC entry 5033 (class 2606 OID 2738770)
-- Name: users users_email_key224; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key224 UNIQUE (email);


--
-- TOC entry 5035 (class 2606 OID 2738762)
-- Name: users users_email_key225; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key225 UNIQUE (email);


--
-- TOC entry 5037 (class 2606 OID 2738764)
-- Name: users users_email_key226; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key226 UNIQUE (email);


--
-- TOC entry 5039 (class 2606 OID 2738766)
-- Name: users users_email_key227; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key227 UNIQUE (email);


--
-- TOC entry 5041 (class 2606 OID 2738768)
-- Name: users users_email_key228; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key228 UNIQUE (email);


--
-- TOC entry 5043 (class 2606 OID 2738332)
-- Name: users users_email_key229; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key229 UNIQUE (email);


--
-- TOC entry 5045 (class 2606 OID 2738636)
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- TOC entry 5047 (class 2606 OID 2738826)
-- Name: users users_email_key230; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key230 UNIQUE (email);


--
-- TOC entry 5049 (class 2606 OID 2738254)
-- Name: users users_email_key231; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key231 UNIQUE (email);


--
-- TOC entry 5051 (class 2606 OID 2738828)
-- Name: users users_email_key232; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key232 UNIQUE (email);


--
-- TOC entry 5053 (class 2606 OID 2738830)
-- Name: users users_email_key233; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key233 UNIQUE (email);


--
-- TOC entry 5055 (class 2606 OID 2738832)
-- Name: users users_email_key234; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key234 UNIQUE (email);


--
-- TOC entry 5057 (class 2606 OID 2738834)
-- Name: users users_email_key235; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key235 UNIQUE (email);


--
-- TOC entry 5059 (class 2606 OID 2738836)
-- Name: users users_email_key236; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key236 UNIQUE (email);


--
-- TOC entry 5061 (class 2606 OID 2738252)
-- Name: users users_email_key237; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key237 UNIQUE (email);


--
-- TOC entry 5063 (class 2606 OID 2738838)
-- Name: users users_email_key238; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key238 UNIQUE (email);


--
-- TOC entry 5065 (class 2606 OID 2738840)
-- Name: users users_email_key239; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key239 UNIQUE (email);


--
-- TOC entry 5067 (class 2606 OID 2738692)
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- TOC entry 5069 (class 2606 OID 2738842)
-- Name: users users_email_key240; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key240 UNIQUE (email);


--
-- TOC entry 5071 (class 2606 OID 2738844)
-- Name: users users_email_key241; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key241 UNIQUE (email);


--
-- TOC entry 5073 (class 2606 OID 2738250)
-- Name: users users_email_key242; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key242 UNIQUE (email);


--
-- TOC entry 5075 (class 2606 OID 2738846)
-- Name: users users_email_key243; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key243 UNIQUE (email);


--
-- TOC entry 5077 (class 2606 OID 2738848)
-- Name: users users_email_key244; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key244 UNIQUE (email);


--
-- TOC entry 5079 (class 2606 OID 2738248)
-- Name: users users_email_key245; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key245 UNIQUE (email);


--
-- TOC entry 5081 (class 2606 OID 2738850)
-- Name: users users_email_key246; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key246 UNIQUE (email);


--
-- TOC entry 5083 (class 2606 OID 2738852)
-- Name: users users_email_key247; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key247 UNIQUE (email);


--
-- TOC entry 5085 (class 2606 OID 2738854)
-- Name: users users_email_key248; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key248 UNIQUE (email);


--
-- TOC entry 5087 (class 2606 OID 2738856)
-- Name: users users_email_key249; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key249 UNIQUE (email);


--
-- TOC entry 5089 (class 2606 OID 2738356)
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- TOC entry 5091 (class 2606 OID 2738858)
-- Name: users users_email_key250; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key250 UNIQUE (email);


--
-- TOC entry 5093 (class 2606 OID 2738246)
-- Name: users users_email_key251; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key251 UNIQUE (email);


--
-- TOC entry 5095 (class 2606 OID 2738860)
-- Name: users users_email_key252; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key252 UNIQUE (email);


--
-- TOC entry 5097 (class 2606 OID 2738862)
-- Name: users users_email_key253; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key253 UNIQUE (email);


--
-- TOC entry 5099 (class 2606 OID 2738864)
-- Name: users users_email_key254; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key254 UNIQUE (email);


--
-- TOC entry 5101 (class 2606 OID 2738866)
-- Name: users users_email_key255; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key255 UNIQUE (email);


--
-- TOC entry 5103 (class 2606 OID 2738244)
-- Name: users users_email_key256; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key256 UNIQUE (email);


--
-- TOC entry 5105 (class 2606 OID 2738242)
-- Name: users users_email_key257; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key257 UNIQUE (email);


--
-- TOC entry 5107 (class 2606 OID 2738868)
-- Name: users users_email_key258; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key258 UNIQUE (email);


--
-- TOC entry 5109 (class 2606 OID 2738870)
-- Name: users users_email_key259; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key259 UNIQUE (email);


--
-- TOC entry 5111 (class 2606 OID 2738676)
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- TOC entry 5113 (class 2606 OID 2738872)
-- Name: users users_email_key260; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key260 UNIQUE (email);


--
-- TOC entry 5115 (class 2606 OID 2738874)
-- Name: users users_email_key261; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key261 UNIQUE (email);


--
-- TOC entry 5117 (class 2606 OID 2738894)
-- Name: users users_email_key262; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key262 UNIQUE (email);


--
-- TOC entry 5119 (class 2606 OID 2738876)
-- Name: users users_email_key263; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key263 UNIQUE (email);


--
-- TOC entry 5121 (class 2606 OID 2738892)
-- Name: users users_email_key264; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key264 UNIQUE (email);


--
-- TOC entry 5123 (class 2606 OID 2738878)
-- Name: users users_email_key265; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key265 UNIQUE (email);


--
-- TOC entry 5125 (class 2606 OID 2738880)
-- Name: users users_email_key266; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key266 UNIQUE (email);


--
-- TOC entry 5127 (class 2606 OID 2738882)
-- Name: users users_email_key267; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key267 UNIQUE (email);


--
-- TOC entry 5129 (class 2606 OID 2738884)
-- Name: users users_email_key268; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key268 UNIQUE (email);


--
-- TOC entry 5131 (class 2606 OID 2738886)
-- Name: users users_email_key269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key269 UNIQUE (email);


--
-- TOC entry 5133 (class 2606 OID 2738358)
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- TOC entry 5135 (class 2606 OID 2738890)
-- Name: users users_email_key270; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key270 UNIQUE (email);


--
-- TOC entry 5137 (class 2606 OID 2738888)
-- Name: users users_email_key271; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key271 UNIQUE (email);


--
-- TOC entry 5139 (class 2606 OID 2738750)
-- Name: users users_email_key272; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key272 UNIQUE (email);


--
-- TOC entry 5141 (class 2606 OID 2738548)
-- Name: users users_email_key273; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key273 UNIQUE (email);


--
-- TOC entry 5143 (class 2606 OID 2738550)
-- Name: users users_email_key274; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key274 UNIQUE (email);


--
-- TOC entry 5145 (class 2606 OID 2738578)
-- Name: users users_email_key275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key275 UNIQUE (email);


--
-- TOC entry 5147 (class 2606 OID 2738552)
-- Name: users users_email_key276; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key276 UNIQUE (email);


--
-- TOC entry 5149 (class 2606 OID 2738554)
-- Name: users users_email_key277; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key277 UNIQUE (email);


--
-- TOC entry 5151 (class 2606 OID 2738556)
-- Name: users users_email_key278; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key278 UNIQUE (email);


--
-- TOC entry 5153 (class 2606 OID 2738576)
-- Name: users users_email_key279; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key279 UNIQUE (email);


--
-- TOC entry 5155 (class 2606 OID 2738650)
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- TOC entry 5157 (class 2606 OID 2738558)
-- Name: users users_email_key280; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key280 UNIQUE (email);


--
-- TOC entry 5159 (class 2606 OID 2738560)
-- Name: users users_email_key281; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key281 UNIQUE (email);


--
-- TOC entry 5161 (class 2606 OID 2738574)
-- Name: users users_email_key282; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key282 UNIQUE (email);


--
-- TOC entry 5163 (class 2606 OID 2738562)
-- Name: users users_email_key283; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key283 UNIQUE (email);


--
-- TOC entry 5165 (class 2606 OID 2738564)
-- Name: users users_email_key284; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key284 UNIQUE (email);


--
-- TOC entry 5167 (class 2606 OID 2738566)
-- Name: users users_email_key285; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key285 UNIQUE (email);


--
-- TOC entry 5169 (class 2606 OID 2738568)
-- Name: users users_email_key286; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key286 UNIQUE (email);


--
-- TOC entry 5171 (class 2606 OID 2738570)
-- Name: users users_email_key287; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key287 UNIQUE (email);


--
-- TOC entry 5173 (class 2606 OID 2738572)
-- Name: users users_email_key288; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key288 UNIQUE (email);


--
-- TOC entry 5175 (class 2606 OID 2738256)
-- Name: users users_email_key289; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key289 UNIQUE (email);


--
-- TOC entry 5177 (class 2606 OID 2738638)
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- TOC entry 5179 (class 2606 OID 2738258)
-- Name: users users_email_key290; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key290 UNIQUE (email);


--
-- TOC entry 5181 (class 2606 OID 2738260)
-- Name: users users_email_key291; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key291 UNIQUE (email);


--
-- TOC entry 5183 (class 2606 OID 2738262)
-- Name: users users_email_key292; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key292 UNIQUE (email);


--
-- TOC entry 5185 (class 2606 OID 2738264)
-- Name: users users_email_key293; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key293 UNIQUE (email);


--
-- TOC entry 5187 (class 2606 OID 2738266)
-- Name: users users_email_key294; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key294 UNIQUE (email);


--
-- TOC entry 5189 (class 2606 OID 2738268)
-- Name: users users_email_key295; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key295 UNIQUE (email);


--
-- TOC entry 5191 (class 2606 OID 2738270)
-- Name: users users_email_key296; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key296 UNIQUE (email);


--
-- TOC entry 5193 (class 2606 OID 2738330)
-- Name: users users_email_key297; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key297 UNIQUE (email);


--
-- TOC entry 5195 (class 2606 OID 2738272)
-- Name: users users_email_key298; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key298 UNIQUE (email);


--
-- TOC entry 5197 (class 2606 OID 2738274)
-- Name: users users_email_key299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key299 UNIQUE (email);


--
-- TOC entry 5199 (class 2606 OID 2738674)
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- TOC entry 5201 (class 2606 OID 2738360)
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- TOC entry 5203 (class 2606 OID 2738276)
-- Name: users users_email_key300; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key300 UNIQUE (email);


--
-- TOC entry 5205 (class 2606 OID 2738278)
-- Name: users users_email_key301; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key301 UNIQUE (email);


--
-- TOC entry 5207 (class 2606 OID 2738328)
-- Name: users users_email_key302; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key302 UNIQUE (email);


--
-- TOC entry 5209 (class 2606 OID 2738326)
-- Name: users users_email_key303; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key303 UNIQUE (email);


--
-- TOC entry 5211 (class 2606 OID 2738280)
-- Name: users users_email_key304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key304 UNIQUE (email);


--
-- TOC entry 5213 (class 2606 OID 2738282)
-- Name: users users_email_key305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key305 UNIQUE (email);


--
-- TOC entry 5215 (class 2606 OID 2738284)
-- Name: users users_email_key306; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key306 UNIQUE (email);


--
-- TOC entry 5217 (class 2606 OID 2738286)
-- Name: users users_email_key307; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key307 UNIQUE (email);


--
-- TOC entry 5219 (class 2606 OID 2738288)
-- Name: users users_email_key308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key308 UNIQUE (email);


--
-- TOC entry 5221 (class 2606 OID 2738290)
-- Name: users users_email_key309; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key309 UNIQUE (email);


--
-- TOC entry 5223 (class 2606 OID 2738590)
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- TOC entry 5225 (class 2606 OID 2738292)
-- Name: users users_email_key310; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key310 UNIQUE (email);


--
-- TOC entry 5227 (class 2606 OID 2738294)
-- Name: users users_email_key311; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key311 UNIQUE (email);


--
-- TOC entry 5229 (class 2606 OID 2738296)
-- Name: users users_email_key312; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key312 UNIQUE (email);


--
-- TOC entry 5231 (class 2606 OID 2738298)
-- Name: users users_email_key313; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key313 UNIQUE (email);


--
-- TOC entry 5233 (class 2606 OID 2738324)
-- Name: users users_email_key314; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key314 UNIQUE (email);


--
-- TOC entry 5235 (class 2606 OID 2738300)
-- Name: users users_email_key315; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key315 UNIQUE (email);


--
-- TOC entry 5237 (class 2606 OID 2738302)
-- Name: users users_email_key316; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key316 UNIQUE (email);


--
-- TOC entry 5239 (class 2606 OID 2738304)
-- Name: users users_email_key317; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key317 UNIQUE (email);


--
-- TOC entry 5241 (class 2606 OID 2738306)
-- Name: users users_email_key318; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key318 UNIQUE (email);


--
-- TOC entry 5243 (class 2606 OID 2738308)
-- Name: users users_email_key319; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key319 UNIQUE (email);


--
-- TOC entry 5245 (class 2606 OID 2738642)
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- TOC entry 5247 (class 2606 OID 2738322)
-- Name: users users_email_key320; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key320 UNIQUE (email);


--
-- TOC entry 5249 (class 2606 OID 2738310)
-- Name: users users_email_key321; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key321 UNIQUE (email);


--
-- TOC entry 5251 (class 2606 OID 2738312)
-- Name: users users_email_key322; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key322 UNIQUE (email);


--
-- TOC entry 5253 (class 2606 OID 2738314)
-- Name: users users_email_key323; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key323 UNIQUE (email);


--
-- TOC entry 5255 (class 2606 OID 2738316)
-- Name: users users_email_key324; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key324 UNIQUE (email);


--
-- TOC entry 5257 (class 2606 OID 2738318)
-- Name: users users_email_key325; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key325 UNIQUE (email);


--
-- TOC entry 5259 (class 2606 OID 2738320)
-- Name: users users_email_key326; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key326 UNIQUE (email);


--
-- TOC entry 5261 (class 2606 OID 2738896)
-- Name: users users_email_key327; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key327 UNIQUE (email);


--
-- TOC entry 5263 (class 2606 OID 2738240)
-- Name: users users_email_key328; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key328 UNIQUE (email);


--
-- TOC entry 5265 (class 2606 OID 2738238)
-- Name: users users_email_key329; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key329 UNIQUE (email);


--
-- TOC entry 5267 (class 2606 OID 2738362)
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- TOC entry 5269 (class 2606 OID 2738898)
-- Name: users users_email_key330; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key330 UNIQUE (email);


--
-- TOC entry 5271 (class 2606 OID 2738900)
-- Name: users users_email_key331; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key331 UNIQUE (email);


--
-- TOC entry 5273 (class 2606 OID 2738902)
-- Name: users users_email_key332; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key332 UNIQUE (email);


--
-- TOC entry 5275 (class 2606 OID 2738236)
-- Name: users users_email_key333; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key333 UNIQUE (email);


--
-- TOC entry 5277 (class 2606 OID 2738904)
-- Name: users users_email_key334; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key334 UNIQUE (email);


--
-- TOC entry 5279 (class 2606 OID 2738906)
-- Name: users users_email_key335; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key335 UNIQUE (email);


--
-- TOC entry 5281 (class 2606 OID 2738234)
-- Name: users users_email_key336; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key336 UNIQUE (email);


--
-- TOC entry 5283 (class 2606 OID 2738908)
-- Name: users users_email_key337; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key337 UNIQUE (email);


--
-- TOC entry 5285 (class 2606 OID 2738910)
-- Name: users users_email_key338; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key338 UNIQUE (email);


--
-- TOC entry 5287 (class 2606 OID 2738912)
-- Name: users users_email_key339; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key339 UNIQUE (email);


--
-- TOC entry 5289 (class 2606 OID 2738368)
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- TOC entry 5291 (class 2606 OID 2738232)
-- Name: users users_email_key340; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key340 UNIQUE (email);


--
-- TOC entry 5293 (class 2606 OID 2738914)
-- Name: users users_email_key341; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key341 UNIQUE (email);


--
-- TOC entry 5295 (class 2606 OID 2738916)
-- Name: users users_email_key342; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key342 UNIQUE (email);


--
-- TOC entry 5297 (class 2606 OID 2738230)
-- Name: users users_email_key343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key343 UNIQUE (email);


--
-- TOC entry 5299 (class 2606 OID 2738918)
-- Name: users users_email_key344; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key344 UNIQUE (email);


--
-- TOC entry 5301 (class 2606 OID 2738228)
-- Name: users users_email_key345; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key345 UNIQUE (email);


--
-- TOC entry 5303 (class 2606 OID 2738226)
-- Name: users users_email_key346; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key346 UNIQUE (email);


--
-- TOC entry 5305 (class 2606 OID 2738920)
-- Name: users users_email_key347; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key347 UNIQUE (email);


--
-- TOC entry 5307 (class 2606 OID 2738922)
-- Name: users users_email_key348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key348 UNIQUE (email);


--
-- TOC entry 5309 (class 2606 OID 2738924)
-- Name: users users_email_key349; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key349 UNIQUE (email);


--
-- TOC entry 5311 (class 2606 OID 2738586)
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- TOC entry 5313 (class 2606 OID 2738926)
-- Name: users users_email_key350; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key350 UNIQUE (email);


--
-- TOC entry 5315 (class 2606 OID 2738224)
-- Name: users users_email_key351; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key351 UNIQUE (email);


--
-- TOC entry 5317 (class 2606 OID 2738928)
-- Name: users users_email_key352; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key352 UNIQUE (email);


--
-- TOC entry 5319 (class 2606 OID 2738930)
-- Name: users users_email_key353; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key353 UNIQUE (email);


--
-- TOC entry 5321 (class 2606 OID 2738932)
-- Name: users users_email_key354; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key354 UNIQUE (email);


--
-- TOC entry 5323 (class 2606 OID 2738222)
-- Name: users users_email_key355; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key355 UNIQUE (email);


--
-- TOC entry 5325 (class 2606 OID 2738934)
-- Name: users users_email_key356; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key356 UNIQUE (email);


--
-- TOC entry 5327 (class 2606 OID 2738936)
-- Name: users users_email_key357; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key357 UNIQUE (email);


--
-- TOC entry 5329 (class 2606 OID 2738938)
-- Name: users users_email_key358; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key358 UNIQUE (email);


--
-- TOC entry 5331 (class 2606 OID 2738220)
-- Name: users users_email_key359; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key359 UNIQUE (email);


--
-- TOC entry 5333 (class 2606 OID 2738370)
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- TOC entry 5335 (class 2606 OID 2738940)
-- Name: users users_email_key360; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key360 UNIQUE (email);


--
-- TOC entry 5337 (class 2606 OID 2738942)
-- Name: users users_email_key361; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key361 UNIQUE (email);


--
-- TOC entry 5339 (class 2606 OID 2738944)
-- Name: users users_email_key362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key362 UNIQUE (email);


--
-- TOC entry 5341 (class 2606 OID 2738946)
-- Name: users users_email_key363; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key363 UNIQUE (email);


--
-- TOC entry 5343 (class 2606 OID 2738948)
-- Name: users users_email_key364; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key364 UNIQUE (email);


--
-- TOC entry 5345 (class 2606 OID 2738950)
-- Name: users users_email_key365; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key365 UNIQUE (email);


--
-- TOC entry 5347 (class 2606 OID 2738218)
-- Name: users users_email_key366; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key366 UNIQUE (email);


--
-- TOC entry 5349 (class 2606 OID 2738952)
-- Name: users users_email_key367; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key367 UNIQUE (email);


--
-- TOC entry 5351 (class 2606 OID 2738954)
-- Name: users users_email_key368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key368 UNIQUE (email);


--
-- TOC entry 5353 (class 2606 OID 2738216)
-- Name: users users_email_key369; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key369 UNIQUE (email);


--
-- TOC entry 5355 (class 2606 OID 2738404)
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- TOC entry 5357 (class 2606 OID 2738956)
-- Name: users users_email_key370; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key370 UNIQUE (email);


--
-- TOC entry 5359 (class 2606 OID 2738958)
-- Name: users users_email_key371; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key371 UNIQUE (email);


--
-- TOC entry 5361 (class 2606 OID 2738960)
-- Name: users users_email_key372; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key372 UNIQUE (email);


--
-- TOC entry 5363 (class 2606 OID 2738962)
-- Name: users users_email_key373; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key373 UNIQUE (email);


--
-- TOC entry 5365 (class 2606 OID 2738964)
-- Name: users users_email_key374; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key374 UNIQUE (email);


--
-- TOC entry 5367 (class 2606 OID 2738966)
-- Name: users users_email_key375; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key375 UNIQUE (email);


--
-- TOC entry 5369 (class 2606 OID 2738968)
-- Name: users users_email_key376; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key376 UNIQUE (email);


--
-- TOC entry 5371 (class 2606 OID 2738970)
-- Name: users users_email_key377; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key377 UNIQUE (email);


--
-- TOC entry 5373 (class 2606 OID 2738214)
-- Name: users users_email_key378; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key378 UNIQUE (email);


--
-- TOC entry 5375 (class 2606 OID 2738212)
-- Name: users users_email_key379; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key379 UNIQUE (email);


--
-- TOC entry 5377 (class 2606 OID 2738406)
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- TOC entry 5379 (class 2606 OID 2738210)
-- Name: users users_email_key380; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key380 UNIQUE (email);


--
-- TOC entry 5381 (class 2606 OID 2738208)
-- Name: users users_email_key381; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key381 UNIQUE (email);


--
-- TOC entry 5383 (class 2606 OID 2738206)
-- Name: users users_email_key382; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key382 UNIQUE (email);


--
-- TOC entry 5385 (class 2606 OID 2738204)
-- Name: users users_email_key383; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key383 UNIQUE (email);


--
-- TOC entry 5387 (class 2606 OID 2738972)
-- Name: users users_email_key384; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key384 UNIQUE (email);


--
-- TOC entry 5389 (class 2606 OID 2738202)
-- Name: users users_email_key385; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key385 UNIQUE (email);


--
-- TOC entry 5391 (class 2606 OID 2738974)
-- Name: users users_email_key386; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key386 UNIQUE (email);


--
-- TOC entry 5393 (class 2606 OID 2738976)
-- Name: users users_email_key387; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key387 UNIQUE (email);


--
-- TOC entry 5395 (class 2606 OID 2738200)
-- Name: users users_email_key388; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key388 UNIQUE (email);


--
-- TOC entry 5397 (class 2606 OID 2738978)
-- Name: users users_email_key389; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key389 UNIQUE (email);


--
-- TOC entry 5399 (class 2606 OID 2738408)
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- TOC entry 5401 (class 2606 OID 2738980)
-- Name: users users_email_key390; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key390 UNIQUE (email);


--
-- TOC entry 5403 (class 2606 OID 2738982)
-- Name: users users_email_key391; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key391 UNIQUE (email);


--
-- TOC entry 5405 (class 2606 OID 2738984)
-- Name: users users_email_key392; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key392 UNIQUE (email);


--
-- TOC entry 5407 (class 2606 OID 2738986)
-- Name: users users_email_key393; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key393 UNIQUE (email);


--
-- TOC entry 5409 (class 2606 OID 2738198)
-- Name: users users_email_key394; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key394 UNIQUE (email);


--
-- TOC entry 5411 (class 2606 OID 2738988)
-- Name: users users_email_key395; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key395 UNIQUE (email);


--
-- TOC entry 5413 (class 2606 OID 2738990)
-- Name: users users_email_key396; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key396 UNIQUE (email);


--
-- TOC entry 5415 (class 2606 OID 2738992)
-- Name: users users_email_key397; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key397 UNIQUE (email);


--
-- TOC entry 5417 (class 2606 OID 2738994)
-- Name: users users_email_key398; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key398 UNIQUE (email);


--
-- TOC entry 5419 (class 2606 OID 2738996)
-- Name: users users_email_key399; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key399 UNIQUE (email);


--
-- TOC entry 5421 (class 2606 OID 2738682)
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- TOC entry 5423 (class 2606 OID 2738410)
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- TOC entry 5425 (class 2606 OID 2738582)
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- TOC entry 5427 (class 2606 OID 2738414)
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- TOC entry 5429 (class 2606 OID 2738514)
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- TOC entry 5431 (class 2606 OID 2738546)
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- TOC entry 5433 (class 2606 OID 2738658)
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- TOC entry 5435 (class 2606 OID 2738516)
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- TOC entry 5437 (class 2606 OID 2738518)
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- TOC entry 5439 (class 2606 OID 2738520)
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- TOC entry 5441 (class 2606 OID 2738522)
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- TOC entry 5443 (class 2606 OID 2738684)
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- TOC entry 5445 (class 2606 OID 2738538)
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- TOC entry 5447 (class 2606 OID 2738536)
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- TOC entry 5449 (class 2606 OID 2738524)
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- TOC entry 5451 (class 2606 OID 2738526)
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- TOC entry 5453 (class 2606 OID 2738694)
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- TOC entry 5455 (class 2606 OID 2738698)
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- TOC entry 5457 (class 2606 OID 2738534)
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- TOC entry 5459 (class 2606 OID 2738792)
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- TOC entry 5461 (class 2606 OID 2738794)
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- TOC entry 5463 (class 2606 OID 2738796)
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- TOC entry 5465 (class 2606 OID 2738686)
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- TOC entry 5467 (class 2606 OID 2738532)
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- TOC entry 5469 (class 2606 OID 2738798)
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- TOC entry 5471 (class 2606 OID 2738364)
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- TOC entry 5473 (class 2606 OID 2738646)
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- TOC entry 5475 (class 2606 OID 2738800)
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- TOC entry 5477 (class 2606 OID 2738530)
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- TOC entry 5479 (class 2606 OID 2738588)
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- TOC entry 5481 (class 2606 OID 2738354)
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- TOC entry 5483 (class 2606 OID 2738528)
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- TOC entry 5485 (class 2606 OID 2738804)
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- TOC entry 5487 (class 2606 OID 2738688)
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- TOC entry 5489 (class 2606 OID 2738806)
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- TOC entry 5491 (class 2606 OID 2738622)
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- TOC entry 5493 (class 2606 OID 2738542)
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- TOC entry 5495 (class 2606 OID 2738620)
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- TOC entry 5497 (class 2606 OID 2738808)
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- TOC entry 5499 (class 2606 OID 2738544)
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- TOC entry 5501 (class 2606 OID 2738810)
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- TOC entry 5503 (class 2606 OID 2738812)
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- TOC entry 5505 (class 2606 OID 2738814)
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- TOC entry 5507 (class 2606 OID 2738618)
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- TOC entry 5509 (class 2606 OID 2738690)
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- TOC entry 5511 (class 2606 OID 2738644)
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- TOC entry 5513 (class 2606 OID 2738816)
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- TOC entry 5515 (class 2606 OID 2738616)
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- TOC entry 5517 (class 2606 OID 2738614)
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- TOC entry 5519 (class 2606 OID 2738612)
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- TOC entry 5521 (class 2606 OID 2738584)
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- TOC entry 5523 (class 2606 OID 2738610)
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- TOC entry 5525 (class 2606 OID 2738818)
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- TOC entry 5527 (class 2606 OID 2738608)
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- TOC entry 5529 (class 2606 OID 2738820)
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- TOC entry 5531 (class 2606 OID 2738594)
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- TOC entry 5533 (class 2606 OID 2738822)
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- TOC entry 5535 (class 2606 OID 2738824)
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- TOC entry 5537 (class 2606 OID 2738372)
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- TOC entry 5539 (class 2606 OID 2738606)
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- TOC entry 5541 (class 2606 OID 2738376)
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- TOC entry 5543 (class 2606 OID 2738378)
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- TOC entry 5545 (class 2606 OID 2738604)
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- TOC entry 5547 (class 2606 OID 2738380)
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- TOC entry 5549 (class 2606 OID 2738602)
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- TOC entry 5551 (class 2606 OID 2738382)
-- Name: users users_email_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);


--
-- TOC entry 5553 (class 2606 OID 1588876)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 7147 (class 2606 OID 2034140)
-- Name: ordersProducts ordersProducts_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 7148 (class 2606 OID 2034145)
-- Name: ordersProducts ordersProducts_purchasingOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_purchasingOrderId_fkey" FOREIGN KEY ("purchasingOrderId") REFERENCES public."purchasingOrders"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 7149 (class 2606 OID 2034150)
-- Name: ordersProducts ordersProducts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ordersProducts"
    ADD CONSTRAINT "ordersProducts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 7145 (class 2606 OID 1588959)
-- Name: productsIds productsIds_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7146 (class 2606 OID 1588954)
-- Name: productsIds productsIds_purchasingOrderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."productsIds"
    ADD CONSTRAINT "productsIds_purchasingOrderId_fkey" FOREIGN KEY ("purchasingOrderId") REFERENCES public."purchasingOrders"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7142 (class 2606 OID 2740569)
-- Name: products products_factoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_factoryId_fkey" FOREIGN KEY ("factoryId") REFERENCES public.factories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 7143 (class 2606 OID 2740574)
-- Name: products products_sectorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_sectorId_fkey" FOREIGN KEY ("sectorId") REFERENCES public.sectors(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 7144 (class 2606 OID 2034135)
-- Name: purchasingOrders purchasingOrders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."purchasingOrders"
    ADD CONSTRAINT "purchasingOrders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2024-08-28 15:34:20

--
-- PostgreSQL database dump complete
--

