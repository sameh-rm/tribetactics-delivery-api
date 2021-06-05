--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: foodMenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."foodMenu" (
    id integer NOT NULL,
    title integer NOT NULL
);


ALTER TABLE public."foodMenu" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."foodMenu_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."foodMenu_id_seq" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."foodMenu_id_seq" OWNED BY public."foodMenu".id;


--
-- Name: fooditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fooditem (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.fooditem OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fooditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fooditem_id_seq OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fooditem_id_seq OWNED BY public.fooditem.id;


--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    id integer NOT NULL,
    "foodItemName" character varying NOT NULL,
    "unitPrice" double precision NOT NULL,
    "subTotal" double precision NOT NULL,
    qty integer NOT NULL,
    fooditem_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitems_id_seq OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_id_seq OWNED BY public.orderitems.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "orderedAt" timestamp without time zone NOT NULL,
    "deliveredAt" character varying,
    total double precision NOT NULL,
    "paymentMethod" character varying NOT NULL,
    status boolean NOT NULL,
    "shippingInfo_id" integer NOT NULL,
    "shippingCost" double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: resturant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resturant (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    brand character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.resturant OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resturant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resturant_id_seq OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resturant_id_seq OWNED BY public.resturant.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: shippinginfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippinginfo (
    id integer NOT NULL,
    address character varying NOT NULL,
    city character varying
);


ALTER TABLE public.shippinginfo OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shippinginfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippinginfo_id_seq OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shippinginfo_id_seq OWNED BY public.shippinginfo.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: foodMenu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu" ALTER COLUMN id SET DEFAULT nextval('public."foodMenu_id_seq"'::regclass);


--
-- Name: fooditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem ALTER COLUMN id SET DEFAULT nextval('public.fooditem_id_seq'::regclass);


--
-- Name: orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN id SET DEFAULT nextval('public.orderitems_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: resturant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant ALTER COLUMN id SET DEFAULT nextval('public.resturant_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: shippinginfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo ALTER COLUMN id SET DEFAULT nextval('public.shippinginfo_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
6ea533fc9b86
\.


--
-- Data for Name: foodMenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."foodMenu" (id, title) FROM stdin;
\.


--
-- Data for Name: fooditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fooditem (id, name, price) FROM stdin;
\.


--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (id, "foodItemName", "unitPrice", "subTotal", qty, fooditem_id, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "orderedAt", "deliveredAt", total, "paymentMethod", status, "shippingInfo_id", "shippingCost") FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, title) FROM stdin;
1	can-get:user
2	can-getall:user
3	can-delete:user
4	can-update:user
5	can-delete:foodmenu
6	can-update:foodmenu
7	can-create:foodmenu
8	can-get:foodmenu
9	can-getall:foodmenu
10	can-delete:resturant
11	can-update:resturant
12	can-create:resturant
13	can-get:resturant
14	can-getall:resturant
15	can-delete:fooditem
16	can-update:fooditem
17	can-create:fooditem
18	can-get:fooditem
19	can-getall:fooditem
20	can-delete:order
21	can-update:order
22	can-create:order
23	can-get:order
24	can-getall:order
\.


--
-- Data for Name: resturant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resturant (id, title, description, brand, phone, email) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, title) FROM stdin;
1	ADMIN
2	RESTAURANT
3	customer
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, role_id, permission_id) FROM stdin;
\.


--
-- Data for Name: shippinginfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippinginfo (id, address, city) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, name, email, password, role_id) FROM stdin;
\.


--
-- Name: foodMenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."foodMenu_id_seq"', 1, false);


--
-- Name: fooditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fooditem_id_seq', 1, false);


--
-- Name: orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 24, true);


--
-- Name: resturant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resturant_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 1, false);


--
-- Name: shippinginfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippinginfo_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: foodMenu foodMenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_pkey" PRIMARY KEY (id);


--
-- Name: fooditem fooditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem
    ADD CONSTRAINT fooditem_pkey PRIMARY KEY (id);


--
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: permission permission_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_title_key UNIQUE (title);


--
-- Name: resturant resturant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_pkey PRIMARY KEY (id);


--
-- Name: resturant resturant_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_title_key UNIQUE (title);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role role_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_title_key UNIQUE (title);


--
-- Name: shippinginfo shippinginfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo
    ADD CONSTRAINT shippinginfo_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: foodMenu foodMenu_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_title_fkey" FOREIGN KEY (title) REFERENCES public.role(id);


--
-- Name: orderitems orderitems_fooditem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_fooditem_id_fkey FOREIGN KEY (fooditem_id) REFERENCES public.fooditem(id);


--
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_shippingInfo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_shippingInfo_id_fkey" FOREIGN KEY ("shippingInfo_id") REFERENCES public.shippinginfo(id);


--
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permission(id);


--
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: foodMenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."foodMenu" (
    id integer NOT NULL,
    title integer NOT NULL,
    resturant_id integer NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public."foodMenu" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."foodMenu_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."foodMenu_id_seq" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."foodMenu_id_seq" OWNED BY public."foodMenu".id;


--
-- Name: fooditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fooditem (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.fooditem OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fooditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fooditem_id_seq OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fooditem_id_seq OWNED BY public.fooditem.id;


--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    id integer NOT NULL,
    "foodItemName" character varying NOT NULL,
    "unitPrice" double precision NOT NULL,
    "subTotal" double precision NOT NULL,
    qty integer NOT NULL,
    fooditem_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitems_id_seq OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_id_seq OWNED BY public.orderitems.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "orderedAt" timestamp without time zone NOT NULL,
    "deliveredAt" character varying,
    total double precision NOT NULL,
    "paymentMethod" character varying NOT NULL,
    status boolean NOT NULL,
    "shippingInfo_id" integer NOT NULL,
    "shippingCost" double precision NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: resturant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resturant (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    brand character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.resturant OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resturant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resturant_id_seq OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resturant_id_seq OWNED BY public.resturant.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: shippinginfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippinginfo (
    id integer NOT NULL,
    address character varying NOT NULL,
    city character varying
);


ALTER TABLE public.shippinginfo OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shippinginfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippinginfo_id_seq OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shippinginfo_id_seq OWNED BY public.shippinginfo.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: foodMenu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu" ALTER COLUMN id SET DEFAULT nextval('public."foodMenu_id_seq"'::regclass);


--
-- Name: fooditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem ALTER COLUMN id SET DEFAULT nextval('public.fooditem_id_seq'::regclass);


--
-- Name: orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN id SET DEFAULT nextval('public.orderitems_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: resturant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant ALTER COLUMN id SET DEFAULT nextval('public.resturant_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: shippinginfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo ALTER COLUMN id SET DEFAULT nextval('public.shippinginfo_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
e2b94fa0fb12
\.


--
-- Data for Name: foodMenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."foodMenu" (id, title, resturant_id, description) FROM stdin;
\.


--
-- Data for Name: fooditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fooditem (id, name, price, menu_id) FROM stdin;
\.


--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (id, "foodItemName", "unitPrice", "subTotal", qty, fooditem_id, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "orderedAt", "deliveredAt", total, "paymentMethod", status, "shippingInfo_id", "shippingCost", user_id) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, title) FROM stdin;
1	can-get:user
2	can-getall:user
3	can-delete:user
4	can-update:user
5	can-delete:foodmenu
6	can-update:foodmenu
7	can-create:foodmenu
8	can-get:foodmenu
9	can-getall:foodmenu
10	can-delete:resturant
11	can-update:resturant
12	can-create:resturant
13	can-get:resturant
14	can-getall:resturant
15	can-delete:fooditem
16	can-update:fooditem
17	can-create:fooditem
18	can-get:fooditem
19	can-getall:fooditem
20	can-delete:order
21	can-update:order
22	can-create:order
23	can-get:order
24	can-getall:order
\.


--
-- Data for Name: resturant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resturant (id, title, description, brand, phone, email, user_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, title) FROM stdin;
1	ADMIN
2	RESTAURANT
3	customer
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, role_id, permission_id) FROM stdin;
1	2	1
2	2	4
3	2	5
4	2	6
5	2	7
6	2	8
7	2	9
8	2	11
9	2	13
10	2	14
11	2	15
12	2	16
13	2	17
14	2	18
15	2	19
16	2	21
17	2	23
18	2	24
19	3	1
20	3	4
21	3	8
22	3	9
23	3	13
24	3	14
25	3	18
26	3	19
27	3	21
28	3	20
29	3	23
30	3	23
31	3	24
\.


--
-- Data for Name: shippinginfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippinginfo (id, address, city) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, name, email, password, role_id) FROM stdin;
\.


--
-- Name: foodMenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."foodMenu_id_seq"', 1, false);


--
-- Name: fooditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fooditem_id_seq', 1, false);


--
-- Name: orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 24, true);


--
-- Name: resturant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resturant_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 31, true);


--
-- Name: shippinginfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippinginfo_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 6, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: foodMenu foodMenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_pkey" PRIMARY KEY (id);


--
-- Name: fooditem fooditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem
    ADD CONSTRAINT fooditem_pkey PRIMARY KEY (id);


--
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: permission permission_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_title_key UNIQUE (title);


--
-- Name: resturant resturant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_pkey PRIMARY KEY (id);


--
-- Name: resturant resturant_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_title_key UNIQUE (title);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role role_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_title_key UNIQUE (title);


--
-- Name: shippinginfo shippinginfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo
    ADD CONSTRAINT shippinginfo_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: foodMenu foodMenu_resturant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_resturant_id_fkey" FOREIGN KEY (resturant_id) REFERENCES public.resturant(id);


--
-- Name: fooditem fooditem_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem
    ADD CONSTRAINT fooditem_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public."foodMenu"(id);


--
-- Name: orderitems orderitems_fooditem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_fooditem_id_fkey FOREIGN KEY (fooditem_id) REFERENCES public.fooditem(id);


--
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_shippingInfo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_shippingInfo_id_fkey" FOREIGN KEY ("shippingInfo_id") REFERENCES public.shippinginfo(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: resturant resturant_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permission(id);


--
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: foodMenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."foodMenu" (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    resturant_id integer NOT NULL
);


ALTER TABLE public."foodMenu" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."foodMenu_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."foodMenu_id_seq" OWNER TO postgres;

--
-- Name: foodMenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."foodMenu_id_seq" OWNED BY public."foodMenu".id;


--
-- Name: fooditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fooditem (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.fooditem OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fooditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fooditem_id_seq OWNER TO postgres;

--
-- Name: fooditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fooditem_id_seq OWNED BY public.fooditem.id;


--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    id integer NOT NULL,
    "foodItemName" character varying NOT NULL,
    "unitPrice" double precision NOT NULL,
    "subTotal" double precision NOT NULL,
    qty integer NOT NULL,
    fooditem_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitems_id_seq OWNER TO postgres;

--
-- Name: orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_id_seq OWNED BY public.orderitems.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "orderedAt" timestamp without time zone NOT NULL,
    "deliveredAt" character varying,
    total double precision NOT NULL,
    "paymentMethod" character varying NOT NULL,
    status boolean NOT NULL,
    user_id integer NOT NULL,
    "shippingInfo_id" integer NOT NULL,
    "shippingCost" double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

--
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- Name: resturant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resturant (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    brand character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.resturant OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resturant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resturant_id_seq OWNER TO postgres;

--
-- Name: resturant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resturant_id_seq OWNED BY public.resturant.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permissions_id_seq OWNER TO postgres;

--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: shippinginfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippinginfo (
    id integer NOT NULL,
    address character varying NOT NULL,
    city character varying
);


ALTER TABLE public.shippinginfo OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shippinginfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippinginfo_id_seq OWNER TO postgres;

--
-- Name: shippinginfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shippinginfo_id_seq OWNED BY public.shippinginfo.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: foodMenu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu" ALTER COLUMN id SET DEFAULT nextval('public."foodMenu_id_seq"'::regclass);


--
-- Name: fooditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem ALTER COLUMN id SET DEFAULT nextval('public.fooditem_id_seq'::regclass);


--
-- Name: orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN id SET DEFAULT nextval('public.orderitems_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- Name: resturant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant ALTER COLUMN id SET DEFAULT nextval('public.resturant_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: shippinginfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo ALTER COLUMN id SET DEFAULT nextval('public.shippinginfo_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
e342fb7d6753
\.


--
-- Data for Name: foodMenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."foodMenu" (id, title, description, resturant_id) FROM stdin;
\.


--
-- Data for Name: fooditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fooditem (id, name, price, menu_id) FROM stdin;
\.


--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderitems (id, "foodItemName", "unitPrice", "subTotal", qty, fooditem_id, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, "orderedAt", "deliveredAt", total, "paymentMethod", status, user_id, "shippingInfo_id", "shippingCost") FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, title) FROM stdin;
1	can-get:user
2	can-getall:user
3	can-create:user
4	can-update:user
5	can-delete:user
6	can-get:restaurant
7	can-getall:restaurant
8	can-create:restaurant
9	can-update:restaurant
10	can-delete:restaurant
11	can-get:foodmenu
12	can-getall:foodmenu
13	can-create:foodmenu
14	can-update:foodmenu
15	can-delete:foodmenu
16	can-get:fooditem
17	can-getall:fooditem
18	can-create:fooditem
19	can-update:fooditem
20	can-delete:fooditem
21	can-get:order
22	can-getall:order
23	can-create:order
24	can-update:order
25	can-delete:order
\.


--
-- Data for Name: resturant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resturant (id, title, description, brand, phone, email, user_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, title) FROM stdin;
1	ADMIN
2	RESTAURANT
3	CUSTOMER
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permissions (id, role_id, permission_id) FROM stdin;
1	2	1
2	2	4
3	2	6
4	2	7
5	2	9
6	2	11
7	2	12
8	2	13
9	2	14
10	2	15
11	2	16
12	2	17
13	2	18
14	2	19
15	2	20
16	2	21
17	2	22
18	2	24
19	3	1
20	3	4
21	3	6
22	3	7
23	3	11
24	3	12
25	3	16
26	3	17
27	3	21
28	3	22
29	3	23
30	3	24
31	3	25
\.


--
-- Data for Name: shippinginfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippinginfo (id, address, city) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, name, email, password, role_id) FROM stdin;
\.


--
-- Name: foodMenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."foodMenu_id_seq"', 1, false);


--
-- Name: fooditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fooditem_id_seq', 1, false);


--
-- Name: orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 25, true);


--
-- Name: resturant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resturant_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_permissions_id_seq', 31, true);


--
-- Name: shippinginfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippinginfo_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: foodMenu foodMenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_pkey" PRIMARY KEY (id);


--
-- Name: fooditem fooditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem
    ADD CONSTRAINT fooditem_pkey PRIMARY KEY (id);


--
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- Name: permission permission_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_title_key UNIQUE (title);


--
-- Name: resturant resturant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_pkey PRIMARY KEY (id);


--
-- Name: resturant resturant_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_title_key UNIQUE (title);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: role role_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_title_key UNIQUE (title);


--
-- Name: shippinginfo shippinginfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippinginfo
    ADD CONSTRAINT shippinginfo_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: foodMenu foodMenu_resturant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."foodMenu"
    ADD CONSTRAINT "foodMenu_resturant_id_fkey" FOREIGN KEY (resturant_id) REFERENCES public.resturant(id);


--
-- Name: fooditem fooditem_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fooditem
    ADD CONSTRAINT fooditem_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public."foodMenu"(id);


--
-- Name: orderitems orderitems_fooditem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_fooditem_id_fkey FOREIGN KEY (fooditem_id) REFERENCES public.fooditem(id);


--
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_shippingInfo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_shippingInfo_id_fkey" FOREIGN KEY ("shippingInfo_id") REFERENCES public.shippinginfo(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: resturant resturant_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resturant
    ADD CONSTRAINT resturant_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permission(id);


--
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

