/*Usuario WEB y local*/
CREATE USER 'user_idiomas'@'localhost' IDENTIFIED BY 'secret@';
GRANT ALL ON idiomas.* TO 'user_idiomas'@'localhost';

/*Usuario remoto app*/
CREATE USER 'user_idiomas'@'%' IDENTIFIED BY 'secret@';
GRANT ALL ON idiomas.* TO 'user_idiomas'@'%';