﻿
&НаКлиенте
Функция СохранитьФайл(РасположениеФайла, АдресФайлаВХранилище, Интерактивно, ОписаниеОповещения = Неопределено) Экспорт
	НачатьПолучениеФайлаССервера(, АдресФайлаВХранилище, РасположениеФайла);

КонецФункции

&НаКлиенте
Функция ЗагрузитьФайл(РасположениеФайла, Интерактивно, ВыполняемоеОповещение) Экспорт
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("ВыполняемоеОповещение", ВыполняемоеОповещение);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ЗагрузитьФайлЗавершение", ЭтотОбъект, ДополнительныеПараметры);	
	НачатьПомещениеФайлаНаСервер(ОписаниеОповещения,,,, РасположениеФайла);
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьФайлЗавершение(ОписаниеПомещенногоФайла, ДополнительныеПараметры) Экспорт
	ВыполнитьОбработкуОповещения(ДополнительныеПараметры.ВыполняемоеОповещение, ОписаниеПомещенногоФайла.Адрес);
	
КонецПроцедуры
