/*
DATABASE Name 
Collage Library System

Author
Krigjo25

Project start
Monday, 04.10-21 : 18:00:00

Project tested


Project Finished
*/
DROP DATABASE lib;
-- *****************  Database Creation ***********************************
CREATE DATABASE lib;                         
DELIMITER ;
/* **************************************************************************************************/

/********************************************* Table for members ***********************************/
    CREATE TABLE memberRegistration (
                                memberID BIGINT NOT NULL AUTO_INCREMENT,
                                firstName VARCHAR(255) NOT NULL,
                                middleName VARCHAR(255),
                                lastName VARCHAR(255) NOT NULL,
                                lCash DECIMAL(6,2) DEFAULT 0.00,
                                eMail VARCHAR(255) NOT NULL,
                                phoneNum INT NOT NULL,
                                demo1 VARCHAR(255), 
                                demo VARCHAR(255),

                                --  Table Constraints
                                INDEX(firstName, middleName, lastName);
DELIMITER ;
/* **************************************************************************************************/


DELIMITER ;
-- *****************  Table for Books ***********************************
    CREATE TABLE books (    id INT NOT NULL AUTO_INCREMENT,
                            bookName VARCHAR(255) NOT NULL,
                            author VARCHAR(255) NOT NULL,
                            price DECIMAL(6,2) NOT NULL,
                            qty INT N  OT NULL,
                            maxQty INT NOT NULL DEFAULT 10,
                            genre VARCHAR(255),
                            subgenre VARCHAR(255),
                            discount DECIMAL(6,2), 
                            deals DECIMAL(6,2),
                            dealDate DATE,
                            dealEndDate DATE),
                            PRIMARY KEY (id, bookName, author));


/* **************************************************************************************************/