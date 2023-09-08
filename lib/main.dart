import 'package:ashresume/pages/category_page.dart';
import 'package:ashresume/pages/home.dart';
import 'package:ashresume/pages/information_page.dart';
import 'package:ashresume/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/welcome_page": (context) => WelcomePage(),
        "/information": (context) => GoalFormPage(),
        "/category": (context) => CategoryFormApp(),
      },
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
