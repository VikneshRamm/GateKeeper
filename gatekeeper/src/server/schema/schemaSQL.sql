--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2019-12-26 02:09:40

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16403)
-- Name: CustomerDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerDetails" (
    "Name" name NOT NULL,
    "ContactNo" character varying(20) NOT NULL,
    "AlternateContactNo" character varying(20),
    "EmailID" character varying(70) NOT NULL,
    "TeamName" name,
    "CustomerID" integer NOT NULL,
    "LocationID" integer NOT NULL
);


ALTER TABLE public."CustomerDetails" OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE "CustomerDetails"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."CustomerDetails" IS 'Table to store details of a customer (person)';


--
-- TOC entry 209 (class 1259 OID 16508)
-- Name: CustomerDetails_CustomerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CustomerDetails_CustomerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CustomerDetails_CustomerID_seq" OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 209
-- Name: CustomerDetails_CustomerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CustomerDetails_CustomerID_seq" OWNED BY public."CustomerDetails"."CustomerID";


--
-- TOC entry 217 (class 1259 OID 16580)
-- Name: DeviceDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeviceDetails" (
    "DevicePK" integer NOT NULL,
    "DeviceUID" character varying(20) NOT NULL,
    "GatePassFK" integer NOT NULL,
    "DeviceName" name,
    "Description" character varying(200),
    "DeviceStatus" character varying(20),
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public."DeviceDetails" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16578)
-- Name: DeviceDetails_DevicePK_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DeviceDetails_DevicePK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DeviceDetails_DevicePK_seq" OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 216
-- Name: DeviceDetails_DevicePK_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DeviceDetails_DevicePK_seq" OWNED BY public."DeviceDetails"."DevicePK";


--
-- TOC entry 221 (class 1259 OID 16685)
-- Name: DeviceShipmentMap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeviceShipmentMap" (
    "ShipmentID" integer NOT NULL,
    "DeviceID" integer NOT NULL
);


ALTER TABLE public."DeviceShipmentMap" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16591)
-- Name: DeviceStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeviceStatus" (
    "DeviceStatus" character varying(20) NOT NULL
);


ALTER TABLE public."DeviceStatus" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16538)
-- Name: GatePassDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GatePassDetails" (
    "GatePassPK" integer NOT NULL,
    "GatePassExtID" character varying(50) NOT NULL,
    "GatePassRaisedBy" integer NOT NULL,
    "DeviceSentBy" integer NOT NULL,
    "IssueDate" date,
    "ReturnableStatus" boolean,
    "ReturnDate" date,
    "Comments" character varying(300),
    "ScannedCopyID" integer,
    "SolitonContact" integer,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public."GatePassDetails" OWNER TO postgres;

--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN "GatePassDetails"."GatePassExtID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."GatePassDetails"."GatePassExtID" IS 'Gate Pass Number as in Customer''s Copy';


--
-- TOC entry 212 (class 1259 OID 16536)
-- Name: GatePassDetails_GatePassPK_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GatePassDetails_GatePassPK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GatePassDetails_GatePassPK_seq" OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 212
-- Name: GatePassDetails_GatePassPK_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GatePassDetails_GatePassPK_seq" OWNED BY public."GatePassDetails"."GatePassPK";


--
-- TOC entry 215 (class 1259 OID 16549)
-- Name: GatePassImage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GatePassImage" (
    "GatePassCopyPK" integer NOT NULL,
    "ImageFileName" character varying(50) NOT NULL,
    "Image" bytea NOT NULL,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public."GatePassImage" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16547)
-- Name: GatePassImage_GatePassCopyPK_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GatePassImage_GatePassCopyPK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GatePassImage_GatePassCopyPK_seq" OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 214
-- Name: GatePassImage_GatePassCopyPK_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GatePassImage_GatePassCopyPK_seq" OWNED BY public."GatePassImage"."GatePassCopyPK";


--
-- TOC entry 206 (class 1259 OID 16417)
-- Name: LocationDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LocationDetails" (
    "Name" name NOT NULL,
    "Address" character varying(200) NOT NULL,
    "ContactNo" character varying(20) NOT NULL,
    "City" character varying(30),
    "State" character varying(30),
    "Country" character varying(30),
    "LocationID" integer NOT NULL,
    "LocationType" character varying(20) NOT NULL
);


ALTER TABLE public."LocationDetails" OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "LocationDetails"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."LocationDetails" IS 'Table to store location details of potential shipping locations';


--
-- TOC entry 207 (class 1259 OID 16424)
-- Name: LocationDetails_LocationID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LocationDetails_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."LocationDetails_LocationID_seq" OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 207
-- Name: LocationDetails_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LocationDetails_LocationID_seq" OWNED BY public."LocationDetails"."LocationID";


--
-- TOC entry 205 (class 1259 OID 16408)
-- Name: LocationType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LocationType" (
    "LocationType" character varying(20) NOT NULL
);


ALTER TABLE public."LocationType" OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "LocationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."LocationType" IS 'Type of the location as in - Soliton, Customer, External Vendor, etc';


--
-- TOC entry 223 (class 1259 OID 16704)
-- Name: ShipmentComments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShipmentComments" (
    "ShipmentCommentID" bigint NOT NULL,
    "ShipmentID" integer NOT NULL,
    "Comment" character varying(300) NOT NULL,
    "createdAt" date NOT NULL,
    "updatedAt" date NOT NULL
);


ALTER TABLE public."ShipmentComments" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16702)
-- Name: ShipmentComments_ShipmentCommentID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ShipmentComments_ShipmentCommentID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ShipmentComments_ShipmentCommentID_seq" OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 222
-- Name: ShipmentComments_ShipmentCommentID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ShipmentComments_ShipmentCommentID_seq" OWNED BY public."ShipmentComments"."ShipmentCommentID";


--
-- TOC entry 220 (class 1259 OID 16639)
-- Name: ShipmentDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShipmentDetails" (
    "ShipmentPK" integer NOT NULL,
    "ShipFrom" integer,
    "ShipTo" integer,
    "CustomerID" integer,
    "SolitonRespID" integer,
    "ShippingNinja" integer,
    "DeliveryDate" date,
    "ShipmentMode" character varying,
    "ShipmentStatus" character varying,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public."ShipmentDetails" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16637)
-- Name: ShipmentDetails_ShipmentPK_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ShipmentDetails_ShipmentPK_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ShipmentDetails_ShipmentPK_seq" OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 219
-- Name: ShipmentDetails_ShipmentPK_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ShipmentDetails_ShipmentPK_seq" OWNED BY public."ShipmentDetails"."ShipmentPK";


--
-- TOC entry 210 (class 1259 OID 16526)
-- Name: ShipmentMode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShipmentMode" (
    "ShipmentMode" character varying(50) NOT NULL
);


ALTER TABLE public."ShipmentMode" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16531)
-- Name: ShipmentStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ShipmentStatus" (
    "ShipmentStatus" character varying(50) NOT NULL
);


ALTER TABLE public."ShipmentStatus" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16398)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    "UserName" name NOT NULL,
    "UserNickName" name NOT NULL,
    "UserContactNo" character varying(20) NOT NULL,
    "UserAlternateContactNo" character varying(20),
    "UserEmailID" character varying(70) NOT NULL,
    "UserAccessLevel" integer NOT NULL,
    "UserID" integer NOT NULL,
    "UserLocation" integer NOT NULL,
    "createdAt" timestamp(4) with time zone,
    "updatedAt" timestamp(4) with time zone
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "Users"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Users" IS 'Table to store the user details of GateKeeper Application';


--
-- TOC entry 208 (class 1259 OID 16464)
-- Name: Users_UserID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_UserID_seq" OWNER TO postgres;

--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 208
-- Name: Users_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_UserID_seq" OWNED BY public."Users"."UserID";


--
-- TOC entry 2754 (class 2604 OID 16510)
-- Name: CustomerDetails CustomerID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerDetails" ALTER COLUMN "CustomerID" SET DEFAULT nextval('public."CustomerDetails_CustomerID_seq"'::regclass);


--
-- TOC entry 2758 (class 2604 OID 16583)
-- Name: DeviceDetails DevicePK; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceDetails" ALTER COLUMN "DevicePK" SET DEFAULT nextval('public."DeviceDetails_DevicePK_seq"'::regclass);


--
-- TOC entry 2756 (class 2604 OID 16541)
-- Name: GatePassDetails GatePassPK; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails" ALTER COLUMN "GatePassPK" SET DEFAULT nextval('public."GatePassDetails_GatePassPK_seq"'::regclass);


--
-- TOC entry 2757 (class 2604 OID 16552)
-- Name: GatePassImage GatePassCopyPK; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassImage" ALTER COLUMN "GatePassCopyPK" SET DEFAULT nextval('public."GatePassImage_GatePassCopyPK_seq"'::regclass);


--
-- TOC entry 2755 (class 2604 OID 16426)
-- Name: LocationDetails LocationID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationDetails" ALTER COLUMN "LocationID" SET DEFAULT nextval('public."LocationDetails_LocationID_seq"'::regclass);


--
-- TOC entry 2760 (class 2604 OID 16707)
-- Name: ShipmentComments ShipmentCommentID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentComments" ALTER COLUMN "ShipmentCommentID" SET DEFAULT nextval('public."ShipmentComments_ShipmentCommentID_seq"'::regclass);


--
-- TOC entry 2759 (class 2604 OID 16642)
-- Name: ShipmentDetails ShipmentPK; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails" ALTER COLUMN "ShipmentPK" SET DEFAULT nextval('public."ShipmentDetails_ShipmentPK_seq"'::regclass);


--
-- TOC entry 2753 (class 2604 OID 16466)
-- Name: Users UserID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN "UserID" SET DEFAULT nextval('public."Users_UserID_seq"'::regclass);


--
-- TOC entry 2941 (class 0 OID 16403)
-- Dependencies: 204
-- Data for Name: CustomerDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerDetails" ("Name", "ContactNo", "AlternateContactNo", "EmailID", "TeamName", "CustomerID", "LocationID") FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 16580)
-- Dependencies: 217
-- Data for Name: DeviceDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeviceDetails" ("DevicePK", "DeviceUID", "GatePassFK", "DeviceName", "Description", "DeviceStatus", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 16685)
-- Dependencies: 221
-- Data for Name: DeviceShipmentMap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeviceShipmentMap" ("ShipmentID", "DeviceID") FROM stdin;
\.


--
-- TOC entry 2955 (class 0 OID 16591)
-- Dependencies: 218
-- Data for Name: DeviceStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeviceStatus" ("DeviceStatus") FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 16538)
-- Dependencies: 213
-- Data for Name: GatePassDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GatePassDetails" ("GatePassPK", "GatePassExtID", "GatePassRaisedBy", "DeviceSentBy", "IssueDate", "ReturnableStatus", "ReturnDate", "Comments", "ScannedCopyID", "SolitonContact", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 16549)
-- Dependencies: 215
-- Data for Name: GatePassImage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GatePassImage" ("GatePassCopyPK", "ImageFileName", "Image", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 2943 (class 0 OID 16417)
-- Dependencies: 206
-- Data for Name: LocationDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LocationDetails" ("Name", "Address", "ContactNo", "City", "State", "Country", "LocationID", "LocationType") FROM stdin;
Soliton-CBE	Coimbatore	9894720852	Coimbatore	TamilNadu	India	1	Soliton
\.


--
-- TOC entry 2942 (class 0 OID 16408)
-- Dependencies: 205
-- Data for Name: LocationType; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LocationType" ("LocationType") FROM stdin;
Soliton
\.


--
-- TOC entry 2960 (class 0 OID 16704)
-- Dependencies: 223
-- Data for Name: ShipmentComments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShipmentComments" ("ShipmentCommentID", "ShipmentID", "Comment", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 2957 (class 0 OID 16639)
-- Dependencies: 220
-- Data for Name: ShipmentDetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShipmentDetails" ("ShipmentPK", "ShipFrom", "ShipTo", "CustomerID", "SolitonRespID", "ShippingNinja", "DeliveryDate", "ShipmentMode", "ShipmentStatus", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 16526)
-- Dependencies: 210
-- Data for Name: ShipmentMode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShipmentMode" ("ShipmentMode") FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 16531)
-- Dependencies: 211
-- Data for Name: ShipmentStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ShipmentStatus" ("ShipmentStatus") FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 16398)
-- Dependencies: 203
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" ("UserName", "UserNickName", "UserContactNo", "UserAlternateContactNo", "UserEmailID", "UserAccessLevel", "UserID", "UserLocation", "createdAt", "updatedAt") FROM stdin;
Sudharsan	Susan	+919894720852	\N	sudharsan.varadharajan@solitontech.com	5	3	1	2019-12-25 00:00:00+05:30	2019-12-25 00:00:00+05:30
Sudharsan	Susan	+919894720852	\N	sudharsan.varadharajan@solitontech.com	5	4	1	2019-12-25 00:00:00+05:30	2019-12-25 00:00:00+05:30
Sudharsan	Susan	+919894720852	\N	sudharsan.varadharajan@solitontech.com	5	5	1	2019-12-25 00:00:00+05:30	2019-12-25 00:00:00+05:30
Sudharsan	Susan	+919894720852	\N	sudharsan.varadharajan@solitontech.com	5	6	1	2019-12-26 00:34:08.096+05:30	2019-12-26 00:34:08.097+05:30
\.


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 209
-- Name: CustomerDetails_CustomerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CustomerDetails_CustomerID_seq"', 1, false);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 216
-- Name: DeviceDetails_DevicePK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DeviceDetails_DevicePK_seq"', 1, false);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 212
-- Name: GatePassDetails_GatePassPK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GatePassDetails_GatePassPK_seq"', 1, false);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 214
-- Name: GatePassImage_GatePassCopyPK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GatePassImage_GatePassCopyPK_seq"', 1, false);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 207
-- Name: LocationDetails_LocationID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LocationDetails_LocationID_seq"', 1, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 222
-- Name: ShipmentComments_ShipmentCommentID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ShipmentComments_ShipmentCommentID_seq"', 1, false);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 219
-- Name: ShipmentDetails_ShipmentPK_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ShipmentDetails_ShipmentPK_seq"', 1, false);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 208
-- Name: Users_UserID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_UserID_seq"', 6, true);


--
-- TOC entry 2764 (class 2606 OID 16515)
-- Name: CustomerDetails CustomerDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerDetails"
    ADD CONSTRAINT "CustomerDetails_pkey" PRIMARY KEY ("CustomerID");


--
-- TOC entry 2782 (class 2606 OID 16585)
-- Name: DeviceDetails DeviceDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceDetails"
    ADD CONSTRAINT "DeviceDetails_pkey" PRIMARY KEY ("DevicePK");


--
-- TOC entry 2786 (class 2606 OID 16595)
-- Name: DeviceStatus DeviceStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceStatus"
    ADD CONSTRAINT "DeviceStatus_pkey" PRIMARY KEY ("DeviceStatus");


--
-- TOC entry 2776 (class 2606 OID 16546)
-- Name: GatePassDetails GatePassDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "GatePassDetails_pkey" PRIMARY KEY ("GatePassPK");


--
-- TOC entry 2780 (class 2606 OID 16557)
-- Name: GatePassImage GatePassImage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassImage"
    ADD CONSTRAINT "GatePassImage_pkey" PRIMARY KEY ("GatePassCopyPK");


--
-- TOC entry 2770 (class 2606 OID 16431)
-- Name: LocationDetails LocationDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationDetails"
    ADD CONSTRAINT "LocationDetails_pkey" PRIMARY KEY ("LocationID");


--
-- TOC entry 2766 (class 2606 OID 16722)
-- Name: LocationType LocationType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationType"
    ADD CONSTRAINT "LocationType_pkey" PRIMARY KEY ("LocationType");


--
-- TOC entry 2790 (class 2606 OID 16689)
-- Name: DeviceShipmentMap PK_ShipmentDeviceMap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceShipmentMap"
    ADD CONSTRAINT "PK_ShipmentDeviceMap" PRIMARY KEY ("ShipmentID", "DeviceID");


--
-- TOC entry 2794 (class 2606 OID 16709)
-- Name: ShipmentComments ShipmentComments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentComments"
    ADD CONSTRAINT "ShipmentComments_pkey" PRIMARY KEY ("ShipmentCommentID", "ShipmentID");


--
-- TOC entry 2788 (class 2606 OID 16647)
-- Name: ShipmentDetails ShipmentDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "ShipmentDetails_pkey" PRIMARY KEY ("ShipmentPK");


--
-- TOC entry 2772 (class 2606 OID 16530)
-- Name: ShipmentMode ShipmentMode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentMode"
    ADD CONSTRAINT "ShipmentMode_pkey" PRIMARY KEY ("ShipmentMode");


--
-- TOC entry 2774 (class 2606 OID 16535)
-- Name: ShipmentStatus ShipmentStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentStatus"
    ADD CONSTRAINT "ShipmentStatus_pkey" PRIMARY KEY ("ShipmentStatus");


--
-- TOC entry 2778 (class 2606 OID 16684)
-- Name: GatePassDetails UQ_GatePassExtID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "UQ_GatePassExtID" UNIQUE ("GatePassExtID");


--
-- TOC entry 2768 (class 2606 OID 16716)
-- Name: LocationType UQ_LocationType; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationType"
    ADD CONSTRAINT "UQ_LocationType" UNIQUE ("LocationType") INCLUDE ("LocationType");


--
-- TOC entry 2792 (class 2606 OID 16691)
-- Name: DeviceShipmentMap UQ_ShipmentDeviceMap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceShipmentMap"
    ADD CONSTRAINT "UQ_ShipmentDeviceMap" UNIQUE ("ShipmentID", "DeviceID");


--
-- TOC entry 2784 (class 2606 OID 16614)
-- Name: DeviceDetails UQ_UID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceDetails"
    ADD CONSTRAINT "UQ_UID" UNIQUE ("DeviceUID");


--
-- TOC entry 2762 (class 2606 OID 16471)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("UserID");


--
-- TOC entry 2806 (class 2606 OID 16658)
-- Name: ShipmentDetails FK_CustomerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_CustomerID" FOREIGN KEY ("CustomerID") REFERENCES public."CustomerDetails"("CustomerID") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2812 (class 2606 OID 16697)
-- Name: DeviceShipmentMap FK_DeviceID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceShipmentMap"
    ADD CONSTRAINT "FK_DeviceID" FOREIGN KEY ("DeviceID") REFERENCES public."DeviceDetails"("DevicePK") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2799 (class 2606 OID 16563)
-- Name: GatePassDetails FK_DeviceSentBy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "FK_DeviceSentBy" FOREIGN KEY ("DeviceSentBy") REFERENCES public."CustomerDetails"("CustomerID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2803 (class 2606 OID 16597)
-- Name: DeviceDetails FK_DeviceStatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceDetails"
    ADD CONSTRAINT "FK_DeviceStatus" FOREIGN KEY ("DeviceStatus") REFERENCES public."DeviceStatus"("DeviceStatus") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2802 (class 2606 OID 16586)
-- Name: DeviceDetails FK_GatePassDetails; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceDetails"
    ADD CONSTRAINT "FK_GatePassDetails" FOREIGN KEY ("GatePassFK") REFERENCES public."GatePassDetails"("GatePassPK") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2796 (class 2606 OID 16516)
-- Name: CustomerDetails FK_LocationID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerDetails"
    ADD CONSTRAINT "FK_LocationID" FOREIGN KEY ("LocationID") REFERENCES public."LocationDetails"("LocationID") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2797 (class 2606 OID 16723)
-- Name: LocationDetails FK_LocationType; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LocationDetails"
    ADD CONSTRAINT "FK_LocationType" FOREIGN KEY ("LocationType") REFERENCES public."LocationType"("LocationType") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2798 (class 2606 OID 16558)
-- Name: GatePassDetails FK_RaisedBy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "FK_RaisedBy" FOREIGN KEY ("GatePassRaisedBy") REFERENCES public."CustomerDetails"("CustomerID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2800 (class 2606 OID 16568)
-- Name: GatePassDetails FK_ScannedCopy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "FK_ScannedCopy" FOREIGN KEY ("ScannedCopyID") REFERENCES public."GatePassImage"("GatePassCopyPK") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2804 (class 2606 OID 16648)
-- Name: ShipmentDetails FK_ShipmentFromLocation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_ShipmentFromLocation" FOREIGN KEY ("ShipFrom") REFERENCES public."LocationDetails"("LocationID") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2811 (class 2606 OID 16692)
-- Name: DeviceShipmentMap FK_ShipmentID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceShipmentMap"
    ADD CONSTRAINT "FK_ShipmentID" FOREIGN KEY ("ShipmentID") REFERENCES public."ShipmentDetails"("ShipmentPK") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2813 (class 2606 OID 16710)
-- Name: ShipmentComments FK_ShipmentID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentComments"
    ADD CONSTRAINT "FK_ShipmentID" FOREIGN KEY ("ShipmentID") REFERENCES public."ShipmentDetails"("ShipmentPK") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2805 (class 2606 OID 16653)
-- Name: ShipmentDetails FK_ShipmentToLocation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_ShipmentToLocation" FOREIGN KEY ("ShipTo") REFERENCES public."LocationDetails"("LocationID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2809 (class 2606 OID 16673)
-- Name: ShipmentDetails FK_ShippingMode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_ShippingMode" FOREIGN KEY ("ShipmentMode") REFERENCES public."ShipmentMode"("ShipmentMode") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2808 (class 2606 OID 16668)
-- Name: ShipmentDetails FK_ShippingNinja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_ShippingNinja" FOREIGN KEY ("ShippingNinja") REFERENCES public."Users"("UserID") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2810 (class 2606 OID 16678)
-- Name: ShipmentDetails FK_ShippingStatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_ShippingStatus" FOREIGN KEY ("ShipmentStatus") REFERENCES public."ShipmentStatus"("ShipmentStatus") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2801 (class 2606 OID 16573)
-- Name: GatePassDetails FK_SolitonContact; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatePassDetails"
    ADD CONSTRAINT "FK_SolitonContact" FOREIGN KEY ("SolitonContact") REFERENCES public."Users"("UserID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2807 (class 2606 OID 16663)
-- Name: ShipmentDetails FK_SolitonRespID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ShipmentDetails"
    ADD CONSTRAINT "FK_SolitonRespID" FOREIGN KEY ("SolitonRespID") REFERENCES public."Users"("UserID") ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 2795 (class 2606 OID 16521)
-- Name: Users FK_UserLocation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "FK_UserLocation" FOREIGN KEY ("UserLocation") REFERENCES public."LocationDetails"("LocationID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


-- Completed on 2019-12-26 02:09:41

--
-- PostgreSQL database dump complete
--

