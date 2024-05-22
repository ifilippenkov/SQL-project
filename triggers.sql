-- Создание тригеров

-- Триггер для обновления рейтинга студента при изменении его баллов
CREATE OR REPLACE FUNCTION update_student_rating()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE applicants.student_x_university
  SET rating = (
    SELECT (
      (
        NEW.math_score + NEW.rus_score + NEW.bio_score + NEW.chem_score + NEW.eng_score + NEW.inf_score + NEW.phys_score
      ) / 7
    ) AS average_score
  )
  WHERE student_id = NEW.student_id AND university_id = NEW.university_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_student_rating_trigger
AFTER INSERT OR UPDATE OF math_score, rus_score, bio_score, chem_score, eng_score, inf_score, phys_score ON applicants.student
FOR EACH ROW EXECUTE PROCEDURE update_student_rating();

-- Автоматическое добавление студента в таблицу 'student_x_university'
CREATE OR REPLACE FUNCTION applicants.add_student_to_university()
RETURNS TRIGGER AS $$
DECLARE
  current_timestamp TIMESTAMP := CURRENT_TIMESTAMP;
BEGIN
  IF NEW.budget >= (SELECT min_score_budget FROM applicants.university WHERE university_id = NEW.university_id) THEN
    INSERT INTO applicants.student_x_university (
      student_id,
      university_id,
      rating,
      time,
      priority,
      is_budget
    )
    VALUES (
      NEW.student_id,
      NEW.university_id,
      0,  -- Рейтинг будет вычисляться позже
      current_timestamp,
      1,  -- Приоритет по умолчанию
      NEW.budget >= (SELECT min_score_budget FROM applicants.university WHERE university_id = NEW.university_id)
    );
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Триггер для автоматического добавления студентов в таблицу `student_x_olympiad` при добавлении новой олимпиады:

CREATE OR REPLACE FUNCTION applicants.add_students_to_olympiad()
RETURNS TRIGGER AS $$
BEGIN
  -- Получение списка студентов, которые участвовали в данной олимпиаде ранее
  INSERT INTO applicants.student_x_olympiad (student_id, olympiad_id)
  SELECT student_id, NEW.olympiad_id
  FROM applicants.student_x_olympiad
  WHERE olympiad_id = OLD.olympiad_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER add_students_to_olympiad_trigger
AFTER INSERT ON applicants.olympiad
FOR EACH ROW
EXECUTE FUNCTION applicants.add_students_to_olympiad();
