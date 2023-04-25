# spider_etl


docker compose up -d

docker exec -it xpd1 xpd_setup

docker exec -it mcs1 bootstrap

docker exec -it mcs1 mariadb


INSERT INTO bts.airlines_cs SELECT * FROM bts_spdr.airlines_spdr;

INSERT INTO bts.airports_cs SELECT * FROM bts_spdr.airports_spdr;

INSERT INTO bts.flights_cs SELECT * FROM bts_spdr.flights_spdr;


Run Sample Queries in Queries directory.
