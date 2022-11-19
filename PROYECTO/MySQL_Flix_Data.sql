-- --INSERTS PARA TABLA MOVIES

INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE) 
	VALUES ('Remember the Titans','The true story of a newly appointed African-American coach and his high school team on their first season as a racially integrated unit.','PG','DRAMA','2000-09-29');
INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE)
	VALUES ('Bullet Train','Five assassins aboard a swiftly-moving bullet train to find out that their missions have something in common.','R','COMEDY','2022-08-05');

INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE)
	VALUES ('Sing','In a city of humanoid animals, a hustling theater impresarios attempt to save his theater with a singing competition becomes grander than he anticipates even as its finalists find that their lives will never be the same.','PG','CHILD','2016-12-21');

INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE)
	VALUES ('How to Train Your Dragon','A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.','PG','CHILD','2010-03-2610');

INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE)
	VALUES ('Top Gun: Maverick','After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUNs elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.','PG13','ACTION','2022-05-27');

INSERT INTO MOVIES 
	(TITLE, DESCRIPTION, RATING, CATEGORY, RELEASE_DATE)
	VALUES ('The Greatest Showman','Celebrates the birth of show business and tells of a visionary who rose from nothing to create a spectacle that became a worldwide sensation.','R','DRAMA','2017-12-20');

Select * from movies;


-- --INSERTS PARA TABLA COSTUMERS
INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ('Todoroki', 'Shoto', '267-367-3763', 'Av. Paseo San Gerado #134', 'Aguascalientes', 'AG', 'shotot@gmail.com', '126-273-2749');

INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ( 'Readus', 'Norman', '267-467-4659', 'Av. Paseo San Lucas #454', 'Chihuahua', 'CH', 'normanr@gmail.com', '126-477-3644');

INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ('Picapiedra', 'Pedro', '267-456-3763', 'C. Las Lomas #456', 'Puebla', 'PB', 'pedrop@gmail.com', '126-273-2749');

INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ('Grimes', 'Rick', '267-957-4658', 'c. Walker Street #346', 'Sonora', 'SN', 'rickg@gmail.com', '126-264-4759');

INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ('Ramirez', 'Yoel', '267-347-248', 'Av. Francisco I Madero #347', 'Zacatecas', 'ZC', 'yoelr@gmail.com', '126-857-3467');

INSERT INTO CUSTOMERS
	(LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
	VALUES ('Forger', 'Anya', '267-367-2398', 'C. Francisco Villa #467', 'Guadalajara', 'GD', 'anyaf@gmail.com', '126-947-1123');
select * from customers;

-- ##--INSERTS PARA TABLA ACTORS
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Brad Pitt','William','Pitt','1963-12-18');
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Rihanna','Rihanna','Fenty','1986-02-21');
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Charlie Sheen','Carlos','Estevez','1965-09-3');
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Marilyn Monroe','Marilyn','Miller','1926-06-01');
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Natalie Portman','Neta-Lee','Hershlag','1981-06-09');
Insert into bd_flix.ACTORS (STAGE_NAME,FIRST_NAME,LAST_NAME, BIRTH_DATE) values ('Keanu Reeves','Keanu Charles','Reeves','1964-09-02');
Select * from actors;


-- --INSERTS PARA TABLA STARBILLINGS
INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1001, 2, 'Romantic Lead');

INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1002, 1, 'Unexpected end');

INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1003, 3, 'Nice soundtrack');

INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1004, 4, 'Good characters');

INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1005, 5, 'Very exciting story');

INSERT INTO bd_flix.star_billings(actor_id, title_id,comments)
values (1006, 6, 'Very interesting');

select * FROM star_billings;


-- --INSERTS PARA TABLA MEDIA
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('DVD',1);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('BLR',1);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('VHS',2);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('DVD',3);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('VHS',3);
INSERT INTO MEDIA 
	( FORMAT, TITLE_ID)
	VALUES ('DVD',4);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('VHS',5);
INSERT INTO MEDIA 
	( FORMAT, TITLE_ID)
	VALUES ('BLR',5);
INSERT INTO MEDIA 
	(FORMAT, TITLE_ID)
	VALUES ('VHS',6);
INSERT INTO MEDIA 
	( FORMAT, TITLE_ID)
	VALUES ('DVD',6);
select * FROM  media;

#--INSERTS PARA TABLA RENTAL HISTORY
INSERT INTO RENTAL_HISTORY 
	(MEDIA_ID, RENTAL_DATE, CUSTOMER_ID, RETURN_DATE)
	VALUES (92, '2022-10-15', 101, '2022-10-30');

INSERT INTO RENTAL_HISTORY 
	(MEDIA_ID, RENTAL_DATE, CUSTOMER_ID, RETURN_DATE)
	VALUES (93, '2022-10-03', 102, '2022-10-25');

INSERT INTO RENTAL_HISTORY 
	(MEDIA_ID, RENTAL_DATE, CUSTOMER_ID, RETURN_DATE)
	VALUES (94, '2022-09-29', 103,'2022-10-22');

INSERT INTO RENTAL_HISTORY 
	(MEDIA_ID, RENTAL_DATE, CUSTOMER_ID, RETURN_DATE)
	VALUES (95, '2022-10-22', 104,'2022-11-07');

select * from  rental_history;

