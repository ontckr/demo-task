import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internative_task/core/network/services.dart';
import 'package:internative_task/screens/splash_screen.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<Services>(Services());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
