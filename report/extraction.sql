SET @max_id_steamid = (SELECT MAX(steamid) FROM Player_Summaries);
SET @min_id_steamid = (SELECT MIN(steamid) FROM Player_Summaries);
SET @range_steamid = @max_id_steamid - @min_id_steamid;
SET @limit_steam_id = ROUND(0.1 * @range_steamid);
SELECT @limit_steam_id AS limit_value;

SET @max_id_appid = (SELECT MAX(appid) FROM App_ID_Info);
SET @min_id_appid = (SELECT MIN(appid) FROM App_ID_Info);
SET @range_appid = @max_id_appid - @min_id_appid;
SET @limit_appid = ROUND(1 * @range_appid);
SELECT @limit_appid AS limit_value;

CREATE TEMPORARY TABLE temp_Player_Summaries AS
SELECT * FROM Player_Summaries
WHERE steamid BETWEEN @min_id_steamid AND @min_id_steamid + @limit_steam_id;

SELECT * FROM temp_Player_Summaries;

CREATE TEMPORARY TABLE temp_App_ID_Info AS
SELECT * FROM App_ID_Info
WHERE appid BETWEEN @min_id_appid AND @min_id_appid + @limit_appid;

SELECT * FROM temp_App_ID_Info;

CREATE TEMPORARY TABLE temp_Games_Daily AS
SELECT gd.*
FROM Games_Daily gd
WHERE gd.appid IN (SELECT appid FROM temp_App_ID_Info)
AND gd.steamid IN (SELECT steamid FROM temp_Player_Summaries);

SELECT * FROM temp_Games_Daily;

CREATE TEMPORARY TABLE temp_Friends AS
SELECT f.*
FROM Friends f
WHERE f.steamid_a IN (SELECT steamid FROM temp_Player_Summaries)
AND f.steamid_b IN (SELECT steamid FROM temp_Player_Summaries);

SELECT * FROM temp_Friends;

CREATE TEMPORARY TABLE temp_Games AS
SELECT g.*
FROM (
    SELECT g1.*
    FROM Games_1 g1
    WHERE g1.appid IN (SELECT appid FROM temp_App_ID_Info)
    AND g1.steamid IN (SELECT steamid FROM temp_Player_Summaries)

    UNION

    SELECT g2.*
    FROM Games_2 g2
    WHERE g2.appid IN (SELECT appid FROM temp_App_ID_Info)
    AND g2.steamid IN (SELECT steamid FROM temp_Player_Summaries)
) g;

SELECT * FROM temp_Games;

SET @max_id_games = (SELECT MAX(steamid) FROM temp_Games);
SET @min_id_games = (SELECT MIN(steamid) FROM temp_Games);
SET @range_games = @max_id_games - @min_id_games;
SET @limit_games = ROUND(0.2 * @range_games);
SELECT @limit_games AS limit_value;

CREATE TEMPORARY TABLE temp_Games_20Percent AS
SELECT * FROM temp_Games
WHERE steamid BETWEEN @min_id_games AND @min_id_games + @limit_games;

SELECT * FROM temp_Games_20Percent;

CREATE TEMPORARY TABLE temp_achievement_Percentage AS
SELECT ap.*
FROM Achievement_Percentages ap
JOIN temp_App_ID_Info ai ON ap.appid = ai.appid;

SELECT * FROM temp_achievement_Percentage;

CREATE TEMPORARY TABLE temp_Games_Developers AS
SELECT gd.*
FROM Games_Developers gd
JOIN temp_App_ID_Info ai ON gd.appid = ai.appid;

SELECT * FROM temp_Games_Developers;

CREATE TEMPORARY TABLE temp_Games_Genres AS
SELECT gg.*
FROM Games_Genres gg
JOIN temp_App_ID_Info ai ON gg.appid = ai.appid;

SELECT * FROM temp_Games_Genres;

CREATE TEMPORARY TABLE temp_Games_Publishers AS
SELECT gp.*
FROM Games_Publishers gp
JOIN temp_App_ID_Info ai ON gp.appid = ai.appid;

SELECT * FROM temp_Games_Publishers;

CREATE TEMPORARY TABLE temp_Games_Info AS
SELECT gd.*, gp.Publisher, gg.Genre
FROM Games_Developers gd
JOIN temp_App_ID_Info ai ON gd.appid = ai.appid
JOIN temp_Games_Publishers gp ON gd.appid = gp.appid
JOIN temp_Games_Genres gg ON gd.appid = gg.appid;

SELECT * FROM temp_Games_Info;
