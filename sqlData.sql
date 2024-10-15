/* *************************** Database Creation / Drop ***********************************

CREATE DATABASE IF NOT EXISTS library;
CREATE DATABASE IF NOT EXISTS bookOrms;
CREATE DATABASE IF NOT EXISTS employeement;
CREATE DATABASE IF NOT EXISTS  libraryArchive;                         


*****************************************************************************************/

/* *************************** Selecting Tables ***********************************

                SELECT * FROM lib;
                SELECT * FROM books;
                SELECT * FROM member;
                SELECT * FROM terminmember;
                SELECT * FROM terminatedBooks;
                
*****************************************************************************************/

/**************************** Procedures member's table ***********************************
                
                CALL updatelCash(vID, lcash)                                                    --      Update the given member's credit
                CALL insertM('Jhon Doe', 'jhoDoe@gmail.com', 12345678);                         --      Add a new member to the list

*****************************************************************************************/

/* *************************** Procedures books table ***********************************
                
                CALL bookSearch(1);                                                             --      Searching for a book
                CALL insertB('bookName', 'author', 1000.00, 50, 48, 'Demo Genre', 'test');      --      Inserting a book into books
*****************************************************************************************/

/***************************** Procedures library **************************************

                CALL returnBook(vID)                                                            --      Return a book for the given member
                CALL userSearch(vID)                                                            --      Search after a user to see the given rented books
                CALL insertB(14,1,12) 
                CALL insertB(14, 'DemoTitle', 'Jhon Doe', 1, 'Jhon Doe', 12)                    --      Rent out a book for the given member
                
*****************************************************************************************/
INSERT INTO  books (bookName, author, price, qty, genre, subgenre) VALUES 
('Yrkesfaglig', 'Capplendiem', 643, 50,'Dokumentar & fakta', 'Fagbøker' ),
('Komunikasjon', 'Capplendiem', 844, 50,'Dokumentar & fakta', 'Fagbøker' ),
('Livstil', 'Capplendiem', 100, 50,'Dokumentar & fakta', 'Fagbøker' ),
('Anatomi', 'Capplendiem', 100, 50,'Dokumentar & fakta', 'Fagbøker' ),
('Engelsk', 'Capplendiem', 100, 50, 'Dokumentar & fakta', 'Fagbøker' ),
('Norsk', 'Capplendiem', 100, 50, 'Dokumentar & fakta', 'Fagbøker' ),
('Samfunnsfag', 'Capplendiem', 100, 50,'Dokumentar & fakta', 'Fagbøker'),
('Let it go', 'David R.Hawkings', 100, 50, 'Dokumentar & fakta', 'Fagbøker' ),
('Healing', 'David R. Hawkings', 100, 50, 'Dokumentar & fakta', 'Fagbøker' ),
('Romantiske reisen', 'Jhon Doe', 100, 50, 'Romaner', 'Romantikk' ),
('Romeo & Julie', 'ShakeSpare', 100, 50, 'Romaner', 'Romantikk'),
('Tog heistet', 'J.S.Doe', 100, 50, 'Krim', 'Heist' ),
('Mordet på Mayerstreet', 'demo', 100, 50,  'Krim', 'Mord og mysterier'),
('DemoTitle', 'Jhon Doe', 100, 50, 'Genre', 'subGenre');

DELIMITER

INSERT INTO member (memberName, email, phoneNum) VALUES
('Jake Trampe', 'demo@domain.com', 12345678),
('Julie Laker', 'demo@domain.com', 12345678),
('Fiona Farfaraway', 'demo@domain.com', 12345678),
('Simon Bridge', 'demo@domain.com',2345678),
('Sofi Hakabuna', 'demo@domain.com', 12345678),
('Jack Hack', 'demo@domain.com', 12345678),
('Arne Rønnestad', 'demo@domain.com',12345678),
('Patrick Drammesund', 'demo@domain.com', 12345678),
('Thomas Sunde', 'demo@domain.com', 12345678),
('Ida Sunndal', 'demo@domain.com', 12345678),
('Jane Doe', 'demo@domain.com', 12345678),
('Jack Packt', 'demo@domain.com',12345678);
