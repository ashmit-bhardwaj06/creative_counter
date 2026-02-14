import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreativeCounter(),
    );
  }
}

class CreativeCounter extends StatefulWidget {
  @override
  _CreativeCounterState createState() => _CreativeCounterState();
}

class _CreativeCounterState extends State<CreativeCounter> {
  int _counter = 0;
  Color _bgColor = Colors.white;
  String _emoji = "😐";

  void _incrementCounter() {
    setState(() {
      _counter++;

      // Random Background Color
      _bgColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

      // Emoji Change Logic
      if (_counter < 5) {
        _emoji = "😐";
      } else if (_counter < 10) {
        _emoji = "🙂";
      } else if (_counter < 15) {
        _emoji = "😄";
      } else {
        _emoji = "🤩";
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _bgColor = Colors.white;
      _emoji = "😐";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text("Creative Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _emoji,
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 20),
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Increment"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
