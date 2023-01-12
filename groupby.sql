--1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`enrolment_date`) as `iscritti`, YEAR(`enrolment_date`) as `anno`
FROM `students` 
GROUP BY YEAR(`enrolment_date`);



--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio


SELECT COUNT(`id`) as `insegnati`, `office_address` as `ufficio`
FROM `teachers` 
GROUP BY `office_address`;
--conto gli id , faccio la tabella degli uffici, gruppo per uffici quanti insegnati ci sono



--3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, AVG(`vote`) as `voto`
FROM `exam_student`
GROUP BY `exam_id`;


--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`) as `corso`, 
   `department_id` as `dipartimento`
FROM `degrees` 
GROUP BY `department_id`;