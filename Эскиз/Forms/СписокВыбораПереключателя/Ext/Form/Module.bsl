﻿
&НаКлиенте
Процедура ПрименитьСписокВыбора(Команда)
	Закрыть(СписокВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ОтменитьИЗакрыть(Команда)
	Закрыть();
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Для Каждого Строка Из Параметры.СписокВыбора Цикл
		СписокВыбора.Добавить(Строка.Значение);

	КонецЦикла;
КонецПроцедуры
