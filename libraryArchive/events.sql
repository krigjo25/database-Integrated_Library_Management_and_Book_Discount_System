/*****************  Deletes records from termination *****************************/
/*
Del records*/
DELIMITER **
    CREATE OR REPLACE EVENT delRecords
    ON SCHEDULE EVERY 1 DAY -- Schedule the time for the event
    DO BEGIN
            
                -- Deletes records from given tables with-in 12 hours
            DELETE FROM terminBooks WHERE terminate = terminate < DATE_SUB(NOW(), INTERVAL 12 HOUR);
            DELETE FROM terminMember WHERE terminate < DATE_SUB(NOW(), INTERVAL 12 HOUR);
    END **
/************************************************************************************/



