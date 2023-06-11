/* Q8 The country with the highest and lowest goals against? */

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
            SUM(goals_against) AS goal_against
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
    goal_against = (SELECT MAX(goal_against) FROM games)
    OR goal_against = (SELECT MIN(goal_against) FROM games)