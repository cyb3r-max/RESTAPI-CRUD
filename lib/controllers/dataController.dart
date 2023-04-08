import 'package:get/get.dart';
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
  Future<ModelData> postData(ModelData modelData)async{
      return APIService().postData(modelData);
  }
  Future<ModelData> putData(ModelData modelData)async{
      return APIService().putData(modelData);
  }
}