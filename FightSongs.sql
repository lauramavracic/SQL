USE laura;

DROP TABLE fight_songs;

/*Part A*/
CREATE TABLE fight_songs(
	school VARCHAR(50),
    conference VARCHAR(50),
    song_name VARCHAR(80),
    writers VARCHAR(80),
    year INT,
    student_writer BOOLEAN,
    official_song BOOLEAN,
    PRIMARY KEY (school)
);

INSERT INTO fight_songs(school, conference, song_name, writers,
	year, student_writer, official_song)
SELECT school, conference, song_name, writers, year,
	student_writer, official_song
FROM fightsongssrc;

SELECT count(*)
FROM fight_songs;

INSERT INTO fight_songs(school, conference, song_name, writers,
	year, student_writer, official_song)
SELECT school, 'patriot', song_name, writers, year, student_writer, official_song
FROM patriot_league;

SELECT count(*)
FROM fight_songs;

/*Part B*/
SELECT * FROM fight_songs
WHERE school = 'rutgers';

/*Part C*/
SELECT school, song_name, year FROM fight_songs
WHERE school = 'rutgers' OR school = 'Lafayette College';

/*Part D*/
SELECT school, song_name, student_writer,
CASE 
	WHEN (student_writer = 1) THEN 'TRUE'
    WHEN (student_writer = 0) THEN 'FALSE'
    WHEN (student_writer IS NULL) THEN 'NULL' 
END AS student_writer
FROM fight_songs
WHERE conference = 'patriot'
ORDER BY school DESC;

/*PART E*/
SELECT DISTINCT conference
FROM fight_songs;

/*PART F*/
SELECT school, song_name, writers
FROM fight_songs
WHERE writers IS NULL;

/*PART G*/
SELECT school, song_name, year
FROM fight_songs
WHERE year = (SELECT MIN(year) FROM fight_songs);
