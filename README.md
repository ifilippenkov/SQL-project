# Проект "Абитуриенты"

---

Имеется схема `applicants` для отслеживания поступающих в ВУЗы. В ней имеется информация о самих поступающих, их школе, олимпиадах, которые они выиграли, заявления в ВУЗы, а так же какие олимпиады катируются в то или иное высшее учебное заведение. Сама схема состоит из семи таблиц:

---

Таблица `school`:

school_id: идентификатор школы (SERIAL)  
school_name: название школы (VARCHAR)  
city: город, в котором расположена школа (VARCHAR)  
official_school_rating: место в официальном рейтинге всех школ (INT)  

Таблица `student`:

student_id: идентификатор школьника (SERIAL)  
full_name: имя и фамилия учащегося (VARCHAR)  
school_id: идентификатор его школы, внешний ключ, связанный с таблицей "school" (SERIAL)  
math_score, rus_score, bio_score, chem_score, eng_score, inf_score, phys_score: баллы школьника за экзамен по математике, русскому языку, биологии, химии, английскому языку, информатике и физике соответственно (INT)  
budget: деньги, которые готов потратить обучающийся на свое обучение в ВУЗе (MONEY)  

Таблица `olympiad`:

olympiad_id: идентификатор школьной олимпиады по определенному предмету (SERIAL)  
olympiad_name: название олимпиады (VARCHAR)  
subject_name: предмет олимпиады (VARCHAR)  
degree: степень диплома олимпиады (INT)  

Таблица `university`:

university_id: идентификатор университета и факультета (SERIAL)  
university_name: название университета (VARCHAR)  
faculty_name: название факультета (VARCHAR)  
min_score_budget: минимальная сумма баллов за экзамены для прохода на обучение на бюджетной основе (INT)  
budget_place_number: число мест для обучения на бюджете (INT)  
min_score_paid: минимальная сумма баллов за экзамены для прохождения на обучение на платной основе (INT)  
paid_place_number: число мест для обучения на платной основе (INT)  
paid_cost: стоимость обучения на платной основе (MONEY)  

Таблица 'company':
company_id: идентификатор компании, предоставляющей целевое обучение (SERIAL)
company_name: название компании (VARCHAR)

Таблица-связка `student_x_olympiad`:

student_id: идентификатор студента, внешний ключ, связанный с таблицей "student" (SERIAL)  
olympiad_id: идентификатор олимпиады, внешний ключ, связанный с таблицей "olympiad" (SERIAL)  
PRIMARY KEY: составной ключ из student_id и olympiad_id  

Таблица-связка `student_x_university`:

current_id: идентификатор текущей заявки ученика в университет (SERIAL)
last_id: прошлый идентификатор заявки ученика в университет, для поддержки версионности (SERIAL)
student_id: идентификатор ученика, внешний ключ, связанный с таблицей "student" (SERIAL)  
university_id: идентификатор ВУЗа, внешний ключ, связанный с таблицей "university" (SERIAL)
faculty_name: название факультета (VARCHAR)
rating: текущее положение студента на данный факультет (INT)
priority: номер приоритета факультета для студента (VARCHAR)
data: дата подачи заявки (TIMESTAMP)
is_budget: флаг подачи заявки на бюджет (BOOL)
PRIMARY KEY: сurrent_id

Таблица-связка `university_x_olympiad`:

university_id: идентификатор университета, внешний ключ, связанный с таблицей "university" (SERIAL)  
olympiad_id: идентификатор олимпиады, внешний ключ, связанный с таблицей "olympiad" (SERIAL)  
benefit_id: идентификатор льготы, которую дает олимпиада в конкретном ВУЗе (INT)  
benefit_name: описание льготы (VARCHAR)  
PRIMARY KEY: составной ключ из university_id и olympiad_id 

Таблица-связка 'company_x_university'
university_id: идентификатор университета, внешний ключ, связанный с таблицей "university" (SERIAL)
company_id: идентификатор компании, внешний ключ, связанный с таблицей "company" (SERIAL)  
faculty_name: название факультета (VARCHAR)
place_number: число предоставленных целевых мест (INT)
PRIMARY KEY: составной ключ из university_id, company_id и faculty_name

Таблица-связка 'company_x_university_student'
university_id: идентификатор университета, внешний ключ, связанный с таблицей "company_x_university" (SERIAL)
company_id: идентификатор компании, внешний ключ, связанный с таблицей "company_x_university" (SERIAL)  
faculty_name: название факультета, внешний ключ, связанный с таблицей "company_x_university" (SERIAL) (VARCHAR)
student_id: идентификатор ученика, внешний ключ, связанный с таблицей "student" (SERIAL)
PRIMARY KEY: составной ключ из university_id, company_id, faculty_name и student_id

---
