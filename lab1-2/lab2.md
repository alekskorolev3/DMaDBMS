Уласевич Артём Алексеевич 053501
Тема: Проектная организация


1НФ:
Разделим атрибут "Фамилия, имя, отчество" на два атрибута "Фамилия",
"Имя", "Отчество"
"Данные об образовании" – на "Вид образования",
"Специальность", "Год окончания".

Комнаты и Телефоны из отношения "Departs" вынесем в отдельное отношение "Rooms",
домашние и мобильные телефоны и адреса сотрудников – в отношение "AdrTel".

2НФ:
В нашем случае составные первичные ключи имеют отношения "Stages" и "Job".
Неключевые атрибуты этих отношений функционально полно зависят от составных первичных ключей

3НФ:
В отношении Projects(ПРОЕКТЫ) атрибут "Данные заказчика" зависит от атрибута
"Заказчик", а не от первичного ключа, поэтому его следует вынести в отдельное отношение Clients(ЗАКАЗЧИКИ).
Так как с каждым заказчиком может быть связано несколько проектов, связь между отношениями ПРОЕКТЫ и
ЗАКАЗЧИКИ будет 1:n и суррогатный ПК станет внешним ключом для отношения ПРОЕКТЫ.

Создадим отношение ДОЛЖНОСТИ, перенесём в него атрибуты
Должность и Оклад