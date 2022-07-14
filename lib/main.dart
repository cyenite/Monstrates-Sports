import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostrates_sports/constants/style.dart';
import 'package:mostrates_sports/controllers/selection_controller.dart';
import 'package:mostrates_sports/pages/home_page.dart';

void main() {
  Get.put(SelectionController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mostrates Sports',
      theme: ThemeData(
          primaryColor: appColor,
          appBarTheme: const AppBarTheme(color: appColor)),
      home: const HomePage(),
    );
  }
}
