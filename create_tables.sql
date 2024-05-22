DROP SCHEMA  IF EXISTS applicants CASCADE;

-- Создание таблиц

-- Создание схемы БД поступающих в российские ВУЗы
CREATE SCHEMA applicants;

-- Информация о школах
CREATE TABLE applicants.school(
  school_id SERIAL PRIMARY KEY,
  school_name VARCHAR NOT NULL,
  city VARCHAR NOT NULL,
  official_school_rating  INT NOT NULL UNIQUE
);

-- Информация о поступающих
CREATE TABLE applicants.student(
  student_id SERIAL PRIMARY KEY,
  full_name VARCHAR NOT NULL,
  school_id SERIAL,
  FOREIGN KEY (school_id)
    REFERENCES applicants.school(school_id),
  math_score INT NOT NULL CHECK (math_score >= 0) CHECK (math_score <= 100),
  rus_score INT NOT NULL CHECK (rus_score >= 0) CHECK (rus_score <= 100),
  bio_score INT CHECK (bio_score >= 0) CHECK (bio_score <= 100),
  chem_score INT CHECK (chem_score >= 0) CHECK (chem_score <= 100),
  eng_score INT CHECK (eng_score >= 0) CHECK (eng_score <= 100),
  inf_score INT CHECK (inf_score >= 0) CHECK (inf_score <=100),
  phys_score INT CHECK (phys_score >= 0) CHECK (phys_score <= 100),
  budget INT
);

-- Информация об олимпиадах
CREATE TABLE applicants.olympiad(
  olympiad_id SERIAL PRIMARY KEY,
  olympiad_name VARCHAR NOT NULL,
  subject_name VARCHAR NOT NULL,
  degree INT NOT NULL CHECK (degree >= 1) CHECK (degree <= 3)
);

-- Информация об университетах
CREATE TABLE applicants.university(
  university_id SERIAL PRIMARY KEY,
  university_name VARCHAR NOT NULL,
  faculty_name VARCHAR NOT NULL UNIQUE,
  min_score_budget INT NOT NULL CHECK (min_score_budget >= 0),
  budget_place_number INT NOT NULL CHECK (budget_place_number >= 0),
  min_score_payed INT NOT NULL CHECK (min_score_payed >= 0),
  payed_place_number INT NOT NULL CHECK (payed_place_number >= 0),
  payed_cost INT
);

--Информация об компаниях-целевиках
CREATE TABLE applicants.company(
  company_id SERIAL PRIMARY KEY,
  company_name VARCHAR NOT NULL
);

-- Таблица-связка 'студент-олимпиада'
CREATE TABLE applicants.student_x_olympiad(
  student_id SERIAL NOT NULL,
  olympiad_id SERIAL NOT NULL,
  PRIMARY KEY (student_id, olympiad_id),
  FOREIGN KEY (student_id)
    REFERENCES applicants.student(student_id),
  FOREIGN KEY (olympiad_id)
    REFERENCES applicants.olympiad(olympiad_id)
);

-- Таблица-связка 'студент-университет'
CREATE TABLE applicants.student_x_university(
  current_id SERIAL NOT NULL,
  last_id SERIAL NOT NULL,
  student_id SERIAL NOT NULL,
  university_id SERIAL NOT NULL,
  PRIMARY KEY (current_id),
  FOREIGN KEY (student_id)
    REFERENCES applicants.student(student_id),
  FOREIGN KEY (university_id)
    REFERENCES applicants.university(university_id),
  rating INT NOT NULL,
  time timestamp NOT NULL,
  priority INT NOT NULL,
  is_budget BOOL NOT NULL
);

-- Таблица-связка 'университет-олимпиада'
CREATE TABLE applicants.university_x_olympiad(
  university_id SERIAL NOT NULL,
  olympiad_id SERIAL NOT NULL,
  PRIMARY KEY (university_id, olympiad_id),
  FOREIGN KEY (university_id)
    REFERENCES applicants.university(university_id),
  FOREIGN KEY (olympiad_id)
    REFERENCES applicants.olympiad(olympiad_id),
  benefit_id INT NOT NULL,
  benefit_name VARCHAR NOT NULL
);

-- Таблица-связка 'компания-университет'
CREATE TABLE applicants.company_x_university(
  company_id INT NOT NULL,
  university_id INT NOT NULL,
  PRIMARY KEY (university_id, company_id),
  FOREIGN KEY (university_id)
    REFERENCES applicants.university(university_id),
  FOREIGN KEY (company_id)
    REFERENCES applicants.company(company_id),
  place_number INT NOT NULL
);

--Таблица-связка 'компания-университет-студенты'
CREATE TABLE applicants.company_x_university_student(
  company_id INT NOT NULL,
  university_id INT NOT NULL,
  student_id SERIAL NOT NULL,
  PRIMARY KEY (university_id, company_id, student_id),
  FOREIGN KEY (university_id)
    REFERENCES applicants.university(university_id),
  FOREIGN KEY (company_id)
    REFERENCES applicants.company(company_id),
  FOREIGN KEY (student_id)
    REFERENCES applicants.student(student_id)
);




SELECT
    res.room_id,
    u.name AS last_tenant_name,
    MAX(res.end_date) AS last_checkout_date
From Reservations AS res
JOIN Users AS u ON res.user_id = u.id
GROUP BY res.room_id, u.name
HAVING COUNT(DISTINCT res.id) >= 1;

