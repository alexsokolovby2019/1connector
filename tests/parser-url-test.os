#Использовать asserts
#Использовать "../src"

Функция ПолучитьСписокТестов(МенеджерТестирования) Экспорт

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСоЗнакомРавноВЗначенииПараметраЗапроса");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСПараметромЗапросаБезЗначения");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСЯвноЗаданнымПортом");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСПараметрамиЗапросаСНесколькимиЗначениями");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСФрагментом");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборURLСХостомВФорматеIPv6");
	МассивТестов.Добавить("ТестДолжен_ПроверитьЧтоРаботаетРазборПростогоURL");
	
	Возврат МассивТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСоЗнакомРавноВЗначенииПараметраЗапроса() Экспорт

	СтруктураURL = КоннекторHTTP.РазобратьURL(
		"https://httpbin.org/anything?jql=worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01&j&i=2");

	Ожидаем.Что(СтруктураURL.Схема).Равно("https");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("httpbin.org");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/anything");
	Ожидаем.Что(СтруктураURL.Порт).Равно(0);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса["jql"]).Равно("worklogDate >= 2017-04-01 AND worklogDate <= 2017-05-01");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса["j"]).Равно(Неопределено);
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса["i"]).Равно("2");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСПараметромЗапросаБезЗначения() Экспорт

	СтруктураURL = КоннекторHTTP.РазобратьURL("https://httpbin.org/get?key");

	Ожидаем.Что(СтруктураURL.Схема).Равно("https");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("httpbin.org");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/get");
	Ожидаем.Что(СтруктураURL.Порт).Равно(0);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса["key"]).Равно(Неопределено);

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСЯвноЗаданнымПортом() Экспорт

	СтруктураURL = КоннекторHTTP.РазобратьURL("https://httpbin.org:443/get?key");

	Ожидаем.Что(СтруктураURL.Схема).Равно("https");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("httpbin.org");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/get");
	Ожидаем.Что(СтруктураURL.Порт).Равно(443);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса["key"]).Равно(Неопределено);

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСПараметрамиЗапросаСНесколькимиЗначениями() Экспорт

	СтруктураURL = КоннекторHTTP.РазобратьURL("http://httpbin.org/anything?i=v1&j=w1&j=w2&i=v2&i=v3");

	Ожидаем.Что(СтруктураURL.Схема).Равно("http");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("httpbin.org");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/anything");
	Ожидаем.Что(СтруктураURL.Порт).Равно(0);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтрСоединить(СтруктураURL.ПараметрыЗапроса["i"], ", ")).Равно("v1, v2, v3");
	Ожидаем.Что(СтрСоединить(СтруктураURL.ПараметрыЗапроса["j"], ", ")).Равно("w1, w2");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСФрагментом() Экспорт
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("https://en.wikipedia.org/wiki/1C_Company#Products");

	Ожидаем.Что(СтруктураURL.Схема).Равно("https");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("en.wikipedia.org");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/wiki/1C_Company");
	Ожидаем.Что(СтруктураURL.Порт).Равно(0);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("Products");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса.Количество()).Равно(0);

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборURLСХостомВФорматеIPv6() Экспорт
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("http://[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]:8080/test");

	Ожидаем.Что(СтруктураURL.Схема).Равно("http");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/test");
	Ожидаем.Что(СтруктураURL.Порт).Равно(8080);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса.Количество()).Равно(0);

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтоРаботаетРазборПростогоURL() Экспорт
	
	СтруктураURL = КоннекторHTTP.РазобратьURL("http://1c.ru");

	Ожидаем.Что(СтруктураURL.Схема).Равно("http");
	Ожидаем.Что(СтруктураURL.Сервер).Равно("1c.ru");
	Ожидаем.Что(СтруктураURL.Путь).Равно("/");
	Ожидаем.Что(СтруктураURL.Порт).Равно(0);
	Ожидаем.Что(СтруктураURL.Фрагмент).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пользователь).Равно("");
	Ожидаем.Что(СтруктураURL.Аутентификация.Пароль).Равно("");
	Ожидаем.Что(СтруктураURL.ПараметрыЗапроса.Количество()).Равно(0);

КонецПроцедуры
