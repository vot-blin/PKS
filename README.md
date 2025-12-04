# Практическое занятие № 13. Аппаратная часть мобильных устройств. Работа с геолокацией. Работа с различными датчиками устройства.
# ЭФБО-09-23 Доронина Мария

# Цели занятия:
Изучить возможности работы с аппаратными датчиками и сервисами устройства.

Освоить получение координат устройства с помощью геолокации.

Научиться определять местоположение, направление и движение.

Изучить работу с сенсорами: акселерометр, гироскоп, компас, освещенность и др.

Разработать мобильное приложение, использующее геолокацию и данные сенсоров.

# Ход работы:

Разрешения (Android) в файле AndroidManifest.xml:
```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

Используемые пакеты:
```
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^10.1.0        
  geocoding: ^2.2.0         
  sensors_plus: ^5.0.0       
  flutter_compass: ^0.7.0    
```

Получение геопозиции и обратное геокодирование:
```
Future<void> _getLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return;

  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) return;

  final pos = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  List<Placemark> placemarks =
      await placemarkFromCoordinates(pos.latitude, pos.longitude);

  if (!mounted) return;

  setState(() {
    _position = pos;
    _address =
        '${placemarks.first.locality ?? ''}, ${placemarks.first.street ?? ''}';
  });
}
```
# Скриншоты приложения:
Главный экран

<img width="460" height="716" alt="image" src="https://github.com/user-attachments/assets/a4506f08-b32c-4bc1-b0c2-626c5943bfa8" />

Отображение координат, адреса, реакции сенсоров и компаса

<img width="469" height="560" alt="image" src="https://github.com/user-attachments/assets/88cdcf32-5531-49bb-845f-e54abf0c7d2c" />

