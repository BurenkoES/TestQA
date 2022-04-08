﻿#language: ru

@tree

Функционал: Проверка расчета итоговой суммы документа Заказ

Как Менеджер по закупкам я хочу
проверить расчет итоговой суммы документа Заказ 
при изменении в строке товаров количества и цены 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий
И я закрываю все окна клиентского приложения

Сценарий: Проверка расчета итоговой суммы документа Заказ

* Создание документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю по строке 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю по строке 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю по строке 'Рубли'

* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Торт'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Торт ' | '100,00' | '1'          | '100,00' |	
	
* Проверка суммы при изменении количество
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'	
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | '100,00' | '10'         | '1 000,00' |	

* Проверка суммы при изменении цены	
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '500,00'	
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество'  | 'Сумма'   |
		| 'Торт ' | '500,00' | '10'          | '5 000,00' |

* Проверка суммы при изменении и количества и цены	
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300'	
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество'  | 'Сумма'   |
		| 'Торт ' | '300,00' | '5'          | '1 500,00' |

* Сохранение номера
	И я нажимаю на кнопку 'Записать'
	И я запоминаю значение поля "Номер" как "$Номер$"

* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд

* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'|


