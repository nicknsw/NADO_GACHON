import 'package:flutter/material.dart';
import 'grade_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '학생부 성적산출 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GradeCalculatorScreen(),
    );
  }
}
