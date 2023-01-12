1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

 SELECT `students`.`name` as "nome",
          `students`.`surname` as "cognome",
          `degrees`.`name` as "nome_corso"
FROM `students`
INNER JOIN `degrees`
  ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";


2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze


SELECT * 
FROM `courses`
INNER JOIN degrees
  ON courses.degree_id = degrees.id
INNER JOIN departments
  ON degrees.department_id = departments.id
WHERE departments.name ="Dipartimento di Neuroscienze"
AND degrees.level = "magistrale";




SELECT DISTINCT *
FROM `courses`
INNER JOIN degrees
  ON courses.degree_id = degrees.id
INNER JOIN departments
  ON degrees.department_id = departments.id
WHERE departments.name ="Dipartimento di Neuroscienze"
AND degrees.name LIKE "%Magistrale%";


SELECT DISTINCT *
FROM `courses`
INNER JOIN degrees
  ON courses.degree_id = degrees.id
INNER JOIN departments
  ON degrees.department_id = departments.id
WHERE departments.name ="Dipartimento di Neuroscienze"
AND degrees.name LIKE "%Corso di Laurea Magistrale%"
AND degrees.level = "magistrale";


3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT * 
FROM `course_teacher`
INNER JOIN courses
  ON course_teacher.course_id = courses.id
WHERE teacher_id = 44;

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT * FROM students
INNER JOIN degrees
  ON degrees.id = students.degree_id
INNER JOIN     departments
  ON departments.id = degrees.department_id
ORDER BY students.surname,
         students.name;


5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


SELECT * 
FROM `degrees`
INNER JOIN courses
  ON courses.degree_id = degrees.id
INNER JOIN course_teacher
  ON course_teacher.course_id = courses.id
INNER JOIN teachers
  ON teachers.id = course_teacher.teacher_id


6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


SELECT teachers.name, teachers.id, departments.name
FROM `teachers`
INNER JOIN course_teacher
  ON course_teacher.teacher_id = teachers.id
INNER JOIN courses
  ON courses.id = course_teacher.course_id
INNER JOIN degrees
  ON degrees.id = courses.degree_id
INNER JOIN departments
  ON departments.id = degrees.department_id
WHERE departments.name = "Dipartimento di Matematica"
GROUP BY teachers.id;


7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami




