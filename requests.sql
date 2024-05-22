-- Вывести имена студентов, которые участвовали в олимпиаде Физтех

SELECT DISTINCT s.full_name
FROM applicants.student s
JOIN applicants.student_x_olympiad sxo ON s.student_id = sxo.student_id
JOIN applicants.olympiad o ON sxo.olympiad_id = o.olympiad_id
WHERE o.olympiad_name = 'Физтех';

-- Вывести средний балл по математике среди студентов, которые поступили в МГУ на бюджет

SELECT AVG(s.math_score) AS average_math_score
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
JOIN applicants.university u ON sxu.university_id = u.university_id
WHERE u.university_name = 'МГУ'
AND sxu.is_budget = TRUE;

-- Вывести информацию о студентах, которые поступили на целевое обучение в Тинькофф

SELECT s.*
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
JOIN applicants.company_x_university_student cxus ON s.student_id = cxus.student_id
JOIN applicants.company c ON cxus.company_id = c.company_id
WHERE c.company_name = 'Тинькофф';

-- Вывести список университетов, в которых есть целевое обучение от компании РКЦ

SELECT DISTINCT u.university_name
FROM applicants.university u
JOIN applicants.company_x_university cxu ON u.university_id = cxu.university_id
JOIN applicants.company c ON cxu.company_id = c.company_id
WHERE c.company_name = 'РКЦ';

-- Вывести информацию о студентах, которые поступили в МФТИ на бюджет и имели БВИ по олимпиаде 'Физтех'

SELECT s.*
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
JOIN applicants.university u ON sxu.university_id = u.university_id
JOIN applicants.student_x_olympiad sxo ON s.student_id = sxo.student_id
JOIN applicants.olympiad o ON sxo.olympiad_id = o.olympiad_id
WHERE u.university_name = 'МФТИ'
AND sxu.is_budget = TRUE
AND o.olympiad_name LIKE 'Физтех';


-- Вывести список школ, из которых в МГУ поступило больше всего студентов

SELECT s.school_id, sch.school_name, COUNT(s.student_id) AS student_count
FROM applicants.student s
JOIN applicants.school sch ON s.school_id = sch.school_id
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
JOIN applicants.university u ON sxu.university_id = u.university_id
WHERE u.university_name = 'МГУ'
GROUP BY s.school_id, sch.school_name
ORDER BY student_count DESC
LIMIT 5;

-- Вывести информацию о студентах, которые поступили в университет с наивысшим рейтингом среди всех поступавших
-- в этот университет

SELECT s.full_name, sxu.university_id, sxu.rating
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
WHERE sxu.rating = (SELECT MAX(rating) FROM applicants.student_x_university WHERE university_id = sxu.university_id);


-- Вывести информацию о студентах, которые поступили в университет с наибольшим количеством мест на "целевое обучение"

SELECT s.full_name, u.university_name, SUM(cxus.student_id) OVER (PARTITION BY u.university_id) AS total_company_students
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id
JOIN applicants.university u ON sxu.university_id = u.university_id
JOIN applicants.company_x_university_student cxus ON s.student_id = cxus.student_id
GROUP BY s.full_name, u.university_name
ORDER BY total_company_students DESC
LIMIT 1;

-- Вывести информацию о студентах с указанием их рейтинга среди всех поступающих в тот же университет:**

SELECT s.full_name, sxu.university_id, sxu.rating,
       RANK() OVER (PARTITION BY sxu.university_id ORDER BY sxu.rating DESC) AS ranking
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id;

-- Вывести информацию о университетах с указанием количества поступивших в них студентов:

SELECT u.university_name, COUNT(DISTINCT sxu.student_id) AS student_count
FROM applicants.university u
JOIN applicants.student_x_university sxu ON u.university_id = sxu.university_id
GROUP BY u.university_name
ORDER BY student_count DESC;


-- Вывести информацию о студентах с указанием их места в рейтинге по математике среди всех студентов, поступивших в тот же университет:**

SELECT s.full_name, sxu.university_id, s.math_score,
       RANK() OVER (PARTITION BY sxu.university_id ORDER BY s.math_score DESC) AS math_ranking
FROM applicants.student s
JOIN applicants.student_x_university sxu ON s.student_id = sxu.student_id;