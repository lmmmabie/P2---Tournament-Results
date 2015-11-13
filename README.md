UDACITY TOURNAMENT DATABASE
---------------------------

This is a database project that shows uses Python and SQL and sample files to test code for a tournament.

TABLE OF CONTENTS

1. Documentation
2. Testing Information
3. Copyright and license

WHAT'S INCLUDED

1. README.md
2. tournament.sql
3. tournament.py
4. tournament_test.py

DOCUMENTATION

To use the project files to setup a swiss-system tournament, follow the below steps.

Download Files

- Download the project files

Create Database

- Log into your PostgreSQL console and create a new database, for example:

- CREATE DATABASE tournament 

Create Tables & Views

- There are two tables required for the database.  One table is for players and one form matches.
- A view is created called standings to report the results

CREATE TABLE players (
    player_id SERIAL primary key, 
    player_name text
    );

CREATE TABLE matches (
    match_id SERIAL primary key, 
    winner SERIAL references players(player_id), 
    loser SERIAL references players(player_id)
    );
    
CREATE VIEW standings AS 
SELECT players.player_id,
players.player_name,
    SUM(CASE WHEN matches.draw = 'false' AND matches.winner = players.player_id THEN 1
    WHEN matches.draw = 'true' AND (matches.winner = players.player_id OR matches.loser = players.player_id) THEN 0.5
    ELSE 0 END) AS total_wins,
COUNT(matches.match_id) AS total_matches 
FROM players LEFT JOIN matches 
ON players.player_id = matches.winner OR players.player_id = matches.loser 
GROUP BY players.player_id;

Testing Information

This project can be tested by connecting to the tournanment database via psql and then running the python file tournament_test.py.

Commands:
psql
drop database tournament;
create database tournament;
\c tournament
\i tournament.sql
\q

python tournament_test.py

Copyright and License

tournament_test.py by Udacity.

tournament.py and tournament.sql was created by Lee Mabie with heavy contributions from public sources and the Udacity Nanodegree community forums.
