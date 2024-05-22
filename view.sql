-- Представление для информации о студентах с указанием школы
CREATE VIEW applicants.student_with_school AS
SELECT
    s.student_id,
    s.full_name,
    s.math_score,
    s.rus_score,
    s.bio_score,
    s.chem_score,
    s.eng_score,
    s.inf_score,
    s.phys_score,
    s.budget,
    sch.school_name,
    sch.city,
    sch.official_school_rating
FROM
    applicants.student s
JOIN
    applicants.school sch ON s.school_id = sch.school_id;


-- Представление для информации об университетах с количеством поступивших студентов
CREATE VIEW applicants.university_with_student_count AS
SELECT
    u.university_id,
    u.university_name,
    u.faculty_name,
    u.min_score_budget,
    u.budget_place_number,
    u.min_score_payed,
    u.payed_place_number,
    u.payed_cost,
    COUNT(DISTINCT sxu.student_id) AS student_count
FROM
    applicants.university u
LEFT JOIN
    applicants.student_x_university sxu ON u.university_id = sxu.university_id
GROUP BY
    u.university_id,
    u.university_name,
    u.faculty_name,
    u.min_score_budget,
    u.budget_place_number,
    u.min_score_payed,
    u.payed_place_number,
    u.payed_cost;

-- Представление для информации о студентах с указанием олимпиад
CREATE VIEW applicants.student_with_olympiads AS
SELECT
    s.student_id,
    s.full_name,
    o.olympiad_name,
    o.subject_name,
    o.degree
FROM
    applicants.student s
JOIN
    applicants.student_x_olympiad sxo ON s.student_id = sxo.student_id
JOIN
    applicants.olympiad o ON sxo.olympiad_id = o.olympiad_id;

-- Представление для информации о студентах с указанием "целевого обучения"
CREATE VIEW applicants.student_with_company AS
SELECT
    s.student_id,
    s.full_name,
    c.company_name
FROM
    applicants.student s
JOIN
    applicants.company_x_university_student cxus ON s.student_id = cxus.student_id
JOIN
    applicants.company c ON cxus.company_id = c.company_id;
