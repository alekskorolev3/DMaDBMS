-- SELECT pr_title, pr_begin, pr_end,
-- 	(SELECT c_company FROM Clients
-- 	WHERE Clients.c_id = Projects.pr_client) as Client
-- FROM Projects;

-- SELECT e_lname, e_fname, e_patronymic
-- FROM Employees
-- 	WHERE e_birthdate < "1982-12-14" 
-- 	AND e_gender = "м" 
--     AND e_depart IN
-- (SELECT d_id FROM Departs WHERE e_depart = "6");

-- SELECT e.e_fname, e.e_lname, p.p_post FROM Employees e INNER JOIN Posts p WHERE e_post = p_id;

-- SELECT d.d_id, d.d_name, r.r_name FROM Departs d CROSS JOIN Rooms r WHERE d.d_id = r.r_depart;

-- SELECT e.e_lname, e.e_fname, a.a_address FROM Employees e LEFT JOIN AdrTel a ON e.e_id = a.e_id;

-- SELECT d.d_id, d.d_name, r.r_name FROM Departs d RIGHT JOIN Rooms r ON d.d_id = r.r_depart;

-- SELECT * FROM Departs FULL JOIN Rooms;

-- SELECT d.d_name, COUNT(*) as Empl FROM Employees e JOIN Departs d 
-- WHERE e.e_depart = d.d_id 
-- GROUP BY d.d_name
-- ORDER BY Empl DESC;

-- SELECT d.d_name, COUNT(*) as Empl FROM Employees e JOIN Departs d 
-- WHERE e.e_depart = d.d_id 
-- GROUP BY d.d_name
-- HAVING Empl > 2
-- ORDER BY Empl DESC;

-- SELECT e.e_fname, e.e_lname, d.d_name, p.p_salary, p.p_salary * 0.1 as Bonus FROM Employees e JOIN Departs d JOIN Posts p
-- ON p.p_salary >= 2000 AND e.e_depart = d.d_id AND e.e_post = p.p_id
-- UNION SELECT e.e_fname, e.e_lname, d.d_name, p.p_salary,  p.p_salary * 0.3 as Bonus FROM Employees e JOIN Departs d JOIN Posts p
-- ON p.p_salary < 2000 AND e.e_depart = d.d_id AND e.e_post = p.p_id
-- ORDER BY Bonus ASC;

-- SELECT * FROM Departs d WHERE NOT EXISTS (SELECT * FROM Rooms r WHERE r_depart = d_id);

-- INSERT INTO Clients(c_person, c_adr)
-- SELECT CONCAT(e.e_fname, " ", e.e_lname," ", e.e_patronymic), a.a_address FROM Employees e JOIN AdrTel a
-- WHERE e.e_id = "2" AND a.e_id = e.e_id;

-- SELECT e.e_fname, e.e_lname, e.e_birthdate,
-- CASE
-- 	WHEN e.e_birthdate < "1982-12-14"
-- 		THEN "Скоро на пенсию"
-- 	ELSE "До пенсии еще далеко"
-- END AS Pensiya
-- FROM Employees e
-- ORDER BY Pensiya DESC;

-- DROP TRIGGER UpdateProjects;
-- delimiter |
-- CREATE TRIGGER UpdateProjects AFTER INSERT ON Projects
-- FOR EACH ROW 
-- BEGIN
-- 	INSERT INTO Log SET msg= "insert", row_id = NEW.pr_id, _table = "Projects";
-- END;
-- |
-- delimiter ;

-- DROP TRIGGER ChangeSalary;
-- delimiter |
-- CREATE TRIGGER ChangeSalary BEFORE UPDATE ON Posts
-- FOR EACH ROW 
-- BEGIN
-- 	IF NEW.p_salary < (SELECT p_salary FROM Posts WHERE NEW.p_id = p_id)
-- 		THEN INSERT INTO Log SET msg= "Зарплата уменьшена", row_id = NEW.p_id, _table = "Posts";
-- 	ELSEIF NEW.p_salary > (SELECT p_salary FROM Posts WHERE NEW.p_id = p_id)
-- 		THEN INSERT INTO Log SET msg= "Зарплата увеличена", row_id = NEW.p_id, _table = "Posts";
-- 	END IF;
-- END;
-- |
-- delimiter ;

-- delimiter |
-- CREATE PROCEDURE getCurrentProjects()
-- BEGIN
-- 	SELECT * FROM Projects WHERE CURDATE() < Projects.pr_end AND CURDATE() > Projects.pr_begin;
-- END;

CALL getCurrentProjects();



