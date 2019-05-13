CREATE TABLE Film(
    film_id INT,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    rating FLOAT NOT NULL,
    run_time_min INT NOT NULL,
    PRIMARY KEY (film_id)
);
CREATE TABLE TvSeries(
    tv_id INT,
    title VARCHAR(255) NOT NULL,
    runtime_avg INT NOT NULL,
    start_year INT NOT NULL,
    end_year VARCHAR(255) NOT NULL,
    rating FLOAT NOT NULL,
    PRIMARY KEY (tv_id)
);
CREATE TABLE Season(
    tv_id INT,
    season_num INT NOT NULL,
    num_of_episodes INT NOT NULL,
    PRIMARY KEY (tv_id, season_num),
    FOREIGN KEY (tv_id) REFERENCES TvSeries
    ON DELETE CASCADE
);
CREATE TABLE Episode(
    tv_id INT,
    season_num INT NOT NULL,
    ep_num INT NOT NULL,
    title VARCHAR(255),
    release_date DATE,
    PRIMARY KEY (tv_id, season_num, ep_num),
    FOREIGN KEY (tv_id, season_num) REFERENCES Season
    ON DELETE CASCADE
);
CREATE TABLE People(
    people_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    country_of_birth VARCHAR(255) NOT NULL,
    PRIMARY KEY (people_id)
);
CREATE TABLE Role_in_film(
    film_id INT,
    people_id INT NOT NULL,
    roleIn VARCHAR(255) NOT NULL,
    PRIMARY KEY (film_id, people_id, roleIn),
    FOREIGN KEY (film_id) REFERENCES Film
    ON DELETE CASCADE,
    FOREIGN KEY (people_id) REFERENCES People
    ON DELETE CASCADE
);
CREATE TABLE Role_in_tv(
    tv_id INT,
    people_id INT NOT NULL,
    roleIn VARCHAR(255) NOT NULL,
    PRIMARY KEY (tv_id, people_id, roleIn),
    FOREIGN KEY (tv_id) REFERENCES TvSeries
    ON DELETE CASCADE,
    FOREIGN KEY (people_id) REFERENCES People
    ON DELETE CASCADE
);
CREATE TABLE Film_gen(
    film_id INT,
    genre VARCHAR(255) NOT NULL,
    PRIMARY KEY (film_id, genre),
    FOREIGN KEY (film_id) REFERENCES Film
    ON DELETE CASCADE
);
CREATE TABLE Tv_gen(
    tv_id INT,
    genre VARCHAR(255) NOT NULL,
    PRIMARY KEY (tv_id, genre),
    FOREIGN KEY (tv_id) REFERENCES TvSeries
    ON DELETE CASCADE
);

INSERT INTO Film
VALUES
(1, 'The Ides of March', 2011, 7.1, 101),
(2, 'Thor: Ragnarok', 2017, 7.9, 130),
(3, 'What We Do in the Shadows', 2014, 7.7, 86),
(4, 'Avengers: Endgame', 2019, 7.9, 181),
(5, 'Avengers: Infinity War', 2018, 8.5, 149),
(6, 'Captain America: Civil War', 2016, 7.8, 147),
(7, 'Spider-Man: Homecoming', 2017, 7.5, 133),
(8, 'The Conjuring', 2013, 7.5, 112),
(9, 'The Conjuring 2', 2016, 7.4, 134);

INSERT INTO TvSeries
VALUES
(1, 'Community', 22, 2009, 2015, 8.5),
(2, 'How I Met Your Mother', 22 , 2005, 2014, 8.3),
(3, 'Saturday Night Live', 90, 1975, 'Present', 8.1),
(4, 'Brooklyn Nine-Nine', 22, 2013, 'Present', 8.4),
(5, 'Everybody Hates Chris', 22, 2005, 2009, 7.4),
(6, 'Breaking Bad', 49, 2008, 2013, 9.5),
(7, 'Malcolm in the Middle', 22, 2000, 2006, 8.0),
(8, 'Glee', 44, 2009, 2015, 6.8),
(9, 'The Flash', 43, 2014, 'Present', 7.9),
(10, 'The Arrow', 42, 2012, 'Present', 7.7)
;

INSERT INTO Season
VALUES
(1, 1, 25),
(1, 2, 24),
(1, 3, 22),
(1, 4, 13),
(1, 5, 13),
(1, 6, 13),
(4, 1, 22),
(4, 2, 23),
(4, 3, 23),
(4, 4, 22),
(4, 5, 22),
(4, 6, 18)
;

INSERT INTO Episode
VALUES
(1, 1, 1, 'Pilot', '2009-09-17'),
(1, 1, 2, 'Spanish 101', '2009-09-24'),
(1, 1, 3, 'Intorduction to Film', '2009-10-01'),
(1, 1, 4, 'Social Psychology', '2009-10-08'),
(1, 1, 5, 'Advanced Criminal Law', '2009-10-15'),
(1, 1, 6, 'Football, Feminism and You', '2009-10-22'),
(4, 1, 1, 'Pilot', '2013-09-17' ),
(4, 1, 2, 'The Tagger', '2013-09-18'),
(4, 1, 3, 'The Slump', '2013-10-01'),
(4, 1, 4, 'M.E. Time', '2013-10-08'),
(4, 1, 5, 'The Vulture', '2013-10-15'),
(4, 1, 6, 'Halloween', '2013-10-22'),
(4, 1, 7, '48 Hours', '2013-11-05')
;

INSERT INTO People
VALUES
(1, 'George', 'Clooney', '1961-05-06', 'USA'),
(2, 'Taika', 'Waititi', '1975-08-16', 'New Zealand'),
(3, 'Anthony', 'Russo', '1970-02-03', 'USA'),
(4, 'Joe', 'Russo', '1971-07-08', 'USA'),
(5, 'Robert', 'Downey Jr', '1965-04-04', 'USA'),
(6, 'Chris', 'Evans', '1981-06-13', 'USA'),
(7, 'Chris', 'Hemsworth', '1983-08-11', 'Australia'),
(8, 'Mark', 'Ruffalo', '1967-11-22', 'USA'),
(9, 'Scarlett', 'Johansen', '1984-11-22', 'USA'),
(10, 'Andy', 'Samberg', '1978-08-18', 'USA'),
(11, 'Chris', 'Rock', '1965-02-07', 'USA'),
(12, 'Bryan','Cranston', '1956-03-07', 'USA'),
(13, 'Frankie', 'Muniz', '1985-12-05', 'USA'),
(14, 'Melissa', 'Benoist', '1988-10-04', 'USA'),
(15, 'Grant', 'Gustin', '1990-01-14', 'USA'),
(16, 'James', 'Wan', '1977-02-26', 'Malaysia'),
(17, 'Vin', 'Diesel', '1967-07-18', 'USA'),
(18, 'Chris', 'Pratt', '1979-06-21', 'USA')
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
( 4, 4, 'Director'),
( 4, 5, 'Actor'),
( 4, 6, 'Actor'),
( 4, 7, 'Actor'),
( 4, 8, 'Actor'),
( 4, 9, 'Actor'),
( 5, 5, 'Actor'),
( 5, 6, 'Actor'),
( 5, 7, 'Actor'),
( 5, 8, 'Actor'),
( 5, 9, 'Actor'),
( 6, 5, 'Actor'),
( 6, 6, 'Actor'),
( 6, 7, 'Actor'),
( 6, 8, 'Actor'),
( 6, 9, 'Actor'),
( 8, 16, 'Director'),
( 9, 16, 'Director'),
( 4, 17, 'Actor'),
( 5, 17, 'Actor')
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
( 5, 11, 'Producer'),
( 6, 12, 'Actor'),
( 7, 12, 'Actor'),
( 8, 14, 'Actor'),
( 8, 15, 'Actor'),
( 9, 15, 'Actor');

INSERT INTO Film_gen
VALUES
(1, 'Drama'),
(1, 'Thriller'),
(2, 'Action'),
(2, 'Adventure'),
(2, 'Comedy'),
(3, 'Comedy'),
(3, 'Horror'),
(4, 'Action'),
(4, 'Adventure'),
(4,'Fantasy'),
(5, 'Action'),
(5, 'Adventure'),
(5, 'Sci-Fi'),
(6, 'Action'),
(6, 'Adventure'),
(6, 'Sci-FI'),
(7, 'Action'),
(7, 'Adventure'),
(7, 'Sci-FI'),
(8, 'Horror'),
(8, ' Mystery'),
(8, 'Thriller');

INSERT INTO Tv_gen
VALUES
(1, 'Comedy'),
(2,'Comedy'),
(2,'Romance'),
(3, 'Comedy'),
(3, 'Music'),
(4, 'Comedy'),
(4, 'Crime'),
(5, 'Comedy'),
(6, 'Crime'),
(6, 'Drama'),
(6, 'Thriller'),
(7, 'Comedy'),
(7, 'Family'),
(8, 'Comedy'),
(8, 'Drama'),
(8, 'Music'),
(9, 'Action'),
(9, 'Adventure'),
(9, 'Drama'),
(10, 'Action'),
(10, 'Adventure'),
(10, 'Crime');

--select first_name, last_name, title from people natural join Role_in_film natural join film where roleIn = 'Actor' order by title;