# Практическое занятие №11 Работа с базами данных. Основы работы с API (HTTP/REST) для Flutter
# ЭФБО-09-23 Доронина Мария
# Цели:
Понять базовые понятия HTTP/REST: методы, URL/эндпоинты, коды ответов, заголовки, тела запросов/ответов (JSON).

Освоить основы интеграции Flutter-приложения с внешним API: http/dio, сериализация JSON, обработка ошибок и таймаутов.

Научиться выстраивать слой данных с репозиторием и отделять его от UI (продолжаем архитектурную линию прошлых ПЗ).

Реализовать список сущностей из публичного API + экран деталей + форму создания/редактирования (с демонстрацией запросов).

Разобраться с пагинацией, фильтрацией, аутентификацией (Bearer), ретраями и UX при сетевых сбоях.

# Вариант: B. Полный CRUD: на mockapi.io

<img width="1540" height="469" alt="image" src="https://github.com/user-attachments/assets/146ab1c1-40ef-4c57-90cf-dac012de8d3e" />

# Ход работы

Используемый API

Тип: Вариант B — mockapi.io

Базовый URL https://691c4f723aaeed735c905921.mockapi.io/api/

Примеры эндпоинтов:
GET /notes — получить список записей (с поддержкой ?page=1&limit=20)

POST /notes — создать новую запись

DELETE /notes/1 — удалить запись

API возвращает объекты вида: 
```
{
  "id": "1",
  "name": "Emily Glover",
  "avatar": "https://...",
  "createdAt": "2025-11-18T03:14:15.877Z"
}
```
# Скриншоты работы приложения
Скриншот экрана списка

<img width="460" height="962" alt="image" src="https://github.com/user-attachments/assets/c0ac51e5-8d01-4862-ba60-c513ae951800" />

Скриншот экрана деталей

<img width="469" height="982" alt="image" src="https://github.com/user-attachments/assets/4981e9cf-693c-4207-ac10-fe3038c7c44f" />

Скриншот диалога создания и результата

<img width="478" height="961" alt="image" src="https://github.com/user-attachments/assets/2507532f-901c-44f7-b082-02018e67684b" />

<img width="456" height="701" alt="image" src="https://github.com/user-attachments/assets/e38858e9-8c71-47ab-8b02-663e16344407" />







