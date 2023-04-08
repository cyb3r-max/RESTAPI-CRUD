import 'package:flutter/material.dart';
import 'package:task2inflack/screens/homeScreen.dart';
import 'package:get/get.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:HomeScreen()
    );
  }
}
