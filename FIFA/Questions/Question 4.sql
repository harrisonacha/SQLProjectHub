/* Q4 The country with the highest and lowest games played? */

WITH
    allFifa AS (
        SELECT
            'wc 2002' AS year,
            *
        FROM
            fifa_2002
        UNION ALL
        SELECT
            'wc 2006' AS year,
            *
        FROM
            fifa_2006
        UNION ALL
        SELECT
            'wc 2010' AS year,
            *
        FROM
            fifa_2010
        UNION ALL
        SELECT
            'wc 2014' AS year,
            *
        FROM
            fifa_2014
        UNION ALL
        SELECT
            'wc 2018' AS year,
            *
        FROM
            fifa_2018
    ),

    games AS (
        SELECT
            team,
            SUM(games_played) AS total_games_played
        FROM
            allFifa
        GROUP BY
            1
        ORDER BY
            2 DESC
    )
SELECT
    *
FROM
    games
WHERE
    total_games_Played = (SELECT MAX(total_games_played) FROM games)
    OR total_games_Played = (SELECT MIN(total_games_played) FROM games)
