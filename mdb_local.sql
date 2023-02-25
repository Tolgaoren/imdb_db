CREATE TABLE imdb_users(
user_id INTEGER PRIMARY KEY,
user_name VARCHAR2(20) NOT NULL,
user_surname VARCHAR2(20) NOT NULL,
user_email VARCHAR(50) NOT NULL UNIQUE) 

(alter table imdb_users add user_password VARCHAR(20))

CREATE TABLE shows(
show_id  INTEGER PRIMARY KEY,
show_title VARCHAR2(50) NOT NULL UNIQUE,
show_date NUMBER(4) NOT NULL)
(alter table shows add show_language INTEGER NOT NULL REFERENCES languages(language_id))
(alter table shows add show_poster INTEGER REFERENCES poster(poster_id))

CREATE TABLE languages(
language_id INTEGER PRIMARY KEY,
language_name VARCHAR2(50) NOT NULL)

CREATE TABLE categories(
category_id INTEGER PRIMARY KEY,
category_name VARCHAR2(30) NOT NULL)

CREATE TABLE category_to_movie(
cat_to_show_id INTEGER PRIMARY KEY,
cat_to_show_cat INTEGER REFERENCES categories(category_id),
cat_to_show INTEGER REFERENCES shows(show_id))

CREATE TABLE casts(
cast_id INTEGER PRIMARY KEY,
cast_name VARCHAR2(50) NOT NULL,
cast_birthday DATE NOT NULL,
cast_deathyear DATE)

CREATE TABLE playing(
playing_id INTEGER PRIMARY KEY,
playing_name VARCHAR2(30))

CREATE TABLE cast_to_playing(
c_t_p_id INTEGER PRIMARY KEY,
c_t_p_cast_id INTEGER NOT NULL REFERENCES casts(cast_id),
c_t_p_show_id INTEGER NOT NULL REFERENCES shows(show_id))

CREATE TABLE directors(
director_id INTEGER NOT NULL PRIMARY KEY,
director_name VARCHAR2(30) NOT NULL,
director_birthday DATE,
director_deathyear DATE)

CREATE TABLE directed(
dt_director_id INTEGER PRIMARY KEY,
dt_show_id VARCHAR2(30))

CREATE TABLE directors_to_directed(
d_t_d_id INTEGER PRIMARY KEY,
d_t_d_ors INTEGER REFERENCES directors(director_id),
d_t_d_ed INTEGER REFERENCES shows(show_id))

CREATE TABLE ratings(
rt_user_id INTEGER NOT NULL REFERENCES imdb_users(user_id),
rt_show_id INTEGER NOT NULL REFERENCES shows(show_id),
rating NUMBER(2),
CONSTRAINT check_ratings check (rating <= 10 and rating >= 1 ) )

CREATE TABLE watchlist(
wl_id INTEGER PRIMARY KEY,
wl_user_id INTEGER NOT NULL REFERENCES imdb_users(user_id),
wl_show_id INTEGER NOT NULL REFERENCES shows(show_id))

CREATE TABLE poster(
poster_id INTEGER PRIMARY KEY)