import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:task2inflack/model/modelData.dart';
import '../api/service.dart';

class DataController extends GetxController{
  var isLoading = true.obs;
  var dataList = <ModelData>[].obs;

  @override
  void onInit(){
    getDataList();
    super.onInit();
  }

  void getDataList() async {
    try{
      isLoading(true);
      var data = await APIService.getData();
      if(dataList!=null){
        dataList.assignAll(data);
      }
    }catch(e){}
    finally{
      isLoading(false);
    }
  }
  void deleteData(int id) {
    APIService.deleteData(id);
  }
  Future<String> postData(ModelData modelData)async{
    try{
      return APIService().postData(modelData);
    }catch(e){print(e);}
    return 'true';
  }
  Future<String> putData(ModelData modelData)async{
    try{
      return APIService().putData(modelData);
    }catch(e){print(e);}
    return 'true';
  }
}