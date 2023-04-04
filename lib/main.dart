import 'package:flutter/material.dart';
import 'package:task2inflack/dependencies/dependencies.dart';
import 'package:task2inflack/routing.dart';
import 'package:task2inflack/screens/homeScreen.dart';
import 'package:get/get.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      initialRoute: RouteConstant.homeScreen,
    );
  }
}
