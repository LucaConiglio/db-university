1. SELECT `students`.`name` as "nome",
          `students`.`surname` as "cognome",
          `degrees`.`name` as "nome_corso"
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

2. 