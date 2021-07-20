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
-- Name: alert_bars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alert_bars (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text NOT NULL,
    button_text text,
    url text,
    active boolean DEFAULT false NOT NULL
);


--
-- Name: alert_bars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alert_bars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alert_bars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alert_bars_id_seq OWNED BY public.alert_bars.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contract_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contract_conditions (
    pricing_condition text,
    condition_title text,
    public_description text,
    type text,
    audience text[]
);


--
-- Name: email_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_messages (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email_body text,
    literature_asset_urls text[] DEFAULT '{}'::text[],
    customer_email text,
    status text,
    user_id bigint NOT NULL
);


--
-- Name: email_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_messages_id_seq OWNED BY public.email_messages.id;


--
-- Name: feedback_email_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedback_email_messages (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subject_line text,
    body text,
    sender_email text
);


--
-- Name: feedback_email_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feedback_email_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedback_email_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feedback_email_messages_id_seq OWNED BY public.feedback_email_messages.id;


--
-- Name: lead_passes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lead_passes (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name text,
    last_name text,
    company text,
    "position" text,
    phone text,
    email text,
    notes text,
    reference_instrument text,
    email_body text,
    training boolean,
    consulting_services boolean,
    qualifications boolean,
    instrument_service_plans boolean,
    region text,
    country text,
    zip text,
    user_id bigint,
    instrument_nickname text,
    serial_number text
);


--
-- Name: lead_passes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lead_passes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lead_passes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lead_passes_id_seq OWNED BY public.lead_passes.id;


--
-- Name: literatures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.literatures (
    public_title text,
    public_description text,
    asset_file_name text,
    asset_url text,
    literature_category text,
    literature_type text,
    audience text[],
    region text
);


--
-- Name: model_literatures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_literatures (
    model_id text,
    asset_url text
);


--
-- Name: model_qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_qualifications (
    model_id text,
    sku_nbr text
);


--
-- Name: model_trainings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.model_trainings (
    model_id text,
    sku_nbr text
);


--
-- Name: models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.models (
    model_id text,
    public_description text,
    status text,
	skus text,
    audience text[]
);


--
-- Name: packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.packages (
    pkg_sku text,
    pkg_parent_description text,
    component_sku text,
    component_sku_kind text NOT NULL,
    model_id text,
    component_type text,
    component_description text,
    pkg_qty text
);


--
-- Name: prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prices (
    sku_nbr text,
    cleansku text,
    source text,
    integration_id text,
    ty_list_price text,
    currency text,
    country text,
    region text,
    model_official text,
    pricing_condition text,
    pricing_condition_description text,
    product_manager text
);


--
-- Name: qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualifications (
    sku_nbr text,
    sku_description text,
    public_description text,
    category text,
    type text,
    division text,
    audience text[]
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: trainings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trainings (
    sku_nbr text,
    sku_name text,
    public_course_name text,
    public_course_description text,
    course_location text,
    duration text,
    quantity text,
    course_level text,
    course_type text,
    division text,
    platform text,
    audience text[]
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email text NOT NULL,
    country_code text NOT NULL,
    role text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: alert_bars id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alert_bars ALTER COLUMN id SET DEFAULT nextval('public.alert_bars_id_seq'::regclass);


--
-- Name: email_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_messages ALTER COLUMN id SET DEFAULT nextval('public.email_messages_id_seq'::regclass);


--
-- Name: feedback_email_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback_email_messages ALTER COLUMN id SET DEFAULT nextval('public.feedback_email_messages_id_seq'::regclass);


--
-- Name: lead_passes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lead_passes ALTER COLUMN id SET DEFAULT nextval('public.lead_passes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: alert_bars alert_bars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alert_bars
    ADD CONSTRAINT alert_bars_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: email_messages email_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_messages
    ADD CONSTRAINT email_messages_pkey PRIMARY KEY (id);


--
-- Name: feedback_email_messages feedback_email_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedback_email_messages
    ADD CONSTRAINT feedback_email_messages_pkey PRIMARY KEY (id);


--
-- Name: lead_passes lead_passes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lead_passes
    ADD CONSTRAINT lead_passes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: _contract_conditions_pricing_condition_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _contract_conditions_pricing_condition_idx ON public.contract_conditions USING btree (pricing_condition);


--
-- Name: _literatures_asset_url_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _literatures_asset_url_idx ON public.literatures USING btree (asset_url);


--
-- Name: _model_literatures_asset_url_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_literatures_asset_url_idx ON public.model_literatures USING btree (asset_url);


--
-- Name: _model_literatures_model_id_asset_url_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _model_literatures_model_id_asset_url_idx ON public.model_literatures USING btree (model_id, asset_url);


--
-- Name: _model_literatures_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_literatures_model_id_idx ON public.model_literatures USING btree (model_id);


--
-- Name: _model_qualifications_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_qualifications_model_id_idx ON public.model_qualifications USING btree (model_id);


--
-- Name: _model_qualifications_model_id_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _model_qualifications_model_id_sku_nbr_idx ON public.model_qualifications USING btree (model_id, sku_nbr);


--
-- Name: _model_qualifications_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_qualifications_sku_nbr_idx ON public.model_qualifications USING btree (sku_nbr);


--
-- Name: _model_trainings_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_trainings_model_id_idx ON public.model_trainings USING btree (model_id);


--
-- Name: _model_trainings_model_id_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _model_trainings_model_id_sku_nbr_idx ON public.model_trainings USING btree (model_id, sku_nbr);


--
-- Name: _model_trainings_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _model_trainings_sku_nbr_idx ON public.model_trainings USING btree (sku_nbr);


--
-- Name: _models_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _models_model_id_idx ON public.models USING btree (model_id);


--
-- Name: _models_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _models_status_idx ON public.models USING btree (status);


--
-- Name: _packages_component_type_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _packages_component_type_idx ON public.packages USING btree (component_type);


--
-- Name: _packages_model_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _packages_model_id_idx ON public.packages USING btree (model_id);


--
-- Name: _packages_pkg_sku_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _packages_pkg_sku_idx ON public.packages USING btree (pkg_sku);


--
-- Name: _prices_cleansku_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _prices_cleansku_idx ON public.prices USING btree (cleansku);


--
-- Name: _prices_cleansku_integration_id_country_source_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX _prices_cleansku_integration_id_country_source_idx ON public.prices USING btree (cleansku, integration_id, country, source);


--
-- Name: _prices_country_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _prices_country_idx ON public.prices USING btree (country);


--
-- Name: _prices_integration_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _prices_integration_id_idx ON public.prices USING btree (integration_id);


--
-- Name: _prices_model_official_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _prices_model_official_idx ON public.prices USING btree (model_official);


--
-- Name: _prices_pricing_condition_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _prices_pricing_condition_idx ON public.prices USING btree (pricing_condition);


--
-- Name: _qualifications_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _qualifications_sku_nbr_idx ON public.qualifications USING btree (sku_nbr);


--
-- Name: _trainings_sku_nbr_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX _trainings_sku_nbr_idx ON public.trainings USING btree (sku_nbr);


--
-- Name: index_alert_bars_on_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_alert_bars_on_active ON public.alert_bars USING btree (active) WHERE (active = true);


--
-- Name: index_email_messages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_messages_on_user_id ON public.email_messages USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210223180919'),
('20210314213605'),
('20210408233327'),
('20210413015513'),
('20210422193847'),
('20210422225051'),
('20210426030718');


