# Platius POS API v2 SDK

Данный проект содержит клиентские библиотеки для подключения к сервису Platius.

## Структура репозитория
/doc - документация на API и описание рабочих сценариев  
/bin - библиотеки  
/samples - примеры использования API  
/test - сценарии тестирования интеграции API со сторонними системами  


## Plazius POS API Client v2.2 release notes
- Улучшена стабильность и время отклика кассы при плохой связи с сервером
- Улучшена работа в оффлайне
- Реализована печать подвала Плазиус при оффлайне
- Защита от отвязки пользователя при плохих сценариях (медленный интернет, обрывы связи и тд)
- Поддержка последней версии R-Keeper 7 (в частности передача данных о версиях кассового ПО в заголовках запросов)
- Избавление от зависимостей от сторонних библиотек
- Улучшено логирование
- Передача на сервера Plazius данных для мониторинга
- Большое количество минорных исправлений.
