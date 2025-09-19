import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Практика 3'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Text('Добро пожаловать в приложение!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Нажми меня', style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          ),
          const SizedBox(height: 20), 
          Container(width: 200, height: 100, color: Color(0xFFFFA000), child: const Center(child: Text('Контейнер',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,
          ),),),),
          const SizedBox(height: 20), Row(mainAxisAlignment: MainAxisAlignment.center,
          children: const [Icon(Icons.star, color: Colors.blue, size: 40,),
          SizedBox(width: 30), Icon(Icons.favorite, color: Colors.red, size: 40,
          ),
          ],
          ),
          ],
        ),
      ),
    );
  }
}

