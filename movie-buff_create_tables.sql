create table directors (
director_id integer primary key auto_increment,
first_name varchar(30),
middle_name varchar(20),
last_name varchar(30),
country varchar(50)
);

CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(100),
   year_released INTEGER,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);