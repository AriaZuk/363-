CREATE TABLE Film(
    film_id INT,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    rating FLOAT,
    run_time INT,
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