/*****************  Trigger an event to send a mail using python *****************************/
DELIMITER **
CREATE OR REPLACE EVENT sendMail 
ON SCHEDULE EVERY 1 DAY
DO  
    BEGIN
        -- Declare variables
        DECLARE cmd VARCHAR(255);
        DECLARE result INT(10);

        -- set variables
        SET cmd = CONCAT('home/krigjo25/libraryManageSystem/Python/sendMail.py');
        SET result = sys_exec(cmd);
    END **
/************************************************************************************/

/*****************  Deletes discounts and add discounts *****************************/
DELIMITER **
    CREATE OR REPLACE EVENT delDiscounts
    ON SCHEDULE EVERY 1 DAY -- Schedule the time for the event
    DO 
        BEGIN
                -- Deletes records from given tables with-in 12 hours
            UPDATE books SET discount = 0 WHERE dealEndDate < DATE_SUB(CURDATE(), INTERVAL 1 DAY);
            UPDATE books SET deals = 0 WHERE dealENDDate < DATE_SUB(CURDATE(), INTERVAL + 1 DAY);
        END **
/************************************************************************************/

/*****************  Deletes discounts and add discounts *****************************/

DELIMITER **
    CREATE OR REPLACE EVENT addDisount
    ON SCHEDULE EVERY 1 WEEK -- Schedule the time for the event
    DO 
        BEGIN
            -- Adds Discounts for books given tables with-in 12 hours
            CALL addDiscount(1,10);
            CALL addDiscount(3,20);
        END **
/************************************************************************************/