
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ПрочитатьВходящиеПараметры(Параметры);
	ЗаполнитьПоУмолчанию();
	ЗаполнитьДеревоФормКонфигурации(); //ЗаполнитьСписокОбъектовКонфигурации();
	ПерейтиВРежимСоответствуюшийИсточникуФорм();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Если Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзПредприятия Тогда
		ЗаполнитьСписокОткрытыхФорм();
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_ОткрытыеФормы

&НаКлиенте
Процедура ОткрытыеФормыВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ВернутьВыбраннуюФорму();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_ФормыКонфгурации

&НаКлиенте
Процедура ФормыКонфигурацииВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ВернутьВыбраннуюФорму();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Применить(Команда)

	ВернутьВыбраннуюФорму();	

КонецПроцедуры

&НаКлиенте
Процедура Отменить(Команда)
	
	Закрыть(Неопределено);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Загрузить входящие параметры.
// 
// Параметры:
//  Параметры - ДанныеФормыСтруктура - ожидаемые параметры:
//    * ИсточникФорм - Строка - см. ИсточникиФорм
&НаСервере
Процедура ПрочитатьВходящиеПараметры(Параметры);
	
	Параметры.Свойство("ИсточникФорм", ИсточникФорм);
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьПоУмолчанию()
	
	Если Не ЗначениеЗаполнено(ИсточникФорм) Тогда
		ИсточникФорм = ИсточникиФорм().ИзПредприятия;
	КонецЕсли;

КонецПроцедуры

// Источники форм.
// 
// Возвращаемое значение:
//  - ФиксированнаяСтруктура - источники форм для сканирования, со значениями
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

&НаКлиенте
Процедура ВернутьВыбраннуюФорму()
	
	Результат = Неопределено;
	
	Если ИсточникФорм = ИсточникиФорм().ИзПредприятия Тогда
		ДанныеСтроки = Элементы.ОткрытыеФормы.ТекущиеДанные;
		Результат = ФормаИзОткрытогоОкна(ДанныеСтроки.ИдентификаторФормы);
	Иначе
		ДанныеСтрокиФорма = Элементы.ФормыКонфигурации.ТекущиеДанные;
		Если ДанныеСтрокиФорма.ЭтоФорма Тогда
			ДанныеСтрокиТипОбъекта = ДанныеСтрокиФорма.ПолучитьРодителя();
			ДанныеСтрокиОбъекта = ДанныеСтрокиТипОбъекта.ПолучитьРодителя();
	
			Результат = ФормаИзКонфигуратора(ДанныеСтрокиОбъекта.Путь, ДанныеСтрокиТипОбъекта.Путь, ДанныеСтрокиФорма.Путь);
		Иначе
			Элементы.ФормыКонфигурации.Развернут(ДанныеСтрокиФорма);
			Возврат;
		КонецЕсли;
	КонецЕсли;
	
	Закрыть(Результат);
	
КонецПроцедуры

&НаСервере
Процедура ПерейтиВРежимСоответствуюшийИсточникуФорм()

	Если ИсточникФорм = ИсточникиФорм().ИзПредприятия Тогда
		Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзПредприятия;
	Иначе	
		Элементы.ИсточникиФорм.ТекущаяСтраница = Элементы.ФормыИзКонфигуратора;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСписокОткрытыхФорм()

	ОткрытыеОкна = ПолучитьОкна();
	Для Каждого ОткрытоеОкно Из ОткрытыеОкна Цикл
		НоваяСтрока = ОткрытыеФормы.Добавить();
		НоваяСтрока.Заголовок = ОткрытоеОкно.Заголовок;
		Если ОткрытоеОкно.Содержимое.Количество() Тогда
			НоваяСтрока.ИдентификаторФормы = ОткрытоеОкно.Содержимое[0].УникальныйИдентификатор;
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ЗаполнитьДеревоФормКонфигурации()
	
	ФормыКонфигурацииНаСервере = РеквизитФормыВЗначение("ФормыКонфигурации");
	
	Ключи = "Имя,Путь,Представление";
	
	ОписанияОбъектов = Новый Массив();
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"Справочники", "Справочник", "Справочники"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"Документы", "Документ", "Документы"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"Отчеты", "Отчет", "Отчеты"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"Обработки", "Обработка", "Обработки"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"ПланыВидовХарактеристик", "ПланВидовХарактеристик", "Планы видов характеристик"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"ПланыСчетов", "ПланСчетов", "Планы счетов"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"ПланыВидовРасчета", "ПланВидовРасчета", "Планы видов расчета"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"РегистрыСведений", "РегистрСведений", "Регистры сведений"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"РегистрыНакопления", "РегистрНакопления", "Регистры накопления"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"РегистрыБухгалтерии", "РегистрБухгалтерии", "Регистры бухгалтерии"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"РегистрыРасчета", "РегистрРасчета", "Регистры расчета"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"БизнесПроцессы", "БизнесПроцесс", "Бизнес-процессы"));
	ОписанияОбъектов.Добавить(Новый Структура(Ключи,
		"Задачи", "Задача", "Задачи"));
	
	Для Каждого ОписаниеОбъекта Из ОписанияОбъектов Цикл
		СтрокаОбъект = ФормыКонфигурацииНаСервере.Строки.Добавить();
		ЗаполнитьЗначенияСвойств(СтрокаОбъект, ОписаниеОбъекта);
		
		МетаданныеОбъектов = Метаданные[СтрокаОбъект.Имя];
		Для Каждого МетаданныеОбъекта Из МетаданныеОбъектов Цикл
			СтрокаТипОбъект = СтрокаОбъект.Строки.Добавить();
			СтрокаТипОбъект.Имя = МетаданныеОбъекта.Имя;
			СтрокаТипОбъект.Путь = МетаданныеОбъекта.Имя;
			СтрокаТипОбъект.Представление = МетаданныеОбъекта.Синоним;
			
			МетеданныеФормОбъекта = МетаданныеОбъектов[СтрокаТипОбъект.Имя].Формы;
			Для Каждого МетеданныеФормыОбъекта Из МетеданныеФормОбъекта Цикл
				СтрокаФормы = СтрокаТипОбъект.Строки.Добавить();
				СтрокаФормы.Имя = МетеданныеФормыОбъекта.Имя;
				СтрокаФормы.Путь = МетеданныеФормыОбъекта.Имя;
				СтрокаФормы.Представление = МетеданныеФормыОбъекта.Синоним;
				СтрокаФормы.ЭтоФорма = Истина;
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;
	
	ЗначениеВРеквизитФормы(ФормыКонфигурацииНаСервере, "ФормыКонфигурации");
	
КонецПроцедуры

&НаКлиенте
Функция ФормаИзОткрытогоОкна(ИдентификаторФормы)
	
	Результат = Неопределено;
	
	ОткрытыеОкна = ПолучитьОкна();
	Для Каждого ОткрытоеОкно Из ОткрытыеОкна Цикл
		Если ОткрытоеОкно.Содержимое.Количество() 
			И ИдентификаторФормы = Строка(ОткрытоеОкно.Содержимое[0].УникальныйИдентификатор) Тогда
			
			Результат = ОткрытоеОкно.Содержимое[0];
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

&НаКлиенте
Функция ФормаИзКонфигуратора(ИмяОбъекта, ИмяТипаОбъекта, ИмяФормы)
	
	Результат = Неопределено;
	
	ПолноеИмяФормы = СтрШаблон("%1.%2.Форма.%3", ИмяОбъекта, ИмяТипаОбъекта, ИмяФормы);
	Результат = ПолучитьФорму(ПолноеИмяФормы);
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти
