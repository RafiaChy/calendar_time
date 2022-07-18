import 'package:flutter/material.dart';
import 'package:rafia_task_01/screens/duration_screen.dart';
import 'package:rafia_task_01/widgets/date_and_day.dart';
import 'package:rafia_task_01/widgets/time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DurationScreen(),
    );
  }
}