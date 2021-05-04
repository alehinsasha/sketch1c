
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЗаполнитьВходящиеПараметры(Параметры);
	ЗаполнитьДеревоФормКонфигурации();
	ПерейтиВРежимВыбораФормыСоответствуюшийИсточнику();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ЗаполнитьСписокОткрытыхФорм();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Применить(Команда)
	
	ДанныеСтроки = Элементы.ОткрытыеФормы.ТекущиеДанные;
	
	ИскомаяФорма = Неопределено;
	
	ОткрытыеОкна = ПолучитьОкна();
	Для Каждого ОткрытоеОкно Из ОткрытыеОкна Цикл
		Если ОткрытоеОкно.Содержимое.Количество() 
			И ДанныеСтроки.ИдентификаторФормы = Строка(ОткрытоеОкно.Содержимое[0].УникальныйИдентификатор) Тогда
			
			ИскомаяФорма = ОткрытоеОкно.Содержимое[0];
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Закрыть(ИскомаяФорма);

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Загрузить входящие параметры.
// 
// Параметры:
//  Параметры - ДанныеФормыСтруктура - ожидаемые параметры:
//    * ИсточникФорм - см. ИсточникиФорм (значение по умолчанию - ИзПредприятия)
&НаСервере
Процедура ЗаполнитьВходящиеПараметры(Параметры);
	
	Параметры.Свойство("ИсточникФорм", ИсточникФорм);
	Если Не ЗначениеЗаполнено(ИсточникФорм) Тогда
		ИсточникФорм = ИсточникиФорм().ИзКонфигуратора;
	КонецЕсли;
	
КонецПроцедуры

// Источники форм.
// 
// Возвращаемое значение:
//  - Фиксированная структура - источники форм для сканирования, со значениями
//    * ИзПредприятия - формы, открытые в режиме предприятия
//    * ИзКонфигуратора - формы конфигурации
&НаКлиентеНаСервереБезКонтекста
Функция ИсточникиФорм()
	
	ИсходнаяСтруктура = Новый Структура();
	ИсходнаяСтруктура.Вставить("ИзПредприятия", "ИзПредприятия");
	ИсходнаяСтруктура.Вставить("ИзКонфигуратора", "ИзКонфигуратора");
	
	Результат = Новый ФиксированнаяСтруктура(ИсходнаяСтруктура);
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Процедура ПерейтиВРежимВыбораФормыСоответствуюшийИсточнику()

	Если ИсточникФорм = ИсточникиФорм().ИзПредприятия Тогда
		Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзПредприятия;
	Иначе	
		Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзКонфигуратора;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСписокОткрытыхФорм()
	
	Если Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзПредприятия Тогда
		ОткрытыеОкна = ПолучитьОкна();
		Для Каждого ОткрытоеОкно Из ОткрытыеОкна Цикл
			НоваяСтрока = ОткрытыеФормы.Добавить();
			НоваяСтрока.Заголовок = ОткрытоеОкно.Заголовок;
			Если ОткрытоеОкно.Содержимое.Количество() Тогда
				НоваяСтрока.ИдентификаторФормы = ОткрытоеОкно.Содержимое[0].УникальныйИдентификатор;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьДеревоФормКонфигурации()
	
	ФормыКонфигурацииНаСервере = РеквизитФормыВЗначение("ФормыКонфигурации");
	ФормыКонфигурацииНаСервере.Строки.Очистить();
	
	ОписанияОбъектов = Новый Массив();
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "Справочники", "Справочники"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "Документы", "Документы"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "ЖурналыДокументов", "Журналы документов"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "Отчеты", "Отчеты"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "Обработки", "Обработки"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "ПланыВидовХарактеристик", "Планы видов характеристик"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "ПланыСчетов", "Планы счетов"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "ПланыВидовРасчета", "Планы видов расчета"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "РегистрыСведений", "Регистры сведений"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "РегистрыНакопления", "Регистры накопления"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "РегистрыБухгалтерии", "Регистры бухгалтерии"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "РегистрыРасчета", "Регистры расчета"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "БизнесПроцессы", "Бизнес-процессы"));
	ОписанияОбъектов.Добавить(Новый Структура("Имя,Синоним", "Задачи", ""));
	
	Для Каждого МетаданныеФормы Из Метаданные.ОбщиеФормы Цикл
		ОписаниеФормыКонфигурации = НовоеОписаниеФормыКонфигурации();
		ОписаниеФормыКонфигурации.Дерево = ФормыКонфигурацииНаСервере;
		ОписаниеФормыКонфигурации.ИмяОбъекта = "ОбщиеФормы";
		ОписаниеФормыКонфигурации.ПредставлениеОбъекта = "Общие формы";
		ОписаниеФормыКонфигурации.ИмяФормы = МетаданныеФормы.Имя;
		ОписаниеФормыКонфигурации.ПредставлениеФормы = МетаданныеФормы.Синоним;
		ОписаниеФормыКонфигурации.ЭтоОписаниеОбщейФормы = Истина;
		
		ДобавитьОписаниеФормыКонфигурации(ОписаниеФормыКонфигурации);
	КонецЦикла;
	
	Для Каждого ОписаниеОбъекта Из ОписанияОбъектов Цикл
		МетаданныеОбъекта = Метаданные[ОписаниеОбъекта.Имя];
		Для Каждого МетаданныеВидаОбъекта Из МетаданныеОбъекта Цикл
			Для Каждого МетаданныеФормы Из МетаданныеВидаОбъекта.Формы Цикл
				ОписаниеФормыКонфигурации = НовоеОписаниеФормыКонфигурации();
				ОписаниеФормыКонфигурации.Дерево = ФормыКонфигурацииНаСервере;
				ОписаниеФормыКонфигурации.ИмяОбъекта = ОписаниеОбъекта.Имя;
				ОписаниеФормыКонфигурации.ПредставлениеОбъекта = ОписаниеОбъекта.Синоним;
				ОписаниеФормыКонфигурации.ИмяВидаОбъекта = МетаданныеВидаОбъекта.Имя;
				ОписаниеФормыКонфигурации.ПредставлениеВидаОбъекта = МетаданныеВидаОбъекта.Синоним;
				ОписаниеФормыКонфигурации.ИмяФормы = МетаданныеФормы.Имя;
				ОписаниеФормыКонфигурации.ПредставлениеФормы = МетаданныеФормы.Синоним;
				
				ДобавитьОписаниеФормыКонфигурации(ОписаниеФормыКонфигурации);
			КонецЦикла;
		КонецЦикла;
		
	КонецЦикла;
	
	ЗначениеВРеквизитФормы(ФормыКонфигурацииНаСервере, "ФормыКонфигурации");
	
КонецПроцедуры

// Новое описание формы конфигурации.
// 
// Возвращаемое значение:
//  Структура - Новое описание формы конфигурации:
// * Дерево - Неопределено -
// * ИмяОбъекта - Строка -
// * ПредставлениеОбъекта - Строка -
// * ИмяВидаОбъекта - Строка -
// * ПредставлениеВидаОбъекта - Строка -
// * ИмяФормы - Строка -
// * ПредставлениеФормы - Строка -
// * ЭтоОписаниеОбщейФормы - Булево -
&НаСервере
Функция НовоеОписаниеФормыКонфигурации()
	
	Результат = Новый Структура();
	Результат.Вставить("Дерево", Неопределено);
	Результат.Вставить("ИмяОбъекта", "");
	Результат.Вставить("ПредставлениеОбъекта", "");
	Результат.Вставить("ИмяВидаОбъекта", "");
	Результат.Вставить("ПредставлениеВидаОбъекта", "");
	Результат.Вставить("ИмяФормы", "");
	Результат.Вставить("ПредставлениеФормы", "");
	Результат.Вставить("ЭтоОписаниеОбщейФормы", Ложь);
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Процедура ДобавитьОписаниеФормыКонфигурации(ОписаниеФормыКонфигурации)
	
	Дерево = ОписаниеФормыКонфигурации.Дерево;
	
	СтрокаОбъекта = Дерево.Строки.Найти(ОписаниеФормыКонфигурации.ИмяОбъекта, "ИмяОбъекта");
	Если СтрокаОбъекта = Неопределено Тогда
		СтрокаОбъекта = Дерево.Строки.Добавить();
		СтрокаОбъекта.ИмяОбъекта = ОписаниеФормыКонфигурации.ИмяОбъекта;
		СтрокаОбъекта.Представление = ОписаниеФормыКонфигурации.ПредставлениеОбъекта;
	КонецЕсли;
	
	Если ОписаниеФормыКонфигурации.ЭтоОписаниеОбщейФормы Тогда
		СтрокаВидаОбъекта = СтрокаОбъекта;
	Иначе
		СтрокаВидаОбъекта = СтрокаОбъекта.Строки.Найти(ОписаниеФормыКонфигурации.ИмяВидаОбъекта, "ИмяВидаОбъекта");
		Если СтрокаВидаОбъекта = Неопределено Тогда
			СтрокаВидаОбъекта = СтрокаОбъекта.Строки.Добавить();
			СтрокаВидаОбъекта.ИмяОбъекта = ОписаниеФормыКонфигурации.ИмяОбъекта;
			СтрокаВидаОбъекта.ИмяВидаОбъекта = ОписаниеФормыКонфигурации.ИмяВидаОбъекта;
			СтрокаВидаОбъекта.Представление = ОписаниеФормыКонфигурации.ПредставлениеВидаОбъекта;
		КонецЕсли;
	КонецЕсли;
	
	СтрокаФормы = СтрокаВидаОбъекта.Строки.Найти(ОписаниеФормыКонфигурации.ИмяФормы, "ИмяФормы");
	Если СтрокаФормы = Неопределено Тогда
		СтрокаФормы = СтрокаВидаОбъекта.Строки.Добавить();
		СтрокаФормы.ИмяОбъекта = ОписаниеФормыКонфигурации.ИмяОбъекта;
		СтрокаФормы.ИмяВидаОбъекта = ОписаниеФормыКонфигурации.ИмяВидаОбъекта;
		СтрокаФормы.ИмяФормы = ОписаниеФормыКонфигурации.ИмяФормы;
		СтрокаФормы.Представление = ОписаниеФормыКонфигурации.ПредставлениеФормы;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
