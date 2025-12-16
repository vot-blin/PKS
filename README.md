# Практическое занятие №14 Тестирование и оптимизация мобильного приложения. Исправление ошибок (Flutter).
# ЭФБО-09-23

# Цели работы.

Освоить базовые виды тестирования во Flutter: unit-, widget- и integration-tests.

Настроить линтинг и статический анализ, повысить качество кода.

Научиться профилировать производительность (FPS, jank, память, пропуски кадров) через DevTools и Performance Overlay.

Применить практики оптимизации: уменьшение количества перестроений, работа со списками, изоляция тяжёлых вычислений, оптимизация изображений.

Настроить сбор аварий (Crashlytics/Sentry — опционально).

Отработать цикл «поиск дефекта → воспроизведение → минимальный пример → исправление → тест/регресс».

# Ход работы.

Flutter analyze.

<img width="450" height="95" alt="изображение" src="https://github.com/user-attachments/assets/eb0a720f-28c3-4671-8ff1-3f145da2c3b3" />

Unit-tests.

<img width="416" height="108" alt="{4F756E1F-69D2-4DF0-BC29-B784F5E41BB1}" src="https://github.com/user-attachments/assets/8cb85973-f1be-40e4-a77a-866357ea2f59" />

Процент общий покрытия: 77%. 

# Скриншоты DevTools(до/после).

До оптимизации.

<img width="974" height="251" alt="изображение" src="https://github.com/user-attachments/assets/0a2e555e-d1eb-4fdf-bc94-966b2f34fe2d" />

<img width="974" height="468" alt="изображение" src="https://github.com/user-attachments/assets/9ed1f348-608c-48ba-a145-acf3b49206d9" />

Много Jank баров, выполнение дольше 15 ms.

После оптимизации.

<img width="974" height="232" alt="изображение" src="https://github.com/user-attachments/assets/54f7b128-520a-42f8-9726-7caff06f847e" />

<img width="974" height="469" alt="изображение" src="https://github.com/user-attachments/assets/ac4742fc-5a41-4e43-b22f-1ba611780aac" />

Нет Jank баров, всё выполняется меньше 5 ms, fps стабильно 144.

Analyze size.

До.

<img width="974" height="1003" alt="изображение" src="https://github.com/user-attachments/assets/85c18567-a4bd-4e06-90d9-77c68005a4a7" />

После.

<img width="974" height="1007" alt="изображение" src="https://github.com/user-attachments/assets/355828cd-7939-4ca2-886c-7ebfec035c0d" />

Предпринятые меры: 

Созданы отдельные APK.

Tree-shake иконок.

Удаление assets.

Основной фрагмент кода перехватчика ошибок.

```
void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    print('Flutter Error: ${details.exception}');
    print('Stack trace: ${details.stack}');
  };

  runZonedGuarded(
    () {
      runApp(const SimpleNotesApp());
    },
    (error, stackTrace) {
      print('Uncaught Error: $error');
      print('Stack trace: $stackTrace');
    },
  );
}
```

<img width="574" height="1273" alt="изображение" src="https://github.com/user-attachments/assets/81f9cd46-ae1e-448c-a69d-c814e3f0a884" />


