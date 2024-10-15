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
DELIMITER

    CREATE TABLE  lib(  id INT NOT NULL AUTO_INCREMENT,
                        bookID INT NOT NULL,
                        bookName VARCHAR(255) NOT NULL,
                        author VARCHAR(255) NOT NULL,
                        qty INT NOT NULL,
                        dateBorrowed DATE NOT NULL DEFAULT CURDATE(),
                        remindDate DATE NOT NULL,
                        returnDate DATE NOT NULL,
                        overDueDate DATE NOT NULL,
                        borrowedBy VARCHAR(255) NOT NULL,
                        memberID INT NOT NULL,
                        demoColumn VARCHAR(255),
                        PRIMARY KEY(id, bookID, memberID),
                            CONSTRAINT memberFK FOREIGN KEY (memberID) REFERENCES member(id) ON DELETE CASCADE ON UPDATE CASCADE,
                            CONSTRAINT bookFK FOREIGN KEY (bookID) REFERENCES books(id) ON DELETE CASCADE ON UPDATE CASCADE);
/* **************************************************************************************************/