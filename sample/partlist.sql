--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.3

-- Started on 2019-08-15 16:29:19 CEST

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

DROP DATABASE partlist;
--
-- TOC entry 3188 (class 1262 OID 16385)
-- Name: partlist; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE partlist WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE partlist OWNER TO postgres;

\connect partlist

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.part (
    id integer NOT NULL,
    part_number character varying(128),
    part_name character varying(256),
    vendor character varying(255),
    shipped timestamp with time zone,
    received timestamp with time zone,
    quantity integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.part OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.part_id_seq OWNER TO postgres;

--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 196
-- Name: part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.part_id_seq OWNED BY public.part.id;


--
-- TOC entry 3056 (class 2604 OID 16391)
-- Name: part id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.part ALTER COLUMN id SET DEFAULT nextval('public.part_id_seq'::regclass);


--
-- TOC entry 3182 (class 0 OID 16388)
-- Dependencies: 197
-- Data for Name: part; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (2, 'PSP567', 'Los Detalos', 'VagonWheels Inc.', '2019-05-22 04:07:26+02', '2019-08-03 19:24:14+02', 0);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (1, 'TST234', 'Test Part 234', 'Testimonial Producer', '2019-07-22 12:30:22+02', NULL, 5);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (3, '2cac812b44334fdb8c5699c1a3252216', 'Memory', 'AMD', '2017-01-15 00:00:00+01', '2017-04-04 00:00:00+02', 67);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (4, '36a9985a21a64474ad2e022c4badd7cf', 'SSD', 'NVIDIA', NULL, NULL, 20);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (5, '1be63d37701544e88db825688ffbb671', 'HDD', 'IBM', '2017-06-13 00:00:00+02', '2018-02-15 00:00:00+01', 94);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (6, '44357c28d6e24e0cadba56f31f9eaff3', 'Case', 'HP', '2019-06-23 00:00:00+02', '2019-05-19 00:00:00+02', 18);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (7, '611cbf320db346a8b14284bc210e593c', 'SSD', 'Lenovo', '2019-04-10 00:00:00+02', '2018-03-29 00:00:00+02', 25);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (8, '688dff51252b4030a790c6994293c705', 'Display', 'Эльбрус', '2018-06-01 00:00:00+02', '2017-04-25 00:00:00+02', 24);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (9, 'c051edb6f2dd4ade906630cdbd65baf7', 'Memory', 'Эльбрус', '2019-06-11 00:00:00+02', '2017-10-03 00:00:00+02', 80);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (10, '0c3075c30d674878aa9a237e4273e114', 'Display', 'IBM', '2017-03-15 00:00:00+01', NULL, 23);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (11, 'f60c6e56cd4948aa98145dbe6e595186', 'HDD', 'Lenovo', '2018-10-02 00:00:00+02', NULL, 64);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (12, 'c7cea648c61648db9fb28d541b0e61be', 'Fan', 'Apple', '2018-11-12 00:00:00+01', '2018-06-01 00:00:00+02', 55);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (13, 'c25f150c69a84bbdbb5b75ac4bcf2730', 'Keyboard', 'Apple', '2017-04-26 00:00:00+02', NULL, 47);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (14, 'f1a0c8fa8daf48019d1a9aa97a100f26', 'Processor', 'NVIDIA', '2018-10-18 00:00:00+02', '2018-09-26 00:00:00+02', 65);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (15, '8e60f9d0f4c6494890c7f635e4bdb6f6', 'Graphic Card', 'NVIDIA', '2017-08-22 00:00:00+02', NULL, 40);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (16, 'b1f4b9484d944652bd74392884b7059e', 'Processor', 'Acer', '2017-01-15 00:00:00+01', '2017-01-22 00:00:00+01', 0);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (17, 'ea01203f154e4b499b6405c40f2cad98', 'Processor', 'Samsung', '2019-06-17 00:00:00+02', '2018-12-14 00:00:00+01', 92);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (18, 'a3dfb5c6487342cdb8415e8d0e59bfea', 'Graphic Card', 'IBM', NULL, '2017-08-22 00:00:00+02', 26);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (19, '669af57c807a4fa3b2f0503bf69f914d', 'Graphic Card', 'Lenovo', '2017-09-25 00:00:00+02', '2018-05-26 00:00:00+02', 0);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (20, '7a2e8366d3404965a63b53a1cc7ca3d8', 'SSD', 'Эльбрус', NULL, '2017-10-22 00:00:00+02', 33);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (21, 'f1428a4e15454f0eb033201136e4848a', 'Keyboard', 'Эльбрус', '2018-09-26 00:00:00+02', '2017-03-10 00:00:00+01', 29);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (22, '18e572ae35f84c798a95dde1f4fde916', 'Mainboard', 'HP', '2018-04-01 00:00:00+02', NULL, 53);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (23, 'ed3ba216eb7f41d3acaa898129640b15', 'Fan', 'IBM', '2017-10-03 00:00:00+02', '2017-01-02 00:00:00+01', 62);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (24, '6482c202f1fc4c37bbfb97b720a6a611', 'Graphic Card', 'Samsung', '2017-02-13 00:00:00+01', '2017-12-06 00:00:00+01', 23);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (25, '9432215f78d041d19bc4307a4f43f77d', 'Fan', 'Lenovo', NULL, '2017-09-26 00:00:00+02', 40);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (26, '5e76780907bd4b4ba84ce93fb46aaafe', 'Display', 'AMD', NULL, '2018-02-20 00:00:00+01', 56);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (27, 'd93e64199b0d455b97f7251e54c432c0', 'Fan', 'HP', '2017-11-30 00:00:00+01', '2017-03-21 00:00:00+01', 75);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (28, '5d18c83fa30842c089356a399d49daad', 'SSD', 'IBM', '2018-04-09 00:00:00+02', '2019-02-19 00:00:00+01', 11);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (29, '564eb5cb0fb44bb2bd517dc8a89e7480', 'Keyboard', 'Эльбрус', NULL, '2017-08-13 00:00:00+02', 73);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (30, '15a08a3df3c243329cfc0f7f67fc1307', 'Graphic Card', 'NVIDIA', '2019-01-14 00:00:00+01', '2018-06-02 00:00:00+02', 41);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (31, 'd0de252b9a974552842c3c0425ff5b3e', 'Display', 'Acer', '2017-05-10 00:00:00+02', '2017-07-25 00:00:00+02', 2);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (32, '513e169da5784cfeb56fb2c22c21b8c7', 'Mainboard', 'MCI', '2019-03-27 00:00:00+01', NULL, 36);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (33, 'ae83d1a18590492d8ef7f329b6acc9d6', 'Processor', 'NVIDIA', '2017-10-25 00:00:00+02', '2017-09-09 00:00:00+02', 82);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (34, '592d76acabd84f01bc1c6bb4a0315909', 'Case', 'Samsung', '2017-12-08 00:00:00+01', '2019-05-12 00:00:00+02', 10);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (35, 'eb06f81196f94241bb374d3692030acf', 'HDD', 'Lenovo', NULL, '2018-10-12 00:00:00+02', 63);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (36, '491507064138420c90ce5ce6a84965b7', 'Processor', 'Lenovo', '2017-02-07 00:00:00+01', '2017-03-13 00:00:00+01', 31);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (37, '670523778b7d46b59c19f394fcdb4b61', 'Mainboard', 'HP', '2018-12-25 00:00:00+01', '2018-02-17 00:00:00+01', 47);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (38, '0b69e720c8af46d6a1cebdb885b53e02', 'Case', 'HP', '2017-10-25 00:00:00+02', '2018-05-21 00:00:00+02', 30);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (39, 'b5461aa414314e7884fce14d032f8561', 'Mainboard', 'AMD', '2019-06-04 00:00:00+02', '2018-01-06 00:00:00+01', 72);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (40, '846b6186cb3c4613a2475bdb8a8b088e', 'Mainboard', 'Apple', NULL, '2018-08-21 00:00:00+02', 72);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (41, '5705fe522a224b468f1f18e5bf494807', 'HDD', 'Apple', NULL, '2018-11-08 00:00:00+01', 76);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (42, 'b53f22098173490789df7f2145dae618', 'Memory', 'HP', NULL, NULL, 22);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (43, '1ad01ef1dd67461888b0f49c70a3a291', 'SSD', 'AMD', '2017-03-19 00:00:00+01', '2018-01-10 00:00:00+01', 96);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (44, '307e766f295a49ee98050973a6ce590a', 'Keyboard', 'AMD', '2017-01-23 00:00:00+01', NULL, 25);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (45, '1f3fe732d08f4cdcaba7bd5dc1c2e625', 'Graphic Card', 'Samsung', '2018-03-02 00:00:00+01', '2018-09-08 00:00:00+02', 22);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (46, 'e3572a990bc44d82b872452cb30d60f6', 'Mainboard', 'Acer', '2017-01-21 00:00:00+01', '2018-11-27 00:00:00+01', 58);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (47, '83fd2d30ad404066b054d71a43503221', 'SSD', 'MCI', '2017-03-29 00:00:00+02', NULL, 20);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (48, '9634ca1b12b643d68f28885f9e266c7c', 'SSD', 'Samsung', '2018-06-23 00:00:00+02', '2017-04-01 00:00:00+02', 49);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (49, '1be23f78f0c94629938f6a5e079e84c2', 'Fan', 'Lenovo', '2018-01-15 00:00:00+01', '2018-08-28 00:00:00+02', 0);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (50, '86998fda0d8d4b979f7a103c53c3ec47', 'Keyboard', 'AMD', '2018-01-25 00:00:00+01', '2018-06-17 00:00:00+02', 20);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (51, 'd055d2d0b91e4f03a3ad0a04b22d7df0', 'Graphic Card', 'MCI', '2017-05-12 00:00:00+02', '2017-11-14 00:00:00+01', 82);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (52, '40a56c3ff6834e3b961254b6dc49f8e5', 'Display', 'Эльбрус', '2017-01-15 00:00:00+01', '2017-11-03 00:00:00+01', 74);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (53, 'a805dbc9f742418fb8968670c083a5f5', 'Case', 'Samsung', '2017-03-23 00:00:00+01', '2019-03-31 00:00:00+01', 84);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (54, '4211575f15ee4aa3afdcd12b98026303', 'Keyboard', 'NVIDIA', '2017-04-27 00:00:00+02', '2018-01-02 00:00:00+01', 22);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (55, '5ac03c26ff52475db88d47842b97684c', 'Keyboard', 'MCI', '2018-01-23 00:00:00+01', NULL, 8);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (56, '4936a62d6cc446fc9748a1b49bdc9efe', 'SSD', 'Эльбрус', '2018-12-27 00:00:00+01', '2018-02-24 00:00:00+01', 50);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (57, 'a5699d6a897b4a25b8c69d4211deb3ea', 'Mainboard', 'NVIDIA', '2019-04-04 00:00:00+02', NULL, 12);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (58, 'de644f883aac4ce1b82dfecd269d0aa3', 'Memory', 'IBM', '2018-07-22 00:00:00+02', '2017-05-05 00:00:00+02', 39);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (59, 'd2c1c4196c854ad0994e876ce3a72af3', 'Case', 'IBM', '2019-04-16 00:00:00+02', '2017-02-09 00:00:00+01', 82);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (60, '60d07d7a4fda494f9289e85baec4c2b9', 'Memory', 'Acer', '2019-02-11 00:00:00+01', '2017-08-15 00:00:00+02', 33);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (61, '96c1cebc0fb94795a26de4482b8c42a5', 'Case', 'IBM', NULL, '2017-05-24 00:00:00+02', 91);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (62, '45ba6736a3874feb9c3b916db9e2b257', 'Fan', 'AMD', NULL, '2018-10-06 00:00:00+02', 25);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (63, '182d1a16fea9422db6b367ada8c90900', 'Mainboard', 'MCI', '2019-05-12 00:00:00+02', '2018-02-21 00:00:00+01', 86);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (64, '606bd12a4d4a4b908460f0f044f7e2df', 'Keyboard', 'MCI', '2017-12-18 00:00:00+01', NULL, 92);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (65, '82067d6f541343c98dd3f04b646ab014', 'Graphic Card', 'Эльбрус', '2017-09-13 00:00:00+02', NULL, 46);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (66, '66eeeb07fab14833a03bb212de4e262a', 'Mainboard', 'HP', NULL, '2019-06-16 00:00:00+02', 91);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (67, '7ff575c98efa48568cb204d708452863', 'Processor', 'Samsung', '2017-07-03 00:00:00+02', NULL, 8);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (68, '9eb0a4457652436fb9e4c0a57d9a4502', 'Keyboard', 'MCI', '2017-08-02 00:00:00+02', '2018-02-05 00:00:00+01', 25);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (69, '41431f5c77a8407081fde5b4d81ade5e', 'Case', 'Samsung', '2018-06-07 00:00:00+02', '2018-05-01 00:00:00+02', 66);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (70, '40ba0d7a41804a1bb88a368d1aaab0c5', 'Display', 'HP', '2019-02-25 00:00:00+01', '2017-06-13 00:00:00+02', 85);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (71, 'e7bd74c5052c42f1975e5c69e131b6af', 'HDD', 'NVIDIA', '2018-02-20 00:00:00+01', '2019-01-31 00:00:00+01', 0);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (72, 'fc509b1e530846b696c11c8981d5d413', 'Memory', 'HP', '2017-11-21 00:00:00+01', '2017-05-11 00:00:00+02', 7);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (73, '581ac79ad2164da697d17a9d0a769cf9', 'Keyboard', 'MCI', '2017-08-09 00:00:00+02', NULL, 66);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (74, '3cbc51eb638b4d0bb6cc2e39f6bd33ca', 'SSD', 'AMD', '2017-05-04 00:00:00+02', NULL, 36);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (75, '980877e61607489380eb5821ab2af191', 'Keyboard', 'Apple', NULL, '2019-04-04 00:00:00+02', 7);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (76, '37e8ba187a524194aabea8d01755a73c', 'Graphic Card', 'Lenovo', '2018-11-28 00:00:00+01', '2018-12-18 00:00:00+01', 52);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (77, 'ae500b46ada244f3bf1874373a31d23f', 'Display', 'HP', NULL, '2017-05-01 00:00:00+02', 68);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (78, 'b6857ad8939e4794b2344ee7b32e2569', 'Keyboard', 'Lenovo', '2019-01-04 00:00:00+01', '2017-01-02 00:00:00+01', 30);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (79, '84101036b6a64a22a583dfe673cd9ef6', 'Display', 'AMD', '2017-05-25 00:00:00+02', '2017-02-02 00:00:00+01', 59);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (80, 'b4ef77d99a824a53ae40c9ce50cd3173', 'Fan', 'Samsung', '2019-01-04 00:00:00+01', '2017-07-11 00:00:00+02', 4);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (81, '2bc04be803674c79ad95fbc0954ea18d', 'Mainboard', 'NVIDIA', '2018-09-03 00:00:00+02', '2017-08-06 00:00:00+02', 24);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (82, 'ec6a994548d44fb594e604d2fc455f33', 'Display', 'IBM', '2017-11-23 00:00:00+01', '2018-07-13 00:00:00+02', 11);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (83, '7be9f44f93754ababc84c840cf821451', 'Mainboard', 'NVIDIA', '2019-05-06 00:00:00+02', '2018-12-28 00:00:00+01', 45);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (84, '4c97b19954334c28a1484edf639a4268', 'Mainboard', 'IBM', '2018-07-29 00:00:00+02', '2017-06-03 00:00:00+02', 98);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (85, '06d8e620392243f08d34a9421abc60d8', 'Keyboard', 'NVIDIA', '2019-05-03 00:00:00+02', '2018-02-16 00:00:00+01', 10);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (86, '2c3b7d81a249417b936adc60c478a5b2', 'Graphic Card', 'MCI', '2017-07-27 00:00:00+02', NULL, 81);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (87, '293ccef35d504bca8ff6ef4a9f5c2e54', 'SSD', 'Эльбрус', '2018-03-01 00:00:00+01', NULL, 34);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (88, '5bf70147ff2340168347ac88d45fb4b9', 'HDD', 'Apple', '2018-01-20 00:00:00+01', '2018-07-08 00:00:00+02', 77);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (89, 'd343b14d68ed43a18c31e224b89bca11', 'Graphic Card', 'Apple', '2018-07-29 00:00:00+02', '2017-02-12 00:00:00+01', 94);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (90, '8d42b6de350747288cbae36e7d193c05', 'Keyboard', 'Эльбрус', '2017-04-10 00:00:00+02', NULL, 1);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (91, '268c2fa48b694d0c9fc07b12d6eece16', 'Display', 'IBM', '2017-07-31 00:00:00+02', '2018-04-12 00:00:00+02', 3);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (92, 'd03d10bbf0714d79b63450c8d3280513', 'Mainboard', 'Эльбрус', '2017-08-03 00:00:00+02', '2018-02-28 00:00:00+01', 99);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (93, '09b00d4fee654ed497303c4ccfd32e1c', 'HDD', 'Lenovo', '2018-11-09 00:00:00+01', '2017-09-06 00:00:00+02', 78);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (94, '6e9143ee308245cb9a0f855dbad3f448', 'Fan', 'Эльбрус', '2017-04-09 00:00:00+02', '2018-03-23 00:00:00+01', 98);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (95, 'df1957fa09bf41de9b5b3df6a0ab2a89', 'HDD', 'MCI', '2018-08-01 00:00:00+02', '2017-01-02 00:00:00+01', 74);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (96, '53aae730938e455493f888691fe38155', 'Graphic Card', 'Lenovo', NULL, '2017-03-12 00:00:00+01', 73);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (97, '05bdbad049234a489621e473a671dd80', 'SSD', 'Эльбрус', '2017-08-19 00:00:00+02', '2017-11-13 00:00:00+01', 67);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (98, '2a2f9fb34785447f8a4cc9e4c381e168', 'Keyboard', 'Эльбрус', '2019-07-14 00:00:00+02', '2019-06-07 00:00:00+02', 75);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (99, '6607bae350af4d9ebffae8e055a72738', 'Memory', 'MCI', '2018-04-25 00:00:00+02', '2018-09-10 00:00:00+02', 55);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (100, 'cb7b7cb0e3b748ff96cff06a6fbefe91', 'Display', 'IBM', '2017-11-06 00:00:00+01', '2017-08-22 00:00:00+02', 13);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (101, '60ca342716c94b57a3ee969a7b868acc', 'SSD', 'AMD', '2018-07-08 00:00:00+02', NULL, 91);
INSERT INTO public.part (id, part_number, part_name, vendor, shipped, received, quantity) VALUES (102, '014c5d708b854281b78ba98d1df6b462', 'SSD', 'MCI', '2018-09-28 00:00:00+02', NULL, 29);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 196
-- Name: part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.part_id_seq', 102, true);


--
-- TOC entry 3059 (class 2606 OID 16396)
-- Name: part part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.part
    ADD CONSTRAINT part_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: alexander
--

GRANT ALL ON SCHEMA public TO postgres;


-- Completed on 2019-08-15 16:29:19 CEST

--
-- PostgreSQL database dump complete
--

