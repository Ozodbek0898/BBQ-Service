import 'package:bbq_service/view/enter_page.dart';
import 'package:bbq_service/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),


      )
      ),

      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
