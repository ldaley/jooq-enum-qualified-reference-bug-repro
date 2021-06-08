CREATE SCHEMA custom_schema;

CREATE TYPE custom_schema.mood AS ENUM ('sad', 'ok', 'happy');

CREATE TABLE custom_schema.moods
(
    mood custom_schema.mood CHECK (mood > 'sad')
);

CREATE FUNCTION custom_schema.some_procedure(mood custom_schema.mood DEFAULT NULL)
    RETURNS TABLE (id BIGINT) AS $$
BEGIN
END;
$$
LANGUAGE plpgsql;
