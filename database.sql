
CREATE DATABASE IF NOT EXISTS football CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE football;

CREATE TABLE tournaments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT,
    name VARCHAR(100),
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    name VARCHAR(100),
    category ENUM('A', 'B', 'C', 'D'),
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT,
    team1_id INT,
    team2_id INT,
    team1_score INT DEFAULT 0,
    team2_score INT DEFAULT 0,
    match_time DATETIME,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE goals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT,
    player_id INT,
    team_id INT,
    goal_time TIME,
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
);

-- View for top scorers
CREATE VIEW top_scorers AS
SELECT players.name AS player_name, teams.name AS team_name, COUNT(goals.id) AS goals
FROM goals
JOIN players ON goals.player_id = players.id
JOIN teams ON goals.team_id = teams.id
GROUP BY goals.player_id
ORDER BY goals DESC;
