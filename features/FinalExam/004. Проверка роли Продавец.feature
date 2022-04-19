﻿#language: ru

@tree

Функционал: 004. Проверка роли Продавец

Как тестировщик я хочу
проверить настройку прав для роли Продавец 
на возможность создания документа Продажа, а также на видимость документа Заказ 

Сценарий: Подготовка тестовых данных

	И Я загружаю данные для проверки роли Продавец

Сценарий: Возможность создания документа Продажа

	// Попытаемся подключится. Если не получится, то попробуем еще раз
	Попытка
		И я подключаю TestClient "Продавец" логин "Продавец" пароль ""
	Исключение
		И я подключаю TestClient "Продавец" логин "Продавец" пароль ""
			
	И я закрываю все окна клиентского приложения

	* Создание нового документа
		И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
		Тогда открылось окно 'Продажи товара'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Продажа товара (создание)'

	* Заполнение шапки
		И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "1000 мелочей"'
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		Тогда открылось окно 'Контрагенты'
		И я нажимаю на кнопку с именем 'ФормаСписок'			
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'    |
			| 'Магазин "Обувь"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Продажа товара (создание) *'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'Малый'

	* Заполнение ТЧ Товары
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000020' | 'Валенки'      |
		
		И в таблице "Список" я выбираю текущую строку
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3 000,00'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
		
	* Провести и закрыть
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Продажа товара (создание) *' в течение 20 секунд

Сценарий: Видимость документа Заказ

	И я подключаю TestClient "Продавец" логин "Продавец" пароль ""
	И я закрываю все окна клиентского приложения

	* Откроем список заказов
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		Тогда открылось окно 'Заказы товаров'

	* Проверим что нельзя создать
		Когда Проверяю шаги на Исключение:
        |'И я нажимаю на кнопку с именем "ФормаСоздать"'|

	* Проверим что нельзя перепровести
		Когда Проверяю шаги на Исключение:
        |'И я выбираю пункт контекстного меню с именем "СписокКонтекстноеМенюПровести" на элементе формы с именем "Список"'|
		
	* Откроем заказ
		И в таблице "Список" я перехожу к последней строке
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно "Заказ *"

	* Проверим, что нельзя записать
		Когда Проверяю шаги на Исключение:
        |'И я нажимаю на кнопку с именем "ФормаЗаписать"'|

				
		
