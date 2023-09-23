import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/HomeScreen.dart';
import 'package:stopwatch/TimerProviderModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerProviderModel()),
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
    );
  }
}
