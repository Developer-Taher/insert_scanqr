import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/HomePage.dart';


// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //  title: 'Navigation Basics',
      home: MyApp(),
    ),
  );
}
