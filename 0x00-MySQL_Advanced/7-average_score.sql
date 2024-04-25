-- Create procedure ComputeAverageScoreForUser
CREATE PROCEDURE ComputeAverageScoreForUser (
    @user_id INT
)
AS
BEGIN
    -- Declare variable to hold average score
    DECLARE @average_score DECIMAL(10, 2);

    -- Calculate average score
    SELECT @average_score = AVG(score)
    FROM corrections
    WHERE user_id = @user_id;

    -- Check if the user already has an entry in the average_scores table
    IF EXISTS (SELECT 1 FROM average_scores WHERE user_id = @user_id)
    BEGIN
        -- Update the existing entry
        UPDATE average_scores
        SET average_score = @average_score
        WHERE user_id = @user_id;
    END
    ELSE
    BEGIN
        -- Insert a new entry for the user
        INSERT INTO average_scores (user_id, average_score)
        VALUES (@user_id, @average_score);
    END;
END;
