DROP DATABASE IF EXISTS DZ6;
CREATE DATABASE IF NOT EXISTS DZ6;
USE DZ6;




DELIMITER //
DROP FUNCTION IF EXISTS int_to_time;
CREATE FUNCTION int_to_time(a INT) 
RETURNS TEXT
DETERMINISTIC 
BEGIN
	DECLARE result INT DEFAULT 0;
    DECLARE result_str TEXT DEFAULT NULL;
    DECLARE seconds INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE days INT DEFAULT 0;
    SET seconds = MOD(a, 60);
    SET a = a div 60;
    SET minutes = MOD(a, 60);
    SET a = a div 60;
    SET hours = MOD(a, 24);
    SET days = a div 24;
    SET result_str = concat(days,' ','days',' ',hours,' ','hours',' ', minutes,' ','minutes',' ', seconds,' ', 'seconds');
	RETURN result_str;      
END // 
DELIMITER ;



SELECT int_to_time(123456);


DELIMITER //
DROP PROCEDURE IF EXISTS evensnum;
CREATE PROCEDURE evensnum()
BEGIN
	DECLARE num INT DEFAULT 0;
	DROP TABLE IF EXISTS numbers;
	CREATE TABLE numbers(nums INT);
	WHILE num < 10 DO
		SET num = num + 2;
		INSERT INTO DZ6.numbers(nums)
		VALUES(num);
	END WHILE;
	SELECT * FROM DZ6.numbers;
END //
DELIMITER ;


CALL evensnum();