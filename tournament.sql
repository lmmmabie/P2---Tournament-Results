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
    loser SERIAL references players(player_id),
    draw boolean);
    
-- create a view for standings
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
