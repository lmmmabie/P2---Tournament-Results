UDACITY TOURNAMENT DATABASE
---------------------------

This is a database project that shows uses Python and SQL and sample files to test code for a tournament.

Table of contents
————————————————-

1. Documentation
2. Testing Information
3. Copyright and license

What's included
——————————————-

1. README.md
2. tournament.sql
3. tournament.py
4. tournament_test.py

Documentation
—————————————-
To use the project files to setup a swiss-system tournament, follow the below steps.

1. Download Files

Download the project files

2. Create Database

Log into your PostgreSQL console and create a new database, for example:

CREATE DATABASE tournament 

3. Create Tables

There are two tables required for the database.  One table is for players and one form matches.

CREATE TABLE players (
    player_id SERIAL primary key, 
    player_name text
    );

CREATE TABLE matches (
    match_id SERIAL primary key, 
    winner SERIAL references players(player_id), 
    loser SERIAL references players(player_id)
    );

Testing Information
———————————————————

This project can be tested by connecting to the tournanment database via psql and then running the python file tournament_test.py.

Copyright and License
————————————————————-

tournament_test.py by Udacity.

tournament.py and tournament.sql was created by Lee Mabie with heavy contributions from public sources and the Udacity Nanodegree community forums.
