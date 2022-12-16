Авторизация, CRUD-операции, логгирование действий, система ролей

Функциональные требования:

CRUD-операции с образованием и должностями, назначение сотрудника на проект, добавление руководителя проекта, добавление сотрудников на проект, CRUD-операции с этапами, изменение названия проекта, добавление проектов, журналирование действий
Руководитель отдела выполняет операции ТОЛЬКО со своим подконтрольным отделом

Сущности предметной области:
1. Отделы (Departs). 
Атрибуты: 
аббревиатура (D_ID, VARCHAR(10), PK), 
название (D_NAME, VARCHAR(100), Not NULL)

2. Кабинеты (Rooms). 
Атрибуты: 
отдел (R_DEPART, VARCHAR(10), FK to Departs), 
номер (R_ROOM, VARCHAR(5), Not NULL), 
телефон (R_PHONE, VARCHAR(20), Not NULL)

3. Сотрудники (Employees). 
Атрибуты: 
Идентификатор (E_ID, INT(11), Unique, Not NULL, PK), 
Фамилия (E_LNAME, VARCHAR(25), Not NULL), 
Имя (E_FNAME, VARCHAR(25), Not NULL), 
Отчество (E_PATRONYMIC, VARCHAR(25), Not NULL), 
паспортные данные (E_PASP, VARCHAR(10), Not NULL), 
дата рождения (E_BIRTHDATE, DATE, Not NULL), 
пол (E_GENDER, VARCHAR(25), Not NULL),
адрес (E_ADDRESS, VARCHAR(100), Not NULL), 
телефон (E_PHONE, VARCHAR(20), Not NULL), 
логин (E_LOGIN, VARCHAR(30), Unique, Not NULL), 
отдел (E_DEPART, VARCHAR(12), FK to Departs),
должность (E_POST, VARCHAR(30), FK to Posts)

4. Образование (Education). 
Атрибуты: 
идентификатор сотрудника (U_ID, INT(11), Unique, Not NULL, FK to Employees), 
вид образования (U_TYPE, VARCHAR(20), Not NULL), 
специальность (U_SPECIALITY, VARCHAR(40), Not NULL), 
год окончания учебного заведения (U_YEAR, VARCHAR(4), Not NULL)

5. Должности (Posts). 
Атрибуты: 
название (P_POST, VARCHAR(30), PK), 
оклад (P_SALARY, INT(8), Not NULL, >300)

6. Проекты (Projects). 
Атрибуты: 
идентификатор проекта (P_ID, INT(11), Unique, Not NULL), 
полное название проекта (P_TITLE, VARCHAR(100), Not NULL), 
сокращённое название проекта (P_ABBR, VARCHAR(10), PK),
отдел (P_DEPART, VARCHAR(12), FK to Departs), 
заказчик (P_COMPANY, INT(11), FK to Clients),
руководитель (P_CHIEF, INT(11), FK to Employees),
дата начала проекта (P_BEGIN, DATE, Not NULL), 
дата завершения проекта (P_END),
стоимость (P_COST, INT(8), >0)

7. Этапы проекта (Stages). 
Атрибуты: 
проект (S_PRJ, CHAR(10), PK, FK to Projects), 
номер этапа (S_NUM, INT(2)), 
название (S_TITLE, VARCHAR(200), Not NULL), 
дата начала этапа (S_BEGIN, DATE, Not NULL), 
дата завершения этапа (S_END, DATE, Not NULL), 
сумма по этапу (S_SUM, INT(8), DEFAULT VALUE 0), 

8. Заказчики (Clients). 
Атрибуты:
Идентификатор заказчика (C_ID, INT(11), Unique, Not NULL, PK)
Юридическое лицо(название) (C_COMPANY, VARCHAR(40), Not NULL), 
Контактное лицо (представитель фирмы) (C_PERSON, VARCHAR(50), Not NULL), 
адрес (C_ADDR, VARCHAR(50), Not NULL), 
телефон (C_PHONE, VARCHAR(30))

9. Журнал действий (Journal). 
Атрибуты: 

дата, 
время, 
дейтсвие (логин, логаут, добавление, удаление, изменение)

РОЛИДиректорСотр. отд.кадровРуководитель проектаБухгалтерУчастник проектаОтделыSSUIDSSКабинетыSSUIDSSSДолжностиSUIDSСотрудникиSSUIDSSАдреса-телефоныSSUIDSSОбразованиеSSUIDSSКлиентыSUIDSПроектыSUIDSЭтапы проектаSUIDSUIУчастиеSSS

