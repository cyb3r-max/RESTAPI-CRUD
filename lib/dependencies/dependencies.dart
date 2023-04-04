import 'package:get/get.dart';
import '../controller/dataController.dart';

class DependencyBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<DataController>(() => DataController());
  }
}