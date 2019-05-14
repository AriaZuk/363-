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
(9, 'The Conjuring 2', 2016, 7.4, 134),
(10, 'Wine Country', 2019, 5.5, 103)
;

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
(10, 'The Arrow', 42, 2012, 'Present', 7.7),
(11, 'Parks and Recreation', 22, 2009, 2015, 8.6)
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
(18, 'Chris', 'Pratt', '1979-06-21', 'USA'),
(19, 'Amy', 'Poehler', '1971-09-16', 'USA')
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
( 5, 17, 'Actor'),
( 4, 18, 'Actor'),
( 5, 18, 'Actor'),
( 10, 19, 'Director'),
( 10, 19, 'Actor')
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
( 9, 15, 'Actor'),
( 11, 19, 'Director'),
( 11, 19, 'Actor'),
( 11, 19, 'Producer'),
( 11, 19, 'Writer'),
( 11, 18, 'Actor')
;

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

--Roles in Film
Create view factors as
Select * from people natural join role_in_film where roleIn = 'Actor' order by last_name;
Create view fdirectors as
Select * from people natural join role_in_film where roleIn = 'Director' order by last_name;
Create view fwriters as
Select * from people natural join role_in_film where roleIn = 'Writer' order by last_name;
Create view fproducers as
Select * from people natural join role_in_film where roleIn = 'Producer' order by last_name;

--Roles in TV
Create view tvactors as
Select * from people natural join role_in_tv where roleIn = 'Actor' order by last_name;
Create view tvdirectors as
Select * from people natural join role_in_tv where roleIn = 'Director' order by last_name;
Create view tvwriters as
Select * from people natural join role_in_tv where roleIn = 'Writer' order by last_name;
Create view tvproducers as
Select * from people natural join role_in_tv where roleIn = 'Producer' order by last_name;

--Example Film genres
Create view faction as
Select * from film natural join film_gen where genre = "Action";
Create view fadventure as
Select * from film natural join film_gen where genre = "Adventure";
--Example TV genres
Create view tvaction as
Select * from TvSeries natural join tv_gen where genre = "Action";
Create view tvadventure as
Select * from TvSeries natural join tv_gen where genre = "Adventure";

--Show title, release year and genres for films that are both action and adventure.
select faction.title, faction.release_year, faction.genre, fadventure.genre from faction join fadventure on faction.film_id = fadventure.film_id;
--Show title, release year directors and genres for films that are both action and adventure. Includes nulls if director is not yet in the database.
select title, first_name, last_name, year, genre1, genre2 from  (
select faction.film_id as film_idj, faction.title as title, faction.release_year as year, faction.genre as genre1, fadventure.genre as genre2 from faction join fadventure on faction.film_id = fadventure.film_id
) left join fdirectors on  film_idj = fdirectors.film_id order by title;
--Show titles and genres for films AND TV series that are both action and adventure.
select tvaction.title, tvaction.start_year, tvaction.genre, tvadventure.genre from tvaction join tvadventure on tvaction.tv_id = tvadventure.tv_id
union 
select faction.title, faction.release_year, faction.genre, fadventure.genre from faction join fadventure on faction.film_id = fadventure.film_id;

--People with roles both in TV and film 
select distinct first_name, last_name from (
select * from people natural join (
select * from Role_in_film join  Role_in_tv on  Role_in_tv.people_id =  Role_in_film.people_id
));

--People born after 1980, display name, date of birth, country of birth order alphabetically by surname
select last_name, first_name, dob, country_of_birth from people where  cast(substr(dob, 1, 4) as int) >= 1980 order by last_name;

--select title, first_name, last_name, release_year from film_gen natural join film natural join Role_in_film natural join people where roleIn = 'Director'  and genre = 'Comedy' and genre = 'Action' order by title;
--Get all tv series that came out after ‘year’ with ‘number’ of seasons
--How many times a director directed a comedy
--Show tv series that an episode is less than 25 min on average and more than 2 seasons and a comedy 

--People who have more than 3 roles in a movie/tv series
--Select first_name, last_name
--All people who had all the roles in a movie 
--Tv series that has more than x seasons each with more than x episodes 
--Actors over/under certain age

