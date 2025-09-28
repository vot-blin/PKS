import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Практика №4',
        home: CounterPractice(),
    );
  }
}

class CounterPractice extends StatefulWidget {
  const CounterPractice({super.key});

  @override
  _CounterPracticeState createState() => _CounterPracticeState();
}

class _CounterPracticeState extends State<CounterPractice> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Практика №4'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Значение счётчика: $counter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
          ),
          SizedBox(height: 30),

          Container(
            color: Colors.lightBlue[100],
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () => setState(() => counter++),
              onLongPress: () => setState(() => counter += 10),
              child: Text('Увеличить'),
            ),
          ),
          SizedBox( height: 15),

          Container(
              color: Colors.orange[100],
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => setState(() => counter = 0),
                child: Text('Сбросить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
