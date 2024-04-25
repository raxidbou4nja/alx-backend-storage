-- Write a SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
DELIMITER *

CREATE PROCEDURE AddBonus (
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score DECIMAL(10,2)
)
BEGIN
    -- Check if the project exists, if not, create it
    IF NOT EXISTS (SELECT 1 FROM projects WHERE name = project_name) THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    -- Insert the correction for the student
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (
        user_id,
        (SELECT id FROM projects WHERE name = project_name),
        score
    );
END;

DELIMITER ;
