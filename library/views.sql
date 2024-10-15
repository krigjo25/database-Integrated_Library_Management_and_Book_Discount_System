/*
Project name
    libraryManageSystem, views

Author 
   @krigjo25

Database
    MariaDB
 */
/****************************** Library **********************************/
CREATE OR REPLACE VIEW library AS SELECT
    lib.id,
    lib.bookID AS BookID,
    books.bookName AS BookName,
    lib.author AS Author,
    lib.qty AS AmmountBorrowed,
    lib.returnDate AS ReturnDate,
    lib.borrowedBy AS MemberName,
    lib.memberID AS MemberID,
    FROM lib JOIN books ON 
    lib.bookID = books.bookID
    WHERE bookID = libbookID; 
/*************************************************************************/

/******************************** Books **********************************/
CREATE OR REPLACE VIEW bookOverView AS SELECT
    books.id AS ID,
    books.bookName AS BookName,
    books.price AS Price,
    books.genre AS Genre,
    books.subgenre AS SubGenre,
    books.author AS Author,
    FROM books;
/*************************************************************************/
