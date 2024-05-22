-- Заполнение таблиц данными, CRUD-запросы
-- Заполнение таблицы 'school'
INSERT INTO applicants.school(school_name, city, official_school_rating)
  VALUES ('СУНЦ МГУ', 'Москва', 1),
         ('Физтех лицей', 'Долгопрудный', 2),
         ('СУНЦ НГУ', 'Новосибирск', 11),
         ('Лицей при ТПУ', 'Томск', 19),
         ('Школа №1580', 'Москва', 20),
         ('Физико-математический лицей №5', 'Долгопрудный', 13),
         ('Лицей №239', 'Санкт-Петербург', 7),
         ('Лицей КЭО', 'Ростов-на-Дону', 6),
         ('Школа №179', 'Москва', 8),
         ('Физико-математическая школа', 'Тюмень', 14);

-- Заполнение таблицы 'student'
INSERT INTO applicants.student(full_name, school_id, math_score, rus_score, bio_score, chem_score, eng_score, inf_score, phys_score, budget)
  VALUES ('Илья Иванов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физтех лицей'), 97, 100, NULL, NULL, 100, 99, NULL, NULL),
         ('Илья Мещерин', (SELECT school.school_id FROM applicants.school WHERE school_name = 'СУНЦ НГУ'), 68, 97, NULL, NULL, 94, 80, NULL, '10000'),
         ('Дмитрий Преин', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физико-математическая школа'), 90, 90, 100, 99, 94, NULL, NULL, NULL),
         ('Максим Соколовский', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей КЭО'), 88, 99, NULL, NULL, NULL, 95, NULL, '5000'),
         ('Яна Пигунова', (SELECT school.school_id FROM applicants.school WHERE school_name = 'СУНЦ МГУ'), 99, 86, NULL, NULL, NULL, NULL, 100, NULL),
         ('Влад Багрянов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей №239'), 100, 97, NULL, NULL, 98, 99, 96, NULL),
         ('Николай Рекут', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Школа №179'), 90, 95, NULL, NULL, 85, NULL, 96, NULL),
         ('Лиза Смирнова', (SELECT school.school_id FROM applicants.school WHERE school_name = 'СУНЦ НГУ'), 77, 100, 90, 100, NULL, NULL, NULL, '7000'),
         ('Александр Копертехов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Школа №1580'), 89, 90, NULL, NULL, NULL, 100, NULL, NULL),
         ('Дмитрий Ширяев', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей при ТПУ'), 55, 69, 95, 86, NULL, NULL, NULL, '15000'),
         ('Александр Баринов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физико-математический лицей №5'), 100, 89, NULL, NULL, 97, 88, NULL, NULL),
         ('Даниил Горюнов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физтех лицей'), 84, 99, 99, 70, NULL, NULL, NULL, '2000'),
         ('Никита Рябов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Школа №1580'), 84, 99, 100, 99, NULL, NULL, NULL, NULL),
         ('Виктор Петров', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физико-математическая школа'), 97, 95, NULL, NULL, NULL, NULL, 100, NULL),
         ('Тамара Юдина', (SELECT school.school_id FROM applicants.school WHERE school_name = 'СУНЦ МГУ'), 99, 100, NULL, NULL, NULL, 100, 100, NULL),
         ('Иван Кузнецов', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей при ТПУ'), 95, 88, NULL, NULL, NULL, 96, 88, NULL),
         ('Влад Топоровский', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Школа №179'), 67, 90, NULL, NULL, 100, NULL, 80, '11000'),
         ('Георгий Килинкаров', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей №239'), 88, 78, NULL, NULL, NULL, 98, 89, NULL),
         ('Александра Герасимова', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Физико-математический лицей №5'), 100, 99, NULL, NULL, 100, NULL, 100, '10000'),
         ('Алла Зайцева', (SELECT school.school_id FROM applicants.school WHERE school_name = 'Лицей КЭО'), 88, 89, NULL, NULL, NULL, 100, 90, '1000');

-- Заполнение таблицы 'olympiad'
INSERT INTO applicants.olympiad(olympiad_name, subject_name, degree)
  VALUES ('Физтех', 'математика', 1),
         ('Физтех', 'физика', 1),
         ('Высшая проба', 'информатика', 1),
         ('Высшая проба', 'физика', 1),
         ('Турнир городов', 'математика', 2),
         ('Росатом', 'математика', 2),
         ('Росатом', 'физика', 2),
         ('Курчатов', 'математика', 1),
         ('ВсОШ', 'экономика', 1),
         ('ВсОШ', 'биология', 1),
         ('ВсОШ', 'химия', 1),
         ('Русский медвежонок', 'русский язык', 3);

-- Заполнение таблицы 'university'
INSERT INTO applicants.university(university_name, faculty_name, min_score_budget, budget_place_number, min_score_payed, payed_place_number, payed_cost)
  VALUES ('МФТИ', 'ФПМИ', 305, 210, 290, 30, '4000'),
         ('МФТИ', 'ЛФИ', 308, 105, 285, 10, '3000'),
         ('МФТИ', 'ФАКТ', 280, 101, 250, 5, '2000'),
         ('МГУ', 'мехмат', 301, 150, 280, 40, '2000'),
         ('МГУ', 'медецинский', 390, 100, 356, 40, '6000'),
         ('МГУ', 'химический', 380, 120, 335, 50, '5000'),
         ('МИФИ', 'ядерная физика', 280, 160, 250, 30, '1000'),
         ('МИФИ', 'физика кристаллов', 275, 156, 240, 15, '500'),
         ('ВШЭ', 'матфак', 310, 50, 290, 15, '6000'),
         ('ВШЭ', 'экономический', 309, 30, 299, 10, '8000');

-- Заполнение таблицы 'company'
INSERT INTO applicants.company(company_name)
  VALUES ('Тинькофф'),
         ('Сбербанк'),
         ('РКЦ'),
         ('Алмаз-Антей'),
         ('ЦАГИ'),
         ('Российские космические системы'),
         ('Агат'),
         ('Орион'),
         ('ГосНИИАС'),
         ('ЦНИИмаш');

-- Заполнение таблицы 'student_x_olympiad'
INSERT INTO applicants.student_x_olympiad(student_id, olympiad_id)
  VALUES
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Илья Иванов'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Максим Соколовский'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Высшая проба' AND subject_name = 'информатика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Влад Багрянов'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Курчатов' AND subject_name = 'математика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Алла Зайцева'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'физика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Никита Рябов'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'ВсОШ' AND subject_name = 'химия')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Александра Герасимова'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Турнир городов' AND subject_name = 'математика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Влад Топоровский'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Илья Мещерин'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Высшая проба' AND subject_name = 'информатика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Даниил Горюнов'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'физика')),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Тамара Юдина'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика'));

-- Заполнение таблицы 'student_x_university'
INSERT INTO applicants.student_x_university(student_id, university_id, rating, priority, time, is_budget)
  VALUES
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Илья Иванов'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Максим Соколовский'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Александра Герасимова'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ЛФИ'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Тамара Юдина'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Дмитрий Преин'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'), 2, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Влад Багрянов'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Никита Рябов'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'химический'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Виктор Петров'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'ядерная физика'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Георгий Килинкаров'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'), 1, 1, current_date, True),
  ((SELECT student_id FROM applicants.student WHERE full_name = 'Алла Зайцева'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'физика кристаллов'), 1, 1, current_date, True);

-- Заполнение таблицы 'university_x_olympiad'
INSERT INTO applicants.university_x_olympiad(university_id, olympiad_id, benefit_id, benefit_name)
  VALUES
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'экономический'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'ВсОШ' AND subject_name = 'экономика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Росатом' AND subject_name = 'математика'),
   2,
   'сто баллов по математике'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Турнир городов' AND subject_name = 'математика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'ядерная физика'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Росатом' AND subject_name = 'физика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ЛФИ'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'физика'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'химический'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'ВсОШ' AND subject_name = 'химия'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'медецинский'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'ВсОШ' AND subject_name = 'биология'),
   1,
   'БВИ'),
  ((SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФАКТ'),
   (SELECT olympiad_id FROM applicants.olympiad WHERE olympiad_name = 'Физтех' AND subject_name = 'математика'),
   1,
   'БВИ');


--Заполнение таблицы 'company-x-university'
INSERT INTO applicants.company_x_university(company_id, university_id, place_number)
  VALUES
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Тинькофф'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'), 5),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Сбербанк'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'), 5),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'РКЦ'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ЛФИ'), 9),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Алмаз-Антей'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'), 5),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ЦАГИ'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'), 5),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Российские космические системы'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'), 10),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Агат'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'химический'), 8),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Орион'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'ядерная физика'), 7),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ГосНИИАС'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'), 9),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ЦНИИмаш'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'физика кристаллов'), 4);

--Заполнение таблицы 'company-x-university-student'
INSERT INTO applicants.company_x_university_student(company_id, university_id, student_id)
  VALUES
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Тинькофф'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Илья Иванов')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Сбербанк'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Максим Соколовский')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'РКЦ'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ЛФИ'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Александра Герасимова')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Алмаз-Антей'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Тамара Юдина')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ЦАГИ'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МФТИ' AND faculty_name = 'ФПМИ'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Дмитрий Преин')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Российские космические системы'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'ВШЭ' AND faculty_name = 'матфак'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Влад Багрянов')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Агат'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'химический'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Никита Рябов')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'Орион'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'ядерная физика'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Виктор Петров')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ГосНИИАС'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МГУ' AND faculty_name = 'мехмат'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Георгий Килинкаров')),
  ((SELECT company_id FROM applicants.company WHERE company_name = 'ЦНИИмаш'),
   (SELECT university_id FROM applicants.university WHERE university_name = 'МИФИ' AND faculty_name = 'физика кристаллов'),
   (SELECT student_id FROM applicants.student WHERE full_name = 'Алла Зайцева'));
