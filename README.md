# Практическое занятие №12 Аппаратная часть мобильных устройств. Работа с камерой устройства.
# ЭФБО-09-23 Доронина Мария

# Цели занятия: 

Изучить архитектуру и возможности аппаратной части мобильных устройств.

Ознакомиться с API камеры и галереи во Flutter.

Научиться создавать приложения, использующие камеру и хранилище устройства.

Разобраться с разрешениями, обработкой изображений и сохранением данных.

# Ход работы:
Настройка разрешения платформ (Android).

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
Через permission_handler.
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

Через path_provider.
```
final dir = await getApplicationDocumentsDirectory();
final newFile = await _image!.copy('${dir.path}/photo_${DateTime.now().millisecondsSinceEpoch}.jpg');
```
# Скриншоты работы приложений:

1. Главный экран.

<img width="484" height="973" alt="image" src="https://github.com/user-attachments/assets/3c27d17e-67a2-4612-8bcf-bf9979c5d260" />

2. Камера в действии.

<img width="491" height="990" alt="image" src="https://github.com/user-attachments/assets/e456076d-175b-4f6f-a3d9-72f54d247d31" />

3. Отображение фото.

<img width="480" height="997" alt="image" src="https://github.com/user-attachments/assets/5b2dc247-c0c2-437c-9b23-3fe0d643a833" />

4. Уведомление о сохранении.

<img width="486" height="992" alt="image" src="https://github.com/user-attachments/assets/aed7d1f0-60a4-45b2-9c6d-5f4a845fc618" />
