# Практическое занятие № 9 Работа с базами данных. Подключение приложения к Supabase (Flutter).
# ЭФБО-09-23 Доронина Мария

# Цели:
Подключить Flutter-приложение к Supabase (Postgres + Auth + Realtime).

Освоить инициализацию supabase_flutter, чтение/запись данных и потоковые обновления (stream()).

Реализовать базовый CRUD (создание, чтение, обновление, удаление) с реактивным списком.

Включить Row Level Security (RLS) и настроить безопасные политики доступа для аутентифицированных пользователей.

# Ход работы:
1. Скриншот настроенного проекта Supabase (Dashboard: Database → notes, включён RLS, список Policies).
<img width="1316" height="579" alt="image" src="https://github.com/user-attachments/assets/908afc8d-9fc2-4ab8-ab30-6c6aaffa73ca" />
<img width="1192" height="595" alt="image" src="https://github.com/user-attachments/assets/0cab5805-42a8-4aa2-901e-67505ad0aa06" />

2. Скриншот экрана входа и экрана со списком (пустого и с данными).

3. Скриншот после добавления заметки (элемент появился).
4. Скриншот после редактирования и после удаления.
