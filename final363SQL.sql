CREATE TABLE Film(
    film_id INT,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    rating FLOAT,
    run_time_min INT,
    PRIMARY KEY (film_id)
);
CREATE TABLE Genre(
    genre VARCHAR(255),
    PRIMARY KEY (genre)
);
CREATE TABLE TvSeries(
    tv_id INT,
    title VARCHAR(255) NOT NULL,
    runtime_avg INT,
    start_year INT,
    end_year INT,
    rating FLOAT,
    PRIMARY KEY (tv_id)
);
CREATE TABLE Season(
    season_id INT,
    season_num INT,
    num_of_episodes INT,
    PRIMARY KEY (season_id)
);
CREATE TABLE Episode(
    ep_id INT,
    ep_num INT,
    title VARCHAR(255),
    release_date DATE,
    PRIMARY KEY (ep_id)
);
CREATE TABLE People(
    people_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    country_of_birth VARCHAR(255),
    PRIMARY KEY (people_id)
);
CREATE TABLE Role_in_film(
    film_id INT,
    people_id INT,
    roleIn VARCHAR(255),
    PRIMARY KEY (film_id, people_id, roleIn)
);
CREATE TABLE Role_in_tv(
    tv_id INT,
    people_id INT,
    roleIn VARCHAR(255),
    PRIMARY KEY (tv_id, people_id, roleIn)
);
CREATE TABLE Film_gen(
    film_id INT,
    genre VARCHAR(255),
    PRIMARY KEY (film_id, genre)
);
CREATE TABLE Tv_gen(
    tv_id INT,
    genre VARCHAR(255),
    PRIMARY KEY (tv_id, genre)
);
CREATE TABLE HasSeason(
    tv_id INT,
    season_id INT,
    PRIMARY KEY (tv_id, season_id)
);
CREATE TABLE HasEpisode (
    season_id INT,
    ep_id INT,
    PRIMARY KEY (season_id, ep_id)
);

INSERT INTO Film
VALUES
(1, 'The Ides of March', 2011, 7.1, 101),
(2, 'Thor: Ragnarok', 2017, 7.9, 130),
(3, 'What We Do in the Shadows', 2014, 7.7, 86),
(4, 'Avengers: Endgame', 2019, 7.9, 181),
(5, 'Avengers: Infinity War', 2018, 8.5, 149)
(6, 'Captain America: Civil War', 2016, 7.8, 147),
(7, 'Spider-Man: Homecoming', 2017, 7.5, 133),
(8, 'Fast')
;

INSERT INTO TvSeries
VALUES
(1, 'Community', 22, 2009, 2015, 8.5),
(2, 'How I Met Your Mother', 22 , 2005, 2014, 8.3),
(3, 'Saturday Night Live', 90, 1975, Present, 8.1),
(4, 'Brooklyn Nine-Nine', 22, 2013, Present, 8.4),
(5, 'Everybody Hates Chris', 22, 2005, 2009, 7.4),


INSERT INTO People
VALUES
( 1, 'George', 'Clooney', '1961-05-06', 'USA'),
(2, 'Taika', 'Waititi', '1975-08-16', 'New Zealand'),
(3, 'Anthony', 'Russo', '1970-02-03', 'USA'),
(4, 'Joe', 'Russo', '1971-07-08', 'USA'),
(5, 'Robert', 'Downey Jr', '1965-04-04', 'USA'),
(6, 'Chris', 'Evans', '1981-06-13', 'USA'),
(7, 'Chris', 'Hemsworth', '1983-08-11', 'Australia'),
(8, 'Mark', 'Ruffalo', '1967-11-22', 'USA'),
(9, 'Scarlett', 'Johansen', '1984-11-22', 'USA'),
(10, 'Andy', 'Samberg', '1978-08-18', 'USA'),
(11, 'Chris', 'Rock', '1965-02-07', 'USA')
;

INSERT INTO Role_in_film
VALUES
( 1, 1, 'Actor'),
( 1, 1, 'Director'),
( 1, 1, 'Writer'),
( 1, 1, 'Producer'),
( 2, 2, 'Director'),
( 2, 2, 'Actor'),
( 3, 2, 'Director'),
( 3, 2, 'Actor'),
( 3, 2, 'Writer'),
( 3, 2, 'Producer'),
( 4, 3, 'Director'),
( 4, 4, 'Director')
( 4, 5, 'Actor'),
( 4, 6, 'Actor'),
( 4, 7, 'Actor'),
( 4, 8, 'Actor'),
( 4, 9, 'Actor'),

;

INSERT INTO Role_in_tv
VALUES
( 1, 3, 'Producer'),
( 1, 3, 'Director'),
( 1, 4, 'Producer'),
( 1, 4, 'Director'),
( 4, 10, 'Actor'),
( 4, 10, 'Producer'),
( 5, 11, 'Writer'),
( 5, 11, 'Producer')


INSERT INTO Film_gen
VALUES
(1, 'Drama'),
(1, 'Thriller'),
(2, 'Action'),
(2, 'Adventure'),
(2, 'Comedy'),
(3, 'Comedy'),
(3, 'Horror');

INSERT INTO Tv_gen
VALUES
(1, 'Comedy');

INSERT INTO Season
VALUES
(1, 1, 25),
(2, 2, 24),
(3, 3, 22),
(4, 4, 13),
(5, 5, 13),
(6, 6, 13);

INSERT INTO HasSeason
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);

INSERT INTO Episode
VALUES
(1, 1, 'Pilot', '2009-09-17'),
(2, 2, 'Spanish 101', '2009-09-24'),
(3, 3, 'Intorduction to Film', '2009-10-01'),
(4, 4, 'Social Psychology', '2009-10-08'),
(5, 5, 'Advanced Criminal Law', '2009-10-15'),
(6, 6, 'Football, Feminism and You', '2009-10-22');

INSERT INTO HasEpisode
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);

select first_name, last_name, title from people natural join Role_in_film natural join film where roleIn = 'Actor';