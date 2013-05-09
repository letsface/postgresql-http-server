CREATE EXTENSION postgis;
DROP SCHEMA IF EXISTS testschema CASCADE;
CREATE SCHEMA testschema;
CREATE TABLE testschema.testtable (id SERIAL PRIMARY KEY, name varchar, geom GEOMETRY(Point));
