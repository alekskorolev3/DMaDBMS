CREATE TABLE Departs (
  d_id INT NOT NULL AUTO_INCREMENT,
  d_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (d_id));
  

CREATE TABLE Rooms (
  r_name VARCHAR(5) NOT NULL,
  r_id INT NOT NULL AUTO_INCREMENT,
  r_depart INT NOT NULL,
  PRIMARY KEY (r_id),
  INDEX Rooms_Departs_idx (r_id ASC) VISIBLE,
  FOREIGN KEY (r_depart) REFERENCES Departs (d_id));
  

CREATE TABLE Posts (
  p_id INT NOT NULL AUTO_INCREMENT,
  p_post VARCHAR(255) NOT NULL,
  p_salary INT NOT NULL,
  PRIMARY KEY (p_id));
  
  
CREATE TABLE Employees (
  e_id INT NOT NULL AUTO_INCREMENT,
  e_lname VARCHAR(30) NOT NULL,
  e_fname VARCHAR(25) NOT NULL,
  e_patronymic VARCHAR(30) NULL DEFAULT NULL,
  e_pasp VARCHAR(255) NOT NULL,
  e_birthdate DATE NOT NULL,
  e_gender CHAR(1) NULL DEFAULT NULL,
  e_phone VARCHAR(255) NOT NULL,
  e_depart INT NOT NULL,
  e_post INT NOT NULL,
  PRIMARY KEY (e_id, e_depart, e_post),
  UNIQUE INDEX e_pasp (e_pasp ASC) VISIBLE,
  INDEX Employees_Departs_idx (e_depart ASC) VISIBLE,
  INDEX Employees_Posts_idx (e_post ASC) VISIBLE,
  FOREIGN KEY (e_depart) REFERENCES Departs(d_id),
  FOREIGN KEY (e_post) REFERENCES Posts(p_id));
  

CREATE TABLE Education (
  u_id INT NOT NULL AUTO_INCREMENT,
  u_type VARCHAR(50) NOT NULL,
  u_spec VARCHAR(40) NULL DEFAULT NULL,
  u_year INT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (u_id),
  INDEX Education_Employees_idx (e_id ASC) VISIBLE,
  FOREIGN KEY (e_id) REFERENCES Employees(e_id));
  

  CREATE TABLE AdrTel (
  a_id INT NOT NULL AUTO_INCREMENT,
  a_address VARCHAR(100) NULL DEFAULT NULL,
  a_phone VARCHAR(50) NULL DEFAULT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (a_id),
  INDEX AdrTel_Employees_idx (e_id ASC) VISIBLE,
  FOREIGN KEY (e_id) REFERENCES Employees(e_id));
  
CREATE TABLE Clients (
  c_id INT NOT NULL AUTO_INCREMENT,
  c_company VARCHAR(255) NULL DEFAULT NULL,
  c_adr VARCHAR(50) NOT NULL,
  c_person VARCHAR(50) NOT NULL,
  c_phone VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (c_id));


CREATE TABLE Projects (
  pr_id INT NOT NULL AUTO_INCREMENT,
  pr_title VARCHAR(100) NULL DEFAULT NULL,
  pr_abbr CHAR(10) NOT NULL,
  pr_begin DATE NOT NULL,
  pr_end DATE NOT NULL,
  pr_cost INT NOT NULL,
  pr_client INT NOT NULL,
  pr_depart INT NOT NULL,
  pr_chief INT NOT NULL,
  PRIMARY KEY (pr_id, pr_client, pr_depart, pr_chief),
  INDEX Projects_Clients_idx (pr_client ASC) VISIBLE,
  INDEX Projects_Departs_idx (pr_depart ASC) VISIBLE,
  INDEX Projects_Employees_idx (pr_chief ASC) VISIBLE,
  FOREIGN KEY (pr_client)REFERENCES Clients(c_id),
  FOREIGN KEY (pr_depart) REFERENCES Departs(d_id),
  FOREIGN KEY (pr_chief) REFERENCES Employees(e_id));
  

CREATE TABLE Stages (
  s_id INT NOT NULL AUTO_INCREMENT,
  s_num INT NOT NULL,
  s_title VARCHAR(200) NOT NULL,
  s_begin DATE NOT NULL,
  s_end DATE NOT NULL,
  s_cost INT NOT NULL,
  s_compl TINYINT(1) NULL DEFAULT NULL,
  s_pr INT NOT NULL,
  PRIMARY KEY (s_pr),
  FOREIGN KEY (s_pr) REFERENCES Projects(pr_id));


CREATE TABLE Job (
  j_role VARCHAR(20) NOT NULL,
  j_bonus INT NOT NULL,
  j_emp INT NOT NULL,
  j_pr INT NOT NULL,
  PRIMARY KEY (j_emp, j_pr),
  INDEX Job_Projects_idx (j_pr ASC) VISIBLE,
  FOREIGN KEY (j_emp) REFERENCES Employees(e_id),
  FOREIGN KEY (j_pr) REFERENCES Projects(pr_id));




