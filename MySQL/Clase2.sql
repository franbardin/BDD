CREATE TABLE  film(
	film_id INT(20) AUTO_INCREMENT,
	title VARCHAR(30) NOT NULL,
	description VARCHAR(120) NOT NULL,
	release_year YEAR,
	PRIMARY KEY(film_id));
	
CREATE TABLE  actor(
	actor_id INT(20) AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(actor_id));
	
CREATE TABLE film_actor(
	actor_id INT(20) NOT NULL,
	film_id INT(20) NOT NULL,
	FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
	FOREIGN KEY (film_id) REFERENCES film(film_id),
	PRIMARY KEY (actor_id, film_id)
	);	
	
ALTER TABLE film
	ADD last_update DATE;
	
ALTER TABLE actor
	ADD last_update DATE;	
	
INSERT INTO imdb.actor
(actor_id, first_name, last_name, last_update)
VALUES(0, 'Nicolas', 'Tagliafico', '2005-03-02');

INSERT INTO imdb.film
(film_id, title, description, release_year, last_update)
VALUES(0, 'Frozen', 'Bellisimaaaaaaaa', '2013', '2013-01-01');

INSERT INTO imdb.film_actor
(actor_id, film_id)
VALUES(1, 1);



	
	
	
	