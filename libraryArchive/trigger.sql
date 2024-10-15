/*****************  Triggers to terminate members ***********************************/
    CREATE OR REPLACE TRIGGER termineMembers BEFORE DELETE ON bookOrms.member FOR EACH ROW
        BEGIN
            CASE
                WHEN OLD.lCash > 0 OR OLD.lCash < 0 THEN
                    INSERT INTO libraryArchive.terminMember (id, memberName, class, lCash, contactInfo) 
                    VALUES(OLD.id, OLD.memberName, OLD.lCash, OLD.contactInfo);
                    UPDATE terminStudent SET terminate = NOW() + INTERVAL 1 DAY;
            
                WHEN OLD.lCash = 0 THEN
                    INSERT INTO termin (id, memberName, contactInfo) 
                    VALUES(OLD.id, OLD.memberName, OLD.contactInfo);

                    UPDATE terminMember SET terminate = NOW() + INTERVAL 12 HOUR;
            END CASE;
        END ??
DELIMITER ??

/*****************  Triggers to terminate Books ***********************************/
    CREATE OR REPLACE TRIGGER termineBooks BEFORE DELETE ON library.books FOR EACH ROW
        BEGIN
            CASE
                         
                WHEN OLD.qty >= OLD.maxQty  THEN
                    INSERT INTO libraryArchive.terminBooks (id, bookName,author, price, qty, genre, subgenre) 
                    VALUES(OLD.id, OLD.bookName, OLD.author, OLD.price, OLD.qty, OLD.genre, OLD.subgenre);

                    UPDATE terminBook SET terminate = NOW() + INTERVAL 1 DAY;
            END CASE;
        END ??
/***********************************************************************************/


/*****************  Trigger, update the qty in Books***********************************/
DELIMITER ??    
    CREATE OR REPLACE TRIGGER updateQuantiy BEFORE INSERT ON lib FOR EACH ROW
        BEGIN
            DECLARE vQty TYPE OF books.qty;
            DECLARE borrow TYPE OF lib.qty;

            SELECT qty INTO borrow FROM lib WHERE id = NEW.id;
            SELECT qty INTO vQty FROM books WHERE id = NEW.bookID;
            UPDATE books SET qty = vQty-borrow WHERE id = NEW.bookID;
            id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                    bookID INT NOT NULL,
                                    bookName VARCHAR(255) NOT NULL,
                                    borrowedBy VARCHAR(255) NOT NULL,
                                    reminderDate DATE NOT NULL,
                                    returnDate DATE NOT NULL,
                                    demoColumn VARCHAR(255));

        END ??
DELIMITER ??    
    CREATE OR REPLACE TRIGGER returnBook  BEFORE DELETE ON library.lib FOR EACH ROW
        BEGIN
             -- Declaring variables
            DECLARE vQty TYPE OF books.qty;
            DECLARE curDate DATE;
            DECLARE returnBook TYPE OF books.qty;
            DECLARE overDue TYPE OF lib.returnDate;

            -- Selecting values into variables
            SET CurDate = CURDATE();

            SELECT qty INTO vQty FROM books WHERE id = OLD.bookID;
            SELECT qty INTO returnBook FROM lib WHERE bookID = OLD.bookID;
            SELECT overDueDate INTO overDue FROM lib WHERE bookID = OLD.bookID;

            -- Creating a case when returned date is higher than overDue date add update a fine
            CASE
            WHEN CURDATE() > overDue THEN
            UPDATE member SET lcash = lcash+10 WHERE id = OLD.memberID;
            END CASE; 

            -- Updating new values into books
            UPDATE books SET qty = vQty+returnBook WHERE id = OLD.bookID;

            -- Inserting values into returnedBooks
            INSERT INTO libraryArchive.returnedBooks (bookID, bookName, author, borrowedBy, memberID, terminate) VALUES 
            (OLD.bookID, OLD.bookName, OLD.author, OLD.borrowedBy, OLD.memberID, NOW() + INTERVAL 1 DAY);
        END ??

