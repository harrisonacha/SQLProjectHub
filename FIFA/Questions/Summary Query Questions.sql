-- Q1 How many countries have played in the WC (5 years)

WITH
    cteFifa AS (
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
    COUNT(DISTINCT team)
FROM
    cteFifa

-- Q2 Total games played, won, lost, goals for/against

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


-- Q3 Country with highest and lowest appearance in the last 5 years

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

    teamAppearance AS (
        SELECT
            team,
            COUNT(team) AS numAppearance
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
    teamAppearance
WHERE
    numAppearance = (SELECT MAX(numAppearance) FROM teamAppearance)
    OR numAppearance = (SELECT MIN(numAppearance) FROM teamAppearance)
	
	
---Q4 The country with the highest and lowest games played?

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
	
--Q5 The country with the highest and lowest games won?

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
            SUM(win) AS games_won
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
    games_won = (SELECT MAX(games_won) FROM games)
    OR games_won = (SELECT MIN(games_won) FROM games)

---Q6 The country with the highest and lowest games lost?


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
            SUM(loss) AS games_lost
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
    games_lost = (SELECT MAX(games_lost) FROM games)
    OR games_lost = (SELECT MIN(games_lost) FROM games)
	
--Q7 The country with the highest and lowest goals for?
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
            SUM(goals_for) AS goals_for
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
    goals_for = (SELECT MAX(goals_for) FROM games)
    OR goals_for = (SELECT MIN(goals_for) FROM games)
	
---Q8 The country with the highest and lowest goals against?

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
	
---Q9 The country with the highest and lowest goals difference?

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
            SUM(goal_difference) AS goal_difference
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
    goal_difference = (SELECT MAX(goal_difference) FROM games)
    OR goal_difference = (SELECT MIN(goal_difference) FROM games)

---Q10 The country with the highest and lowest points?

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
            SUM(points) AS points
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
    points = (SELECT MAX(points) FROM games)
    OR points = (SELECT MIN(points) FROM games)