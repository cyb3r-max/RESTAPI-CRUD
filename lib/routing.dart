import 'package:get/get.dart';
import 'package:task2inflack/dependencies/dependencies.dart';
import 'package:task2inflack/screens/homeScreen.dart';

class RouteConstant {
  static const String homeScreen = '/home_screen';
}

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeScreen,
      page: () => HomeScreen(),
      binding: DependencyBinding()),
];
