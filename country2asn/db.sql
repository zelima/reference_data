--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: country_asn; Type: TABLE; Schema: public; Owner: aaron
--

CREATE TABLE country_asn (
    "place.cc" character varying(2) not null,
    asn integer not null,
    ts timestamp with time zone not null
);


ALTER TABLE country_asn OWNER TO aaron;

--
-- Name: idx_country_asn_asn; Type: INDEX; Schema: public; Owner: aaron
--

CREATE INDEX idx_country_asn_asn ON country_asn USING btree (asn);


--
-- Name: idx_country_asn_cc; Type: INDEX; Schema: public; Owner: aaron
--

CREATE INDEX idx_country_asn_cc ON country_asn USING btree ("place.cc");


--
-- PostgreSQL database dump complete
--

