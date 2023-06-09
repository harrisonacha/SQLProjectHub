/* The query below is used to create the database and also the table */

/* Create database with this query */

CREATE DATABASE FIFA;

/* Create tables with this query */

CREATE TABLE fifa_2018 (
	position serial not null,
	team varchar(70) not null,
	games_played int,
	win int,
	draw int,
	loss int,
	goals_for int,
	goals_against int,
	goal_difference int,
	points int
);

CREATE TABLE fifa_2014 (
	position serial not null,
	team varchar(70) not null,
	games_played int,
	win int,
	draw int,
	loss int,
	goals_for int,
	goals_against int,
	goal_difference int,
	points int
);

CREATE TABLE fifa_2010 (
	position serial not null,
	team varchar(70) not null,
	games_played int,
	win int,
	draw int,
	loss int,
	goals_for int,
	goals_against int,
	goal_difference int,
	points int
);

CREATE TABLE fifa_2006 (
	position serial not null,
	team varchar(70) not null,
	games_played int,
	win int,
	draw int,
	loss int,
	goals_for int,
	goals_against int,
	goal_difference int,
	points int
);

CREATE TABLE fifa_2002 (
	position serial not null,
	team varchar(70) not null,
	games_played int,
	win int,
	draw int,
	loss int,
	goals_for int,
	goals_against int,
	goal_difference int,
	points int
);

/* Import the query from the local folder using the query: */
	\COPY (file name) FROM '(filepath.csv)' DELIMITER ',' CSV HEADER;
