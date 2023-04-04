import 'dart:convert';

import 'package:get/get.dart';
import 'package:task2inflack/model/modelData.dart';
import 'package:http/http.dart' as http;
class DataController{
  ModelData? modelData;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    getApi();
  }

  getApi() async{
    try{
      isDataLoading(true);
      http.Response response = await http.get(Uri.tryParse("https://jsonplaceholder.typicode.com/posts")!);
      if(response.statusCode==200){
        var result=jsonDecode(response.body);
        modelData = ModelData.fromJson(result);
      }else{
        print("data isn't loaded");
      }
    }catch(e){
      print(e);
    }finally{
      isDataLoading(false);
    }
  }
}