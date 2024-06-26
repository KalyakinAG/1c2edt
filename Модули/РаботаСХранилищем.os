#Использовать v8runner
#Использовать v8storage

Перем МаскаВерсииПлатформы Экспорт;

Функция ВыгрузитьПоследнююВерсиюХранилища(СтрокаСоединенияСХранилищем, ПараметрыПодключения, РабочийКаталог) Экспорт
	//Каталог = РабочийКаталог + "\cf";
	Каталог = ВременныеФайлы.СоздатьКаталог();
	ХранилищеКонфигурации = Новый МенеджерХранилищаКонфигурации();
	ХранилищеКонфигурации.УстановитьПутьКХранилищу(СтрокаСоединенияСХранилищем);
	ХранилищеКонфигурации.УстановитьПараметрыАвторизации(ПараметрыПодключения.Пользователь, ПараметрыПодключения.Пароль);
	ХранилищеКонфигурации.ПрочитатьХранилище();
	ТаблицаВерсий = ХранилищеКонфигурации.ПолучитьТаблицуВерсий();
	ПоследняяВерсия = ТаблицаВерсий[ТаблицаВерсий.Количество() - 1].Номер;
	Конфигуратор = ХранилищеКонфигурации.ПолучитьУправлениеКонфигуратором();
	Конфигуратор.ИспользоватьВерсиюПлатформы(МаскаВерсииПлатформы);
	Конфигуратор.ОбновитьКонфигурациюБазыДанныхИзХранилища(СтрокаСоединенияСХранилищем, ПараметрыПодключения.Пользователь, ПараметрыПодключения.Пароль, ПоследняяВерсия);
	Конфигуратор.ВыгрузитьКонфигурациюВФайлы(Каталог);
	Возврат Каталог;
КонецФункции
