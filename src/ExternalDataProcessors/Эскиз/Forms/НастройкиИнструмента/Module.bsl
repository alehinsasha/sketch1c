
&НаКлиенте
Процедура ПрименитьНастройкиПроекта(Команда)
	ИсходнаяСтруктура = Новый Структура();
	ИсходнаяСтруктура.Вставить("РежимРедактированияСвойств", РежимРедактированияСвойств);
	ИсходнаяСтруктура.Вставить("ЗагружатьСвойстваИзФайла", ЗагружатьСвойстваИзФайла);
	ИсходнаяСтруктура.Вставить("АктивироватьТекущийЭлементВПрототипе", АктивироватьТекущийЭлементВПрототипе);
	
	Результат = Новый ФиксированнаяСтруктура(ИсходнаяСтруктура);

	Закрыть(Результат);
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	СписокСвойств = "РежимРедактированияСвойств,ЗагружатьСвойстваИзФайла";
	ЗаполнитьЗначенияСвойств(ЭтотОбъект, Параметры, СписокСвойств);

КонецПроцедуры
