/*************************************** Member - procedures ************************************/
DELIMITER **

    CREATE OR REPLACE PROCEDURE insertM(IN mName VARCHAR(255), IN vMail VARCHAR(255), IN vNum INT) 
        BEGIN
            -- Inserting values to the teacher table
            INSERT INTO member(memberName, eMail, phoneNum) 
            VALUES (mName, vMail, vNum);
        END **


DELIMITER **

DELIMITER 
    CREATE OR REPLACE PROCEDURE updatelCash (IN vID INT, IN vlCash DECIMAL(6.2))
        BEGIN
            -- Updates a user's credits -- testing
            UPDATE member SET lCasg = vlCash WHERE id= vID;
        END **
/**************************************************************************************************/

