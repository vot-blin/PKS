# Практическое занятие №12 Аппаратная часть мобильных устройств. Работа с камерой устройства.
# ЭФБО-09-23 Доронина Мария

# Цели занятия: 

Изучить архитектуру и возможности аппаратной части мобильных устройств.

Ознакомиться с API камеры и галереи во Flutter.

Научиться создавать приложения, использующие камеру и хранилище устройства.

Разобраться с разрешениями, обработкой изображений и сохранением данных.

# Ход работы:
Настройка разрешения платформ (Android)

Android (AndroidManifest.xml):
```
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

Было создано простое приложение, состоящее из одного экрана, который:

Делает фото через камеру.

Выбирает картинку из галереи.

Отображает её в интерфейсе.

Применяет чёрно-белый фильтр.

Сохраняет результат в локальное хранилище приложения.

# Запрос разрешений:
Через permission_handler
```
if (Platform.isAndroid) {
        await Permission.storage.request();
      } else if (Platform.isIOS) {
        await Permission.photos.request();
      }
```

# Съёмка фото / выбор из галереи:
```
final XFile? pickedFile = await picker.pickImage(source: source);
if (pickedFile != null) {
  setState(() => _image = File(pickedFile.path));
}
```
# Сохранение в память устройства:

Через path_provider
```
final dir = await getApplicationDocumentsDirectory();
final newFile = await _image!.copy('${dir.path}/photo_${DateTime.now().millisecondsSinceEpoch}.jpg');
```
# Скриншоты работы приложений:

1. Главный экран



2. Камера в действии



3. Отображение фото



4. Уведомление о сохранении 
