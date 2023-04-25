INSTALL SONAME 'ha_spider';

SET GLOBAL sql_mode='';

DROP DATABASE IF EXISTS bts_spdr;

CREATE DATABASE bts_spdr;

USE bts_spdr;


## Example of credentials written into Create Table
CREATE TABLE IF NOT EXISTS airlines_spdr
  (
     iata_code VARCHAR(2),
     airline   VARCHAR(30)
  ) ENGINE=SPIDER COMMENT 'host "xpd1", database "bts", table "airlines", user "importuser", password "importuserpasswd", port "3306"';



## Example of credentials saved in SERVER
CREATE SERVER xpand1
FOREIGN DATA WRAPPER mariadb
OPTIONS (
   HOST "xpd1",
   PORT 3306,
   USER "importuser",
   PASSWORD "importuserpasswd",
   DATABASE "bts"
);

CREATE TABLE airports_spdr
  (
     iata_code VARCHAR(3),
     airport   VARCHAR(80),
     city      VARCHAR(30),
     state     VARCHAR(2),
     country   VARCHAR(30),
     latitude  DECIMAL(11, 4),
     longitude DECIMAL(11, 4)
  ) ENGINE=SPIDER COMMENT 'server "xpand1", database "bts", table "airports"';

CREATE TABLE flights_spdr
  (
     year                SMALLINT,
     month               TINYINT,
     day                 TINYINT,
     day_of_week         TINYINT,
     fl_date             DATE,
     carrier             VARCHAR(2),
     tail_num            VARCHAR(6),
     fl_num              SMALLINT,
     origin              VARCHAR(5),
     dest                VARCHAR(5),
     crs_dep_time        VARCHAR(4),
     dep_time            VARCHAR(4),
     dep_delay           SMALLINT,
     taxi_out            SMALLINT,
     wheels_off          VARCHAR(4),
     wheels_on           VARCHAR(4),
     taxi_in             SMALLINT,
     crs_arr_time        VARCHAR(4),
     arr_time            VARCHAR(4),
     arr_delay           SMALLINT,
     cancelled           SMALLINT,
     cancellation_code   SMALLINT,
     diverted            SMALLINT,
     crs_elapsed_time    SMALLINT,
     actual_elapsed_time SMALLINT,
     air_time            SMALLINT,
     distance            SMALLINT,
     carrier_delay       SMALLINT,
     weather_delay       SMALLINT,
     nas_delay           SMALLINT,
     security_delay      SMALLINT,
     late_aircraft_delay SMALLINT
  ) ENGINE=SPIDER COMMENT 'server "xpand1", database "bts", table "flights"';

DROP DATABASE IF EXISTS bts;

CREATE DATABASE bts;

USE bts;

CREATE TABLE airlines_cs
  (
     iata_code VARCHAR(2),
     airline   VARCHAR(30)
  ) ENGINE=COLUMNSTORE;



CREATE TABLE airports_cs
  (
     iata_code VARCHAR(3),
     airport   VARCHAR(80),
     city      VARCHAR(30),
     state     VARCHAR(2),
     country   VARCHAR(30),
     latitude  DECIMAL(11, 4),
     longitude DECIMAL(11, 4)
  ) ENGINE=COLUMNSTORE;

CREATE TABLE flights_cs
  (
     year                SMALLINT,
     month               TINYINT,
     day                 TINYINT,
     day_of_week         TINYINT,
     fl_date             DATE,
     carrier             VARCHAR(2),
     tail_num            VARCHAR(6),
     fl_num              SMALLINT,
     origin              VARCHAR(5),
     dest                VARCHAR(5),
     crs_dep_time        VARCHAR(4),
     dep_time            VARCHAR(4),
     dep_delay           SMALLINT,
     taxi_out            SMALLINT,
     wheels_off          VARCHAR(4),
     wheels_on           VARCHAR(4),
     taxi_in             SMALLINT,
     crs_arr_time        VARCHAR(4),
     arr_time            VARCHAR(4),
     arr_delay           SMALLINT,
     cancelled           SMALLINT,
     cancellation_code   SMALLINT,
     diverted            SMALLINT,
     crs_elapsed_time    SMALLINT,
     actual_elapsed_time SMALLINT,
     air_time            SMALLINT,
     distance            SMALLINT,
     carrier_delay       SMALLINT,
     weather_delay       SMALLINT,
     nas_delay           SMALLINT,
     security_delay      SMALLINT,
     late_aircraft_delay SMALLINT
  ) ENGINE=COLUMNSTORE;

