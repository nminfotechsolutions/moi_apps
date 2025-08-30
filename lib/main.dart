import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/home_screen.dart';
import 'init_controller.dart';

Future<void> main() async {
  await initController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
