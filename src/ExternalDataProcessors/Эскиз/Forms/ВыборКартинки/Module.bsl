
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЗаполнитьКартинкиИзБиблиотеки();
	ЗаполнитьКартинкиИзКонфигурации();

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_КартинкиИзБиблиотеки

&НаКлиенте
Процедура КартинкиИзБиблиотекиВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ОбработатьВыборКартинки();

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_КартинкиИзКонфигурации

&НаКлиенте
Процедура КартинкиИзКонфигурацииВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ОбработатьВыборКартинки();

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы_КартинкиИзКаталогаПроекта

&НаКлиенте
Процедура КартинкиИзКаталогаПроектаВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	ОбработатьВыборКартинки();

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПрименитьКартинку(Команда)
	
	ОбработатьВыборКартинки();
	
КонецПроцедуры

&НаКлиенте
Процедура ОтменитьИЗакрыть(Команда)
	
	Закрыть(Неопределено);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗаполнитьКартинкиИзБиблиотеки()
	
	ИменаКартинок = ПолучитьИменаКартинокВБиблиотеке();
	Для Каждого Пара Из ИменаКартинок Цикл
		Попытка
			НоваяСтрока = КартинкиИзБиблиотеки.Добавить();
			НоваяСтрока.Картинка = БиблиотекаКартинок[Пара.Ключ]; 
			НоваяСтрока.Значение = Пара.Ключ; 
			НоваяСтрока.Представление = Пара.Значение; 
		Исключение

		КонецПопытки;
	КонецЦикла;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьИменаКартинокВБиблиотеке() 
	
	Результат = Новый Структура;
	
	Результат.Вставить("АктивироватьЗадачу", "Активировать задачу");
	Результат.Вставить("АктивныеПользователи", "Активные пользователи");
	Результат.Вставить("БизнесПроцесс", "Бизнес-процесс");
	Результат.Вставить("БизнесПроцессОбъект", "Бизнес-процесс объект");
	Результат.Вставить("ВводНаОсновании", "Ввод на основании");
	Результат.Вставить("ВидРасчета", "Вид расчета");
	Результат.Вставить("ВложеннаяТаблица", "Вложенная таблица");
	Результат.Вставить("ВнешнийИсточникДанных", "Внешний источник данных");
	Результат.Вставить("ВнешнийИсточникДанныхКуб", "ВнешнийИсточникДанныхКуб");
	Результат.Вставить("ВнешнийИсточникДанныхКубТаблицаИзмерения", "ВнешнийИсточникДанныхКубТаблицаИзмерения");
	Результат.Вставить("ВнешнийИсточникДанныхТаблица", "Внешний источник данных таблица");
	Результат.Вставить("ВнешнийИсточникДанныхФункция", "Внешний источник данных функция");
	Результат.Вставить("ВосстановитьЗначения", "Восстановить значения");
	Результат.Вставить("Вперед", "Вперед");
	Результат.Вставить("ВыборКомпоновкиДанных", "Выбор компоновки данных");
	Результат.Вставить("ВыборКомпоновкиДанныхНедоступный", "Выбор компоновки данных недоступный");
	Результат.Вставить("Выбрать", "Выбрать");
	Результат.Вставить("ВыбратьВерхнийУровень", "Выбрать верхний уровень");
	Результат.Вставить("ВыбратьЗначение", "Выбрать значение");
	Результат.Вставить("ВыбратьИзСписка", "Выбрать из списка");
	Результат.Вставить("ВыбратьТип", "Выбрать тип");
	Результат.Вставить("ВывестиСписок", "Вывести список");
	Результат.Вставить("ВыполнитьЗадачу", "Выполнить задачу");
	Результат.Вставить("ГеографическаяСхема", "Географическая схема");
	Результат.Вставить("ГрафическаяСхема", "Графическая схема");
	Результат.Вставить("Дебет", "Дебет");
	Результат.Вставить("ДебетКредит", "Дебет/кредит");
	Результат.Вставить("Дендрограмма", "Дендрограмма");
	Результат.Вставить("Диаграмма", "Диаграмма");
	Результат.Вставить("ДиаграммаГанта", "Диаграмма Ганта");
	Результат.Вставить("ДиалогВопрос", "Диалог вопрос");
	Результат.Вставить("ДиалогВосклицание", "Диалог восклицание");
	Результат.Вставить("ДиалогИнформация", "Диалог информация");
	Результат.Вставить("ДиалогСтоп", "Диалог стоп");
	Результат.Вставить("ДобавитьВИзбранное", "Добавить в избранное");
	Результат.Вставить("ДобавитьЭлементСписка", "Добавить элемент списка");
	Результат.Вставить("Документ", "Документ");
	Результат.Вставить("ДокументОбъект", "Документ объект");
	Результат.Вставить("ЖурналДокументов", "Журнал документов");
	Результат.Вставить("ЖурналРегистрации", "Журнал регистрации");
	Результат.Вставить("ЖурналРегистрацииПоПользователю", "Журнал регистрации поПользователю");
	Результат.Вставить("ЗагрузитьНастройкиОтчета", "Загрузить настройки отчета");
	Результат.Вставить("Задача", "Задача");
	Результат.Вставить("ЗадачаОбъект", "Задача объект");
	Результат.Вставить("ЗакончитьРедактирование", "Закончить редактирование");
	Результат.Вставить("Закрыть", "Закрыть");
	Результат.Вставить("Заменить", "Заменить");
	Результат.Вставить("Записать", "Записать");
	Результат.Вставить("ЗаписатьИЗакрыть", "Записать и закрыть");
	Результат.Вставить("ЗаписатьИзменения", "Записать изменения");
	Результат.Вставить("ЗатенитьФлажки", "Затенить флажки");
	Результат.Вставить("ЗафиксироватьТаблицу", "Зафиксировать таблицу");   
	Результат.Вставить("ИерархическийПросмотр", "Иерархический просмотр");
	Результат.Вставить("Изменить", "Изменить");
	Результат.Вставить("ИзменитьФорму", "Изменить форму");
	Результат.Вставить("ИзменитьЭлементСписка", "Изменить элемент списка");
	Результат.Вставить("Измерение", "Измерение");
	Результат.Вставить("История", "История");
	Результат.Вставить("ИсторияДанных", "История данных");
	Результат.Вставить("ИсторияОтборов", "История отборов");
	Результат.Вставить("Календарь", "Календарь");
	Результат.Вставить("Калькулятор", "Калькулятор");
	Результат.Вставить("Картинка", "Картинка");
	Результат.Вставить("Константа", "Константа");
	Результат.Вставить("КонструкторЗапроса", "Конструктор запроса");
	Результат.Вставить("КонструкторЗапросаВложенныйЗапрос", "Конструктор запроса вложенный запрос");
	Результат.Вставить("КонструкторЗапросаВременнаяТаблица", "Конструктор запроса временная таблица");
	Результат.Вставить("КонструкторЗапросаГруппаВременныхТаблиц", "Конструктор запроса группа временных таблиц");
	Результат.Вставить("КонструкторЗапросаЗаменитьТаблицу", "Конструктор запроса заменить таблицу");
	Результат.Вставить("КонструкторЗапросаОписаниеВременнойТаблицы", "Конструктор запроса описание временной таблицы");
	Результат.Вставить("КонструкторЗапросаОтображатьТаблицыИзменений", "Конструктор запроса отображать таблицы изменений");
	Результат.Вставить("КонструкторЗапросаПараметрыТаблицы", "Конструктор запроса параметры таблицы");
	Результат.Вставить("КонструкторЗапросаСоздатьВложенныйЗапрос", "Конструктор запроса создать вложенный запрос");
	Результат.Вставить("КонструкторЗапросаСоздатьЗапросУничтоженияВременнойТаблицы", "Конструктор запроса создать запрос уничтожения временной таблицы");
	Результат.Вставить("КонструкторЗапросаСоздатьОписаниеВременнойТаблицы", "Конструктор запроса создать описание временной таблицы");
	Результат.Вставить("КонструкторНастроекКомпоновкиДанных", "Конструктор настроек компоновки данных");
	Результат.Вставить("Кредит", "Кредит");
	Результат.Вставить("КритерийОтбора", "Критерий отбора");
	Результат.Вставить("Лупа", "Лупа");
	Результат.Вставить("Назад", "Назад");
	Результат.Вставить("Найти", "Найти");
	Результат.Вставить("НайтиВДереве", "Найти в дереве");
	Результат.Вставить("НайтиВСодержании", "Найти в содержании");
	Результат.Вставить("НайтиВСписке", "Найти в списке");
	Результат.Вставить("НайтиПоНомеру", "Найти по номеру");
	Результат.Вставить("НайтиПредыдущий", "Найти предыдущий");
	Результат.Вставить("НайтиСледующий", "Найти следующий");
	Результат.Вставить("НастроитьСписок", "Настроить список");
	Результат.Вставить("НастройкаСписка", "Настройка списка");
	Результат.Вставить("НастройкиОтчета", "Настройки отчета");
	Результат.Вставить("НеБеспокоить", "Не беспокоить");
	Результат.Вставить("НеОповещать", "Не оповещать");
	Результат.Вставить("НоваяВложеннаяСхемаКомпоновкиДанных", "Новая вложенная схема компоновки данных");
	Результат.Вставить("НоваяГруппа", "Новая группа");
	Результат.Вставить("НоваяГруппировкаКомпоновкиДанных", "Новая группировка компоновки данных");
	Результат.Вставить("НоваяДиаграммаКомпоновкиДанных", "Новая диаграмма компоновки данных");
	Результат.Вставить("НоваяТаблицаКомпоновкиДанных", "Новая таблица компоновки данных");
	Результат.Вставить("НовоеОбсуждение", "Новое обсуждение");
	Результат.Вставить("НовоеОкно", "Новое окно");
	Результат.Вставить("Обновить", "Обновить");
	Результат.Вставить("Обработка", "Обработка");
	Результат.Вставить("Обсуждения", "Обсуждения");
	Результат.Вставить("Оповещать", "Оповещать");
	Результат.Вставить("Оповещения", "Оповещения");
	Результат.Вставить("Остановить", "Остановить");
	Результат.Вставить("ОтборИСортировка", "Отбор и сортировка");
	Результат.Вставить("ОтборКомпоновкиДанных", "Отбор компоновки данных");
	Результат.Вставить("ОтборКомпоновкиДанныхНедоступный", "Отбор компоновки данных недоступный");
	Результат.Вставить("ОтборПоВиду", "Отбор по виду");
	Результат.Вставить("ОтборПоТекущемуЗначению", "Отбор по текущему значению");
	Результат.Вставить("ОтключитьОтбор", "Отключить отбор");
	Результат.Вставить("ОткрытьФайл", "Открыть файл");
	Результат.Вставить("ОтменаПроведения", "Отмена проведения");
	Результат.Вставить("ОтменитьПоиск", "Отменить поиск");
	Результат.Вставить("ОтправитьСообщение", "Отправить сообщение");
	Результат.Вставить("Отчет", "Отчет");
	Результат.Вставить("Очистить", "Очистить");
	Результат.Вставить("ПараметрыВыводаКомпоновкиДанных", "Параметры вывода компоновки данных");
	Результат.Вставить("ПараметрыВыводаКомпоновкиДанныхНедоступные", "Параметры вывода компоновки данных недоступные");
	Результат.Вставить("ПараметрыДанныхКомпоновкиДанных", "Параметры данных компоновки данных");
	Результат.Вставить("Переименовать", "Переименовать");
	Результат.Вставить("ПерейтиВперед", "Перейти вперед");
	Результат.Вставить("ПерейтиККонцу", "Перейти к концу");
	Результат.Вставить("ПерейтиКНачалу", "Перейти к началу");
	Результат.Вставить("ПерейтиНазад", "Перейти назад");
	Результат.Вставить("ПерейтиПоНавигационнойСсылке", "Перейти по навигационной ссылке");
	Результат.Вставить("ПереключитьАктивность", "Переключить активность");
	Результат.Вставить("ПереместитьВверх", "Переместить вверх");
	Результат.Вставить("ПереместитьВлево", "Переместить влево");
	Результат.Вставить("ПереместитьВниз", "Переместить вниз");
	Результат.Вставить("ПереместитьВправо", "Переместить вправо");
	Результат.Вставить("ПеренестиЭлемент", "Перенести элемент");
	Результат.Вставить("Перечисление", "Перечисление");
	Результат.Вставить("Перечитать", "Перечитать");
	Результат.Вставить("Печать", "Печать");
	Результат.Вставить("ПечатьСразу", "Печать сразу");
	Результат.Вставить("ПланВидовРасчета", "План видов расчета");
	Результат.Вставить("ПланВидовРасчетаОбъект", "План видов расчета объект");
	Результат.Вставить("ПланВидовХарактеристик", "План видов характеристик");
	Результат.Вставить("ПланВидовХарактеристикОбъект", "План видов характеристик объект");
	Результат.Вставить("ПланОбмена", "План обмена");
	Результат.Вставить("ПланОбменаОбъект", "План обмена объект");
	Результат.Вставить("ПланСчетов", "План счетов");
	Результат.Вставить("ПланСчетовОбъект", "План счетов объект");
	Результат.Вставить("ПоказатьВСписке", "Показать в списке");
	Результат.Вставить("ПоказатьДанные", "Показать данные");
	Результат.Вставить("ПолучитьНавигационнуюСсылку", "Получить навигационную ссылку");
	Результат.Вставить("Пользователь", "Пользователь");
	Результат.Вставить("ПользовательБезНеобходимыхСвойств", "Пользователь без необходимых свойств");
	Результат.Вставить("ПользовательСАутентификацией", "Пользователь с аутентификацией");
	Результат.Вставить("ПользовательскиеПоляКомпоновкиДанных", "Пользовательские поля компоновки данных");
	Результат.Вставить("ПоляГруппировкиКомпоновкиДанных", "Поля группировки компоновки данных");
	Результат.Вставить("ПоляГруппировкиКомпоновкиДанныхНедоступные", "Поля группировки компоновки данных недоступные");
	Результат.Вставить("ПометитьНаУдаление", "Пометить на удаление");
	Результат.Вставить("ПорядокКомпоновкиДанных", "Порядок компоновки данных");
	Результат.Вставить("ПорядокКомпоновкиДанныхНедоступный", "Порядок компоновки данных недоступный");
	Результат.Вставить("Предыдущий", "Предыдущий");
	Результат.Вставить("Прикрепить", "Прикрепить");
	Результат.Вставить("Провести", "Провести");
	Результат.Вставить("ПроизвольноеВыражение", "Произвольное выражение");
	Результат.Вставить("ПросмотрПоВладельцу", "Просмотр по владельцу");
	Результат.Вставить("ПрочитатьИзменения", "Прочитать изменения");
	Результат.Вставить("РазвернутьВсе", "Развернуть все");
	Результат.Вставить("РегистрБухгалтерии", "Регистр бухгалтерии");
	Результат.Вставить("РегистрНакопления", "Регистр накопления");
	Результат.Вставить("РегистрРасчета", "Регистр расчета");
	Результат.Вставить("РегистрСведений", "Регистр сведений");
	Результат.Вставить("РегистрСведенийЗапись", "Регистр сведений запись");
	Результат.Вставить("РегламентноеЗадание", "Регламентное задание");
	Результат.Вставить("РегламентныеЗадания", "Регламентные задания");
	Результат.Вставить("РедактироватьВДиалоге", "Редактировать в диалоге");
	Результат.Вставить("РежимПросмотраСписка", "Режим просмотра списка");
	Результат.Вставить("РежимПросмотраСпискаДерево", "Режим просмотра списка дерево");
	Результат.Вставить("РежимПросмотраСпискаИерархическийСписок", "Режим просмотра списка иерархический список");
	Результат.Вставить("РежимПросмотраСпискаСписок", "Режим просмотра списка список");
	Результат.Вставить("Реквизит", "Реквизит");
	Результат.Вставить("Ресурс", "Ресурс");
	Результат.Вставить("СвернутьВсе", "Свернуть все");
	Результат.Вставить("СводнаяДиаграмма", "Сводная диаграмма");
	Результат.Вставить("Свойства", "Свойства");
	Результат.Вставить("Сегодня", "Сегодня");
	Результат.Вставить("Символ", "Символ");
	Результат.Вставить("СинтаксическийКонтроль", "Синтаксический контроль");
	Результат.Вставить("СкопироватьОбъект", "Скопировать объект");
	Результат.Вставить("СкопироватьЭлементСписка", "Скопировать элемент списка");
	Результат.Вставить("Следующий", "Следующий");
	Результат.Вставить("СнятьФлажки", "Снять флажки");
	Результат.Вставить("СоздатьГруппу", "Создать группу");
	Результат.Вставить("СоздатьНачальныйОбраз", "Создать начальный образ");
	Результат.Вставить("СоздатьЭлементСписка", "Создать элемент списка");
	Результат.Вставить("СортироватьСписок", "Сортировать список");
	Результат.Вставить("СортироватьСписокПоВозрастанию", "Сортировать список по возрастанию");
	Результат.Вставить("СортироватьСписокПоУбыванию", "Сортировать список по убыванию");
	Результат.Вставить("Сортировка", "Сортировка");
	Результат.Вставить("СохранитьЗначения", "Сохранить значения");
	Результат.Вставить("СохранитьНастройкиОтчета", "Сохранить настройки отчета");
	Результат.Вставить("СохранитьФайл", "Сохранить файл");
	Результат.Вставить("Справка", "Справка");
	Результат.Вставить("Справочник", "Справочник");
	Результат.Вставить("СправочникОбъект", "Справочник объект");
	Результат.Вставить("СтандартнаяНастройкаКомпоновкиДанных", "Стандартная настройка компоновки данных");
	Результат.Вставить("СтартБизнесПроцесса", "Старт бизнес-процесса");
	Результат.Вставить("СформироватьОтчет", "Сформировать отчет");
	Результат.Вставить("ТабличныйДокументВставитьПримечание", "Табличный документ вставить примечание");
	Результат.Вставить("ТабличныйДокументВставитьРазрывСтраницы", "Табличный документ вставить разрыв страницы");
	Результат.Вставить("ТабличныйДокументОтображатьГруппировки", "Табличный документ отображать группировки");
	Результат.Вставить("ТабличныйДокументОтображатьЗаголовки", "Табличный документ отображать заголовки");
	Результат.Вставить("ТабличныйДокументОтображатьПримечания", "Табличный документ отображать примечания");
	Результат.Вставить("ТабличныйДокументОтображатьСетку", "Табличный документ отображатьСетку");
	Результат.Вставить("ТабличныйДокументТолькоПросмотр", "Табличный документ только просмотр");
	Результат.Вставить("ТабличныйДокументУдалитьПримечание", "Табличный документ удалить примечание");
	Результат.Вставить("ТабличныйДокументУдалитьРазрывСтраницы", "Табличный документ удалить разрыв страницы");
	Результат.Вставить("УвеличитьМасштаб", "Увеличить масштаб");
	Результат.Вставить("Удалить", "Удалить");
	Результат.Вставить("УдалитьНепосредственно", "Удалить непосредственно");
	Результат.Вставить("УдалитьЭлементСписка", "Удалить элемент списка");
	Результат.Вставить("УдалитьЭлементСпискаНепосредственно", "Удалить элемент списка непосредственно");
	Результат.Вставить("УменьшитьМасштаб", "Уменьшить масштаб");
	Результат.Вставить("УправлениеПоиском", "Управление поиском");
	Результат.Вставить("УровеньВверх", "Уровень вверх");
	Результат.Вставить("УровеньВниз", "Уровень вниз");
	Результат.Вставить("УсловноеОформлениеКомпоновкиДанных", "Условное оформление компоновки данных");
	Результат.Вставить("УсловноеОформлениеКомпоновкиДанныхНедоступное", "Условное оформление компоновки данных недоступное");
	Результат.Вставить("УстановитьВремя", "Установить время");
	Результат.Вставить("УстановитьИнтервал", "Установить интервал");
	Результат.Вставить("УстановитьПометкуУдаленияЭлементаСписка", "Установить пометку удаления элемента списка");
	Результат.Вставить("УстановитьФлажки", "Установить флажки");
	Результат.Вставить("Форма", "Форма");
	Результат.Вставить("ХранилищеНастроек", "Хранилище настроек");
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Процедура ЗаполнитьКартинкиИзКонфигурации()
	
	ИменаКартинок = ПолучитьИменаКартинокВКонфигурации();
	Для Каждого Пара Из ИменаКартинок Цикл
		Попытка
			НоваяСтрока = КартинкиИзКонфигурации.Добавить();
			НоваяСтрока.Картинка = БиблиотекаКартинок[Пара.Ключ]; 
			НоваяСтрока.Значение = Пара.Ключ; 
			НоваяСтрока.Представление = Пара.Значение; 
		Исключение

		КонецПопытки;
	КонецЦикла;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьИменаКартинокВКонфигурации() 
	
	Результат = Новый Структура;
	
	КоллекцияКартинок = Метаданные.ОбщиеКартинки;
	Для Каждого Картинка Из КоллекцияКартинок Цикл
		Результат.Вставить(Картинка.Имя, Картинка.Синоним);
	КонецЦикла;

	Возврат Результат;
	
КонецФункции

&НаКлиенте
Процедура ОбработатьВыборКартинки()
	
	Результат = Новый Структура("Значение,Представление", "", "");
	
	Если Элементы.ГруппаИсточникиКартинок.ТекущаяСтраница = Элементы.ГруппаИзБиблиотеки Тогда
		
		ТекущиеДанные = Элементы.КартинкиИзБиблиотеки.ТекущиеДанные;
		ЗаполнитьЗначенияСвойств(Результат, ТекущиеДанные);
		Закрыть(Результат);
		
	ИначеЕсли Элементы.ГруппаИсточникиКартинок.ТекущаяСтраница = Элементы.ГруппаИзКонфигурации Тогда
		
		ТекущиеДанные = Элементы.КартинкиИзКонфигурации.ТекущиеДанные;
		ЗаполнитьЗначенияСвойств(Результат, ТекущиеДанные);
		Закрыть(Результат);
		
	ИначеЕсли Элементы.ГруппаИсточникиКартинок.ТекущаяСтраница = Элементы.ГруппаИзКаталога Тогда
		
		ТекущиеДанные = Элементы.КартинкиИзКаталогаПроекта.ТекущиеДанные;
		ЗаполнитьЗначенияСвойств(Результат, ТекущиеДанные);
		Закрыть(Результат);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти


