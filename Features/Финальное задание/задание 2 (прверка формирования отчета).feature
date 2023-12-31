﻿#language: ru

@tree

Функционал: проверка формирования отчета Остатки товаров

Как Менеджер по продажам я хочу
корректно видеть остатки по товарам
чтобы корректно формировать документы отгрузки  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка отчета Остатки товаров
	И  первоначальные данные
*перепроведение документов для создания движения
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
*Проверка формирования отчета Остатки товаров
	И В командном интерфейсе я выбираю 'Товарные запасы' 'Остатки товаров'
	И в табличном документе 'Результат' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И я нажимаю на кнопку с именем 'Загрузить'
	Когда открылось окно 'Остатки товаров'
	И я снимаю флаг с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент6Использование'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка 'R28C2' в течение 20 секунд

