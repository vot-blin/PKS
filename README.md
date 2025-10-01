Практическое занятие №5. Работа со списками. Передача данных между модулями

ЭФБО-09-23 Доронина Мария

# Цели:

Научиться отображать коллекции данных с помощью ListView.builder.

Освоить базовую навигацию Navigator.push / Navigator.pop и передачу данных через конструктор.

Научиться добавлять, редактировать и удалять элементы списка без внешних пакетов и сложных архитектур.

# Ход работы:
# 1.Реализация модели данных (Note).
<img width="721" height="298" alt="image" src="https://github.com/user-attachments/assets/bbede7d2-d317-44ac-8f33-152238a8a69e" />

Пояснение: Модель обеспечивает целостность данных и удобное создание изменённых копий.
# 2.Настройка главного экрана (NotesPage).
<img width="818" height="504" alt="image" src="https://github.com/user-attachments/assets/3290a4fe-c5a2-4c35-b39e-39a1a859ebb8" />

Пояснение: ListView.builder создаёт элементы по мере прокрутки, что эффективно для больших списков. ValueKey гарантирует стабильность состояния элементов.
# 3.Добавление навигации и передача данных.
<img width="688" height="291" alt="image" src="https://github.com/user-attachments/assets/340ee977-d181-4cc4-851f-f6c49f306166" />

Пояснение: Данные передаются через конструктор, а обновлённый объект возвращается для синхронизации с главным экраном.
# 4.Создание экрана редактирования (EditNotePage).
<img width="647" height="317" alt="image" src="https://github.com/user-attachments/assets/c2e75c39-ba16-45c4-a5da-573e88c41005" />

Пояснение: GlobalKey<FormState> управляет состоянием формы.

1.Скриншот списка заметок.
<img width="1561" height="839" alt="image" src="https://github.com/user-attachments/assets/2687478e-1385-4399-abaa-b1113a937d10" />

2.Скриншот страницы создания заметок.
<img width="1563" height="845" alt="image" src="https://github.com/user-attachments/assets/54c497fc-71e8-4359-a48a-bb1908e2e4f9" />

3.Скриншот страницы редактирования заметок.
<img width="1564" height="850" alt="image" src="https://github.com/user-attachments/assets/d8ef0755-8450-4e94-8a67-c5da8515e1d8" />

4.Скриншот после удаления заметок.
<img width="1559" height="840" alt="image" src="https://github.com/user-attachments/assets/e4b2a59f-a794-4a17-b4dd-d2a61b963817" />
