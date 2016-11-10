-- Table: People

-- DROP TABLE People;

CREATE TABLE People
(
  PID character NOT NULL,
  name text,
  address text,
  spouseName text,
  CONSTRAINT People_pkey PRIMARY KEY (PID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE People
  OWNER TO postgres;

-- Table: Actor

-- DROP TABLE Actor;

CREATE TABLE Actor
(
  PID character NOT NULL,
  AID text,
  CONSTRAINT Actor_pkey PRIMARY KEY (PID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Actor
  OWNER TO postgres;

-- Table: Director

-- DROP TABLE Director;

CREATE TABLE Director
(
  PID character NOT NULL,
  DID text,
  CONSTRAINT Director_pkey PRIMARY KEY (PID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Director
  OWNER TO postgres;

-- Table: Actor_Info

-- DROP TABLE Actor_Info;

CREATE TABLE Actor_Info
(
  AID character NOT NULL,
  act_guild_date date,
  favorite_color text,
  CONSTRAINT Actor_Info_pkey PRIMARY KEY (AID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Actor_Info
  OWNER TO postgres;

-- Table: Actor_Qualities

-- DROP TABLE Actor_Qualities;

CREATE TABLE Actor_Qualities
(
  AID character NOT NULL,
  hair_color text,
  birth_date Date,
  eye_color text,
  height_inches int,
  weight_lbs int,
  CONSTRAINT Actor_Qualities_pkey PRIMARY KEY (AID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Actor_Qualities
  OWNER TO postgres;

-- Table: Director_info

-- DROP TABLE Director_info;

CREATE TABLE Director_info
(
  DID character NOT NULL,
  dir_guild_date Date,
  film_school text,
  favorite_lense_maker text,
  CONSTRAINT Director_info_pkey PRIMARY KEY (DID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Director_info
  OWNER TO postgres

-- Table: Film_Actors

-- DROP TABLE Film_Actors;

CREATE TABLE Film_Actors
(
  MPAA_num Long NOT NULL,
  AID character,
  aname text,
  CONSTRAINT Film_Actors_pkey PRIMARY KEY (MPAA_num, AID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Film_Actors
  OWNER TO postgres

-- Table: Film_Directors

-- DROP TABLE Film_Directors;

CREATE TABLE Film_Directors
(
  MPAA_num Long NOT NULL,
  DID character,
  dname text,
  CONSTRAINT Film_Directors_pkey PRIMARY KEY (MPAA_num, DID)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Film_Directors
  OWNER TO postgres

-- Table: Movie

-- DROP TABLE Movie;

CREATE TABLE Movie
(
  MPAA_num Long NOT NULL,
  name text,
  release_year text,
  CONSTRAINT Movie_pkey PRIMARY KEY (MPAA_num)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Movie
  OWNER TO postgres

-- Table: Sales

-- DROP TABLE Sales;

CREATE TABLE Sales
(
  MPAA_num Long NOT NULL,
  domestic_box_sales Long,
  foreign_box_sales Long,
  dvd/bulray_sales Long,
  CONSTRAINT Sales_pkey PRIMARY KEY (MPAA_num)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE Sales
  OWNER TO postgres


--Functional Dependencies
-- {PID}-> {name, address, spouse_name}
-- {PID}-> {AID}
-- {PID}-> {DID}
-- {AID}-> {hair_color, birth_date, eye_color, height_inches, weight_lbs}
-- {AID}-> {act_guild_date, favorite_color}
-- {DID}-> {dir_guild_date, film_school, favorite_lense_maker}
-- {MPAA_num}-> {name, release_year}
-- {MPAA_num}-> {domestic_box_sales, foreign_box_sales, dvd/bluray_sales}
-- {MPAA_num}-> {AID, aname}
-- {MPAA_num}-> {DID, dname}

--QUERY
select p.name, fd.did
from People p
inner join Actor a on a.PID = p.PID
inner join film_actors fa on fa.AID = a.AID
inner join Director d on d.PID = p.PID
inner join Film_Directors fd on fd.DID = Director.DID
where fd.MPAA_num = fa.MPAA_num and fs.aname = 'Sean Connery';

  