﻿#language: ru

@tree

Функционал: 002. Отчет Остатки товаров

Как Тестировщик я хочу
проверить работку отчета Остатки товаров
чтобы в нем учитывались данные о поступлениях и продажах товара

Контекст:
	Дано я подключаю TestClient "Администратор" логин "Администратор" пароль ""
	И я закрываю все окна клиентского приложения

Сценарий: Подготовка тестовых данных
	И Я загружаю данные справочников
	И Я загружаю поступления товаров
	И Я загружаю продажи товаров

Сценарий: Отчет Остатки товаров

	* Откроем отчет
		И В командном интерфейсе я выбираю 'Закупки' 'Остатки товаров'
		Тогда открылось окно 'Остатки товаров'

	* Настройки
		И я нажимаю на кнопку с именем 'ФормаНастройкиОтчета'
		Тогда открылось окно 'Настройки отчета "Остатки товаров"'

		* Дата остатков
			И я устанавливаю флаг 'Дата остатков'
			И в поле 'Дата остатков' я ввожу текст '{НачалоДня(ТекущаяДата())}'

		* Товар
			И я снимаю флаг 'Товар'

		* Склад
			И я устанавливаю флаг 'Склад'
			И из выпадающего списка с именем 'КомпоновщикНастроекПользовательскиеНастройкиЭлемент2Значение' я выбираю по строке 'Малый'
			И я устанавливаю флаг 'Разворот по складу'

		И я нажимаю на кнопку с именем 'ФормаЗакончитьРедактирование'

	* Сформируем отчет
		Тогда открылось окно 'Остатки товаров'
		И я нажимаю на кнопку с именем 'ФормаСформировать'
		И я жду когда в табличном документе 'Результат' заполнится ячейка 'R7C2' в течение 20 секунд

	* Провермм результат
		Тогда Табличный документ "Результат" равен макету "ОтчетОстаткиТоваровВсеТовары" по шаблону
		

