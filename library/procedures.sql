/*********************************** library - procedures ******************************************/
DELIMITER **
    CREATE OR REPLACE PROCEDURE insertL (In bID INT, vQty INT, mID INT)
        BEGIN
            -- Declaring variables
            DECLARE vBy VARCHAR(255);
            DECLARE vAuthor VARCHAR(255);
            DECLARE vbookName VARCHAR(255);

            -- Selecting values into the variableset
            SELECT author INTO vAuthor FROM books WHERE id = bID;
            SELECT memberName INTO vBy FROM member WHERE id = mID;
            SELECT bookName INTO vbookName FROM books WHERE id = bID;

            -- Inserting values into the table
            INSERT INTO lib (bookID, bookName, author, qty, dateBorrowed, returnDate, remindDate, overDueDate, borrowedBy, memberID) VALUES
                (bID, vbookName, vAuthor, vQty, CURDATE(), CURDATE() + INTERVAL 4 WEEK, CURDATE() + INTERVAL 3 WEEK, CURDATE() + INTERVAL 5 WEEK, vBy, mID);
        END **

  
DELIMITER **
    CREATE OR REPLACE PROCEDURE userSearch (in vID INT)
        BEGIN
                /*  This procedure search after the given user in the lib table */
        SELECT bookName, author, qty, dateBorrowed, overDueDate AS ReturnDate, borrowedBy, memberID FROM lib WHERE borrowedBy = (SELECT memberName FROM member WHERE id =vID);
        
        END **

DELIMITER **
    CREATE OR REPLACE PROCEDURE returnBook (IN vID INT)
        BEGIN
            /*  This procedure returns a book from the library */
            -- Declareing variables 

            DECLARE vOverDueDate TYPE OF lib.overDueDate;
            DECLARE vCurDate TYPE OF lib.overDueDate;
            DECLARE vLCash TYPE OF members.lCash;
            DECLARE vBookedBy TYPE OF lib.borrowedBy;
            
            -- Selecting values into the variable
            SELECT borrowedBy INTO vBookedBy FROM lib WHERE id=vID;
            SELECT lCash INTO vLCash FROM member WHERE memberName=vBookedBy;
            SELECT overdueDate INTO vOverDueDate FROM lib WHERE id = vID;
            SELECT CURDATE() INTO vCurDate;
         
            CASE
                --  Creating a case to do stuff if the condition is true
                WHEN CURDATE() > DATE(overDueDate) THEN
                    UPDATE member SET lCash = LCash+10 WHERE memberName = vBookedBy;
                    DELETE FROM lib WHERE id = vID;

                WHEN CURDATE() <= OverDueDate THEN
                    DELETE FROM lib WHERE id=vID;
            END CASE;

        END **
/**************************************************************************************************/

/***************************************** Books - procedures ***********************************/

    CREATE OR REPLACE PROCEDURE newBookRecord(IN vbookName VARCHAR(255), IN vAuthor VARCHAR(255), IN vPrice DECIMAL(6.2), IN vQty INT, vMax INT, IN vGenre VARCHAR(255), IN vSub VARCHAR(255)) 
        BEGIN
            -- Inserting values to the books table
            INSERT INTO books(bookName, author, price, qty, maxQty, genre, subgenre) VALUES
            (vbookName , vAuthor, vPrice, vQty, vMax, vGenre, vSub);
        END **

DELIMITER **

 DELIMITER **

    CREATE OR REPLACE PROCEDURE searchBook(IN vBook VARCHAR(255))
        BEGIN
            /*  This procedure search after books based on the book id*/
            SELECT bookName, author, price, qty, genre, subgenre FROM books WHERE id=vBook;
        END **
DELIMITER **

    CREATE OR REPLACE PROCEDURE addDiscount(IN vID INT, IN vDiscount INT)
        BEGIN
            /*  This procedure creates discounts on books*/

            -- Declare variables
            
            DECLARE vPrice TYPE OF books.price;
            DECLARE vDate TYPE OF books.dealDate;
            DECLARE vDiscount TYPE OF books.price;
            DECLARE vPriceUpdate TYPE OF books.price;
            DECLARE vEndDate TYPE OF books.dealEndDate;
            
            -- Give the variables a value 
            SET vDiscount = vDiscount;
            SET vDate = CURDATE() + INTERVAL 1 WEEK;
            SET vEndDate = CURDATE() + INTERVAL 2 WEEK;
            

            -- Selecting values into variables
            SELECT price INTO vPrice FROM books WHERE id = vID;

            SET vPriceUpdate = vDiscount % vPrice;
            SET vDiscount = vPrice/vPriceUpdate;

            
            UPDATE books SET dealDate = vDate WHERE id = vID;
            UPDATE books SET deals = vprice - vPriceUpdate WHERE id = vID;
            UPDATE books SET dealEndDate = vEndDate WHERE id = vID;
            UPDATE books SET discount = vPriceUpdate WHERE id = vID;
        END **

