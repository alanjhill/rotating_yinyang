import 'package:flutter/material.dart';
import 'package:rotating_yinyang/app_router.dart';
import 'package:rotating_yinyang/step_1/step_1.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Step1(),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
        context,
        settings,
      ),
    );
  }
}
