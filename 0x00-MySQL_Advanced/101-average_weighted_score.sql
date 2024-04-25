-- Script Sql
DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE cur CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO user_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE users
        SET average_score = (
            SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
            FROM corrections
            INNER JOIN projects ON projects.id = corrections.project_id
            WHERE corrections.user_id = user_id
        )
        WHERE id = user_id;
    END LOOP;
    CLOSE cur;
END $$
DELIMITER ;
