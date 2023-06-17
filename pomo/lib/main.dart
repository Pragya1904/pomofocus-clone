import 'package:flutter/material.dart';
import 'package:pomo/providers/TaskProvider.dart';
import 'package:pomo/screens/home_page.dart';
import 'package:pomo/providers/TimerProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerProvider>(create: (context)=>TimerProvider()),
        ChangeNotifierProvider<TaskProvider>(create: (context)=>TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Pomodoro Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TimerScreen(),
      ),
    );
  }
}

