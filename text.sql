1. SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

2. SELECT * 
FROM `courses`
WHERE `cfu` > 10;

3. SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) < 1992;

4. SELECT * 
FROM `courses`
WHERE `period` = "I semestre" 
AND `year` = 1;

5. SELECT * 
FROM `exams`
WHERE `date` = "2020-06-20"
AND `hour` > "14%";

6. SELECT * 
FROM `degrees`
WHERE `level` = "magistrale";

7.  SELECT * FROM `departments`

8. SELECT * 
FROM `teachers`
WHERE `phone`
IS NOT null;

3.  SELECT * 
FROM `students`
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(`date_of_birth`) > 30;

3.  SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, NOW()) > 30;


.SELECT `exam_id`, AVG(`vote`) as `voto`
FROM `exam_student`
GROUP BY `exam_id`;
per ogni esame vediamo la media


SELECT `students`.`name` as `first_name`,
	   `students`.`surname` as `last_name`,
       `degrees`.`name` as `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`;



SELECT * 
FROM `social_links`
RIGHT JOIN `movies`
ON `social_links`.`movie_id` = `movies`.`id`;


per ogni corso di laurea
SELECT * 
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";


SELECT * 
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";



 Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT * 
FROM `courses`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id` = 144;



 Selezionare le informazioni 
 Selezionare a quale dipartimento appartiene il Corso di Laurea  Diritto
 dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)
SELECT `degrees`.*, `departments`.`name` AS `Dipartimento`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia",



 Selezionare tutti gli appelli d'esame del Corso di
Laurea Magistrale in Fisica del primo anno
SELECT * 
FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea Magistrale in Fisica"
AND `courses`.`year` = 1



# Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno
SELECT `degrees`.`name` as `Corso di laurea`,
		`courses`.`name` as `Corso`,
        `courses`.`year` as `Anno`,
        `exams`.*
FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `exams`
ON `exams`.`course_id` = `courses`.`id`
WHERE `degrees`.`name` = "Corso di Laurea Magistrale in Fisica"
AND `courses`.`year` = 1
#AND `courses`.`period` = "I semestre";



# Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere
SELECT `degrees`.`name` AS `corso_laurea`,
		`courses`.`name` AS `insegnamento`,
        `teachers`.`name` AS `nome_insegnante`,
        `teachers`.`surname` AS `cognome_insegnante`
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `cognome_insegnante`;




# Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati
# del corso di laurea associato, ordinati per media voto decrescente
SELECT `courses`.`id`, `courses`.`name`,
		AVG(`exam_student`.`vote`) as `avg_vote`
FROM `exam_student`
INNER JOIN `exams`
	ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
	ON `exams`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY `avg_vote` DESC;
