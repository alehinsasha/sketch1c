
&НаКлиенте
Процедура ПрименитьДанныеВыбока(Команда)
	Закрыть(ДанныеВыбора);
	
КонецПроцедуры

&НаКлиенте
Процедура ОтменитьИЗакрыть(Команда)
	Закрыть();
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Для Каждого Строка Из Параметры.ДанныеВыбора Цикл
		ДанныеВыбора.Добавить(Строка.Значение, Строка.Представление);

	КонецЦикла;
КонецПроцедуры
