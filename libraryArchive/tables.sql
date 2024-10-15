--  *****************  Table for Books ***********************************
CREATE TABLE terminBooks (      id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                bookName VARCHAR(255) NOT NULL,
                                author VARCHAR(255) NOT NULL,
                                price DECIMAL(6,2) NOT NULL,
                                qty INT NOT NULL,
                                genre VARCHAR(255),
                                subgenre VARCHAR(255), 
                                demo VARCHAR(255),
                                subdemo VARCHAR(255),
                                terminate TIMESTAMP NOT NULL);

DELIMITER

CREATE TABLE  returnedBooks(    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                bookID INT NOT NULL,
                                bookName VARCHAR(255) NOT NULL,
                                author VARCHAR(255) NOT NULL,
                                returnDate DATE NOT NULL DEFAULT CURDATE(),
                                borrowedBy VARCHAR(255) NOT NULL,
                                memberID INT NOT NULL,
                                terminate TIMESTAMP NOT NULL,
                                demoColumn VARCHAR(255));

CREATE TABLE  missingBooks(    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                bookID INT NOT NULL,
                                bookName VARCHAR(255) NOT NULL,
                                author VARCHAR(255) NOT NULL,
                                returnDate DATE NOT NULL DEFAULT CURDATE(),
                                borrowedBy VARCHAR(255) NOT NULL,
                                memberID INT NOT NULL,
                                terminate TIMESTAMP NOT NULL,
                                demoColumn VARCHAR(255));

/* **************************************************************************************************/