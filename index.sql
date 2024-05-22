--Индексы для таблицы applicants.student
--Индексы созданы на столбцах, которые часто используются для фильтрации или
-- сортировки данных (имя студента, ID школы, баллы по предметам, бюджет).
CREATE INDEX student_full_name_idx ON applicants.student (full_name);
CREATE INDEX student_school_id_idx ON applicants.student (school_id);
CREATE INDEX student_math_score_idx ON applicants.student (math_score);
CREATE INDEX student_budget_idx ON applicants.student (budget);

-- Индексы для таблицы applicants.school
-- Индексы созданы на столбцах, по которым часто выполняется поиск информации (название школы, город)
CREATE INDEX school_name_idx ON applicants.school (school_name);
CREATE INDEX school_city_idx ON applicants.school (city);

-- Индексы для таблицы applicants.olympia
-- Индексы созданы на столбцах, по которым часто выполняется поиск информации (название олимпиады, предмет)
CREATE INDEX olympiad_name_idx ON applicants.olympiad (olympiad_name);
CREATE INDEX olympiad_subject_name_idx ON applicants.olympiad (subject_name);

-- Индексы для таблицы applicants.university
-- Индексы созданы на столбцах, которые используются для фильтрации и сортировки данных
-- (название университета, факультет, минимальный балл, количество мест).
CREATE INDEX university_name_idx ON applicants.university (university_name);
CREATE INDEX university_faculty_name_idx ON applicants.university (faculty_name);