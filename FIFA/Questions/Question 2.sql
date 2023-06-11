/*Q2 Total games played, won, lost, goals for/against*/

WITH cte AS (
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
)

SELECT
    team,
    SUM(games_played) AS games_played,
    SUM(win) AS wins,
    SUM(loss) AS loss
FROM
    cte
GROUP BY
    1
ORDER BY
    1 ASC

