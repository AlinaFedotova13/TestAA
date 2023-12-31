﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: <описание сценария>
	И первоначальные данные
*Перепроведение документов для корректных остатков по товарам
	И Пауза 20

	И я выполняю код встроенного языка на сервере
	"""bsl
		док = Документы.РасходТовара.Выбрать(); 
  Пока док.Следующий() Цикл
    ДокументОб = Док.ПолучитьОбъект();
    ДокументОб.Записать(РежимЗаписиДокумента.Проведение);  
  КонецЦикла;
	"""

	И я выполняю код встроенного языка на сервере
	"""bsl
		док = Документы.ПриходТовара.Выбрать(); 
  Пока док.Следующий() Цикл
    ДокументОб = Док.ПолучитьОбъект();
    ДокументОб.Записать(РежимЗаписиДокумента.Проведение);  
  КонецЦикла;
	"""

*Создание документа Расход товара
	И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
	Тогда открылось окно 'Документы продаж'
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно 'Продажа товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	Когда открылось окно 'Продажа товара (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'    |
		| '000000015' | 'Магазин "Обувь"' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Продажа товара (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Продажа товара (создание) *'
	Когда открылось окно 'Продажа товара (создание) *'
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 500,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаПровести'
*Проверка регистров после проведения документа
	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Контрагент'      | 'Сумма'    |
		| 'Магазин "Обувь"' | '2 500,00' |
	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Покупатель'      | 'Товар'     | 'Количество' | 'Сумма'    |
		| 'Магазин "Обувь"' | 'Босоножки' | '1,00'       | '2 500,00' |
	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Товар'     | 'Склад'   | 'Количество' |
		| 'Босоножки' | 'Большой' | '1,00'       |
*Проверка вывода печатной формы данного документа
	Когда открылось окно 'Продажа * от *'
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда табличный документ "SpreadsheetDocument" равен:
		| 'Расход товара' | ''                                         | ''           | ''      |
		| ''              | ''                                         | ''           | ''      |
		| 'Номер'         | '*'                                        | ''           | ''      |
		| 'Дата'          | '*'                                        | ''           | ''      |
		| 'Покупатель'    | 'Магазин "Обувь"'                          | ''           | ''      |
		| 'Склад'         | 'Большой'                                  | ''           | ''      |
		| 'Сумма'         | '2 500 рублей (Две тысячи пятьсот рублей)' | ''           | ''      |
		| ''              | ''                                         | ''           | ''      |
		| 'Товар'         | 'Цена'                                     | 'Количество' | 'Сумма' |
		| 'Босоножки'     | '2 500'                                    | '1'          | '2 500' |

	
		
	
			
			
	
				
	
				
		