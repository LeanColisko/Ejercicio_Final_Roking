### Creación de la base de datos, usuario y tablas ---------------------------------
CREATE DATABASE visas_h1;
CREATE USER userhost@'%' IDENTIFIED BY '12345678';
GRANT ALL PRIViLEGES ON visas_h1.* TO userhost@'%';

USE visas_h1;
DROP TABLE IF EXISTS attr_states;
CREATE TABLE attr_states (
  WORKSITE_STATE_ABB VARCHAR(10) NOT NULL,
  WORKSITE_STATE_FULL VARCHAR(50) NOT NULL,
  CONSTRAINT pk_state PRIMARY KEY(WORKSITE_STATE_FULL)
);
LeanColisko/

DROP TABLE IF EXISTS attr_soc_names;
CREATE TABLE attr_soc_names (
  SOC_CODE VARCHAR(20) NOT NULL,
  SOC_NAME VARCHAR(255) NOT NULL,
  CONSTRAINT pk_soc_name PRIMARY KEY(SOC_CODE)
);

DROP TABLE IF EXISTS fact_visas;
CREATE TABLE fact_visas (
  CASE_NUMBER VARCHAR(50) NOT NULL,
  CASE_STATUS VARCHAR(50) NOT NULL,
  EMPLOYER_NAME VARCHAR(255),
  SOC_CODE VARCHAR(20),
  JOB_TITLE VARCHAR(255),
  FULL_TIME_POSITION VARCHAR(10),
  PREVAILING_WAGE FLOAT,
  WORKSITE_CITY VARCHAR(255),
  YEAR INT,
  WORKSITE_STATE_FULL VARCHAR(50),
  CONSTRAINT pk_fact_tb PRIMARY KEY(CASE_NUMBER),
  INDEX(WORKSITE_STATE_FULL),
  INDEX(SOC_CODE),
  CONSTRAINT fk_fact_to_state FOREIGN KEY(WORKSITE_STATE_FULL) REFERENCES attr_states(WORKSITE_STATE_FULL),
  CONSTRAINT fk_fact_to_soc_name FOREIGN KEY(SOC_CODE) REFERENCES attr_soc_names(SOC_CODE)
);






