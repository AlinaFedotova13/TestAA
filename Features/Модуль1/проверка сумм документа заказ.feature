﻿#language: ru

@tree

Функционал: проверка документа Заказ

Как Менеджер по продажам я хочу
проверить расчет суммы в документе Заказ 
чтобы отправлять корректный документ    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка документа Заказ на сумму документа при изменении 
*Открытие формы создания документа
	И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		Тогда открылось окно 'Заказы товаров'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Заказ (создание)'
*Заполнение шапки документа
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		Тогда открылось окно 'Контрагенты'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование'              |
			| '000000014' | 'Магазин "Бытовая техника"' |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Заказ (создание) *'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Средний'
		Когда открылось окно 'Заказ (создание) *'
*Заполнение табличной части
		Когда открылось окно 'Заказ (создание) *'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И в таблице "Список" я разворачиваю строку:
			| 'Код'       | 'Наименование'  |
			| '000000012' | 'Электротовары' |
		И в таблице "Список" я разворачиваю строку:
			| 'Код'       | 'Наименование' |
			| '000000013' | 'Чайники'      |
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000018' | 'Bosch15'      |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Когда открылось окно 'Заказ (создание) *'
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '5 000,00'
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" я выбираю текущую строку
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
		И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения товарной части
	Тогда таблица "Товары" стала равной:
		| 'Сумма'     |
		| '10 000,00' |
* Проведение документа Заказы
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
		
		
		
