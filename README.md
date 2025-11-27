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

1. Используемый API.

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

2. Модель и репозиторий.
```
class Note {
  final int id;
  final String name;
  final String avatar;
  final String createdAt;

  Note({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] is String ? int.tryParse(json['id']) ?? 0 : (json['id'] ?? 0),
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(), // mockapi.io ожидает id как строку
      'name': name,
      'avatar': avatar,
      'createdAt': createdAt,
    };
  }
}
```
Репозиторий NotesRepository:

Полностью соответствует структуре API.

Использует Dio через ApiClient.

Реализует полный CRUD:
```
Future<List<Note>> list({int page, int limit});
Future<Note> get(int id);
Future<Note> create(String name, String avatar);
Future<Note> update(int id, String name, String avatar);
Future<void> delete(int id);
```

3. Пагинация.

Поддержка на уровне API: mockapi.io поддерживает ?page=...&limit=....

Клиентская реализация:

Используется ScrollController для отслеживания доскролла до конца.

При достижении конца вызывается _loadMore().

В текущей конфигурации загружаются все страницы, но можно ограничить (например, только первую).

Запрет рекурсивных вызовов: проверка _loading и _canLoadMore.

4. Обработка ошибок и таймауты.

Таймауты: заданы в Dio через BaseOptions:
```
connectTimeout: const Duration(seconds: 10),
receiveTimeout: const Duration(seconds: 10),П
```
Обработка ошибок:

Все сетевые вызовы обёрнуты в try/catch.

При ошибке показывается SnackBar с сообщением.

Проверка if (mounted) перед setState() — предотвращает ошибки после уничтожения виджета.

5. UX: Loading/Empty/Error.

| Состояние    | Реализация                                                                                                                         | 
|:-------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| Загрузка     | CircularProgressIndicator в центре при первом запуске Индикатор в футере списка при пагинации  RefreshIndicator для pull-to-refresh|
|:-------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| Пустой список| Не реализован отдельно (редко на mockapi), но легко добавить через проверку _items.isEmpty && !_loading                            |
|:-------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| Ошибка       | SnackBar с текстом «Ошибка загрузки» и т.д. Ошибки парсинга/сети не ломают приложение                                              |

# Скриншоты работы приложения
Скриншот экрана списка

<img width="460" height="962" alt="image" src="https://github.com/user-attachments/assets/c0ac51e5-8d01-4862-ba60-c513ae951800" />

Скриншот экрана деталей

<img width="469" height="982" alt="image" src="https://github.com/user-attachments/assets/4981e9cf-693c-4207-ac10-fe3038c7c44f" />

Скриншот диалога создания и результата

<img width="478" height="961" alt="image" src="https://github.com/user-attachments/assets/2507532f-901c-44f7-b082-02018e67684b" />

<img width="456" height="701" alt="image" src="https://github.com/user-attachments/assets/e38858e9-8c71-47ab-8b02-663e16344407" />







