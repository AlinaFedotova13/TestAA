﻿#language: ru

@tree
Функционал: проверка заполнение шапки документа Заказ покупателя

Как Менеджер по продажам я хочу
правильно составлять документ Заказ покупателя 
чтобы отправлять корректные данные клиенту   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:  проверка заполнения Контрагента, без выбора партнера
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы с именем "LegalName" доступен 

Сценарий: Проверка доступности пункта Контрагенты с выбором Партнера
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
*Заполнение Партнера и Соглашение
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Табличная часть товаров будет обновлена'
	И я нажимаю на кнопку с именем 'FormCancel'
*Проверка авто заполнения Партнера и Соглашения после выбора другого Партнера
	И элемент формы с именем "Partner" стал равен "Клиент 1 (1 соглашение)"
	И элемент формы с именем "LegalName" стал равен "Клиент 1"
	И элемент формы с именем "Agreement" стал равен "Соглашение с клиентами (расчет по документам + кредитный лимит)"
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
	И элемент формы с именем "LegalName" стал равен 'Клиент 2'
	И элемент формы с именем "Agreement" стал равен ''
		

	
		
	
		
	
		
	
			
				

	
