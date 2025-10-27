# Практическое занятие № 8. Работа с базами данных. Подключение приложения к Firebase

# ЭФБО-09-23 Доронина Мария

# Цели:

Подключить Flutter-приложение к Firebase через FlutterFire CLI.

Освоить инициализацию firebase_core и работу с Cloud Firestore (cloud_firestore).

Реализовать базовый CRUD (создание, чтение в реальном времени, обновление, удаление) для коллекции данных.

Настроить минимальные правила безопасности Firestore для учебной среды.

Сформировать практические навыки диагностики и устранения типовых ошибок подключения.

# Ход работы:

1. Скриншот настроенного проекта Firebase
<img width="1088" height="587" alt="image" src="https://github.com/user-attachments/assets/7f1e957e-c945-4af8-a3a6-04aff4fb1f92" />

2. Скриншот запущенного приложения с отображением списка.
<img width="289" height="616" alt="image" src="https://github.com/user-attachments/assets/065bc283-946a-43b2-aba8-a3ed84ff8082" />

3. Скриншот после добавления заметки.
<img width="301" height="618" alt="image" src="https://github.com/user-attachments/assets/425d5186-94c9-44d2-b959-ab89e19436d7" />

4. Скриншот после редактирования.
<img width="298" height="620" alt="image" src="https://github.com/user-attachments/assets/3771b8d6-b002-4344-bc2c-529ce0d633b8" />

5. Скриншот после удаления.
<img width="302" height="615" alt="image" src="https://github.com/user-attachments/assets/98b86795-ead2-4469-80a6-27b0ebd5380b" />

Создание и привязка Firebase-проекта: Firebase CLI + Console, с помощью flutterfire configure.

Процесс: Авторизация в браузере, после выбор/создание проекта Firebase, дальше настройка платформ (Android, iOS, Web) и автогенерация конфигурационных файлов.

Я использовала firebase_core и cloud_firestore, инициализировала в main.dart.

Использованные правила безопасности allow read, write: if true разрешают полный доступ к данным всем пользователям. В продакшн-среде необходимо реализовать строгие правила с аутентификацией.

Коллекцию notes с полями:

title : string

content : string

createdAt : timestamp

updatedAt : timestamp
