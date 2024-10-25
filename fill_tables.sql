-- Задание 1

INSERT INTO artists (id, name) VALUES
(1, 'convolk'),
(2, 'ErynMartin'),
(3, 'LilPeep'),
(4, 'Bones');

INSERT INTO genres (id, name) VALUES
(1, 'Pop'),
(2, 'Rap'),
(3, 'Hip-hop');

INSERT INTO albums (id, title, release_year) VALUES
(1, 'LONEWOLF', 2018),
(2, 'EDOG, VOL. 2', 2019),
(3, 'DEMIDEVIL', 2024),
(4, 'Classic Hits', 2020); 

INSERT INTO tracks (id, title, duration, album_id) VALUES
(1, 'lonewolf', 178, 1),
(2, 'i fucked up', 160, 1),
(3, 'TRAP', 145, 2),
(4, 'DAYQUIL', 139, 2),
(5, 'Slumber Party', 202, 3),
(6, 'Daisy 2.0', 172, 3),
(7, 'My Way', 215, 4),      
(8, 'Another Day', 180, 4);  

INSERT INTO collections (id, title, release_year) VALUES
(1, 'CollectionOne', 2018),
(2, 'CollectionTwo', 2019),
(3, 'CollectionThree', 2020),
(4, 'CollectionFour', 2020);

INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 2), 
(2, 1), 
(3, 3), 
(4, 2); 

INSERT INTO artist_album (artist_id, album_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4); 

INSERT INTO collection_track (collection_id, track_id) VALUES
(1, 1), 
(1, 2), 
(2, 3), 
(2, 5), 
(3, 4),
(3, 6), 
(4, 2),
(4, 7); 

-- Задание 2

SELECT title, duration FROM tracks ORDER BY duration DESC LIMIT 1;
SELECT title FROM tracks WHERE duration >= 210;
SELECT title FROM collections WHERE release_year BETWEEN 2018 AND 2020;
SELECT name FROM artists WHERE name NOT LIKE '% %';
SELECT title FROM tracks WHERE title ILIKE '%мой%' OR title ILIKE '%my%';

-- Задание 3

SELECT g.name, COUNT(ag.artist_id) AS artist_count 
FROM genres g 
JOIN artist_genre ag ON g.id = ag.genre_id 
GROUP BY g.name;

SELECT a.title, COUNT(t.id) AS track_count 
FROM albums a 
JOIN tracks t ON a.id = t.album_id 
WHERE a.release_year BETWEEN 2019 AND 2020 
GROUP BY a.title;

SELECT a.title, AVG(t.duration) AS avg_duration 
FROM albums a 
JOIN tracks t ON a.id = t.album_id 
GROUP BY a.title;

SELECT ar.name 
FROM artists ar 
JOIN artist_album aa ON ar.id = aa.artist_id 
JOIN albums al ON aa.album_id = al.id 
WHERE al.release_year != 2020;

SELECT DISTINCT c.title 
FROM collections c 
JOIN collection_track ct ON c.id = ct.collection_id 
JOIN tracks t ON ct.track_id = t.id 
JOIN albums a ON t.album_id = a.id 
JOIN artist_album aa ON a.id = aa.album_id 
JOIN artists ar ON aa.artist_id = ar.id 
WHERE ar.name = 'convolk';
