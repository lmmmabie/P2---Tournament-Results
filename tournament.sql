-- these tables go into the tournament database in psql

-- table for players
CREATE TABLE players (
    player_id SERIAL primary key, 
    player_name text
    );

-- table for matches
CREATE TABLE matches (
    match_id SERIAL primary key, 
    winner SERIAL references players(player_id), 
    loser SERIAL references players(player_id)
    );
