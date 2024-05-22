-- Создание процедур/функций

--Функция для получения списка университетов, принимающих студентов с определенным баллом по математике:
CREATE OR REPLACE FUNCTION applicants.get_universities_by_math_score(
  p_math_score INT
)
RETURNS TABLE (university_id INT, university_name VARCHAR)
AS $$
BEGIN
  RETURN QUERY
    SELECT u.university_id, u.university_name
    FROM applicants.university u
    WHERE u.min_score_budget <= p_math_score;
END;
$$ LANGUAGE plpgsql;

-- Процедура для добавления новой олимпиады:

CREATE OR REPLACE PROCEDURE add_olympiad(
    IN olympiad_name VARCHAR,
    IN subject_name VARCHAR,
    IN degree INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO applicants.olympiad (olympiad_name, subject_name, degree)
    VALUES (olympiad_name, subject_name, degree);
    COMMIT;
END;
$$;

-- Получение списка студентов, прошедших на бюджет
CREATE OR REPLACE FUNCTION applicants.get_budget_students()
  RETURNS TABLE (student_id INT, full_name VARCHAR, school_name VARCHAR)
AS $$
BEGIN
  RETURN QUERY
    SELECT s.student_id, s.full_name, sc.school_name
    FROM applicants.student s
    JOIN applicants.school sc ON s.school_id = sc.school_id
    WHERE s.budget >= (SELECT min_score_budget FROM applicants.university LIMIT 1);
END;
$$ LANGUAGE plpgsql;
