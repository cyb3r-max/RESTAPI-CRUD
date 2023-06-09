import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task2inflack/model/modelData.dart';
String baseUrl="https://jsonplaceholder.typicode.com/posts/";

class  APIService{
  static var client = http.Client();
  var dataList=<ModelData>[].obs;
  static Future<List<ModelData>> getData() async{
    var response = await client.get(Uri.parse(baseUrl));
    try{
      if(response.statusCode==200){
        return ModelDataFromJson(response.body).toList();
      }
      else{
        print("error");
      }
    }catch(e){print(e);}
    return [];
  }
  static Future<void> deleteData(int id) async{
    try{
      http.Response response = await http.delete(Uri.parse("$baseUrl$id"));
      if(response.statusCode==200){
        print("Deleted $id");
      }
      else{
        print("try again");
    }

    }catch(e){};
  }
  @override
  Future<ModelData> postData(ModelData modelData) async{
    final bodyContent= jsonEncode({
      'userId':modelData.userId,
      'title':modelData.title,
      'body':modelData.body
    });
    try{
      final http.Response response= await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-Type':'application/json; charset=UTF-8'
          },
          body: bodyContent);

      if(response.statusCode==201){
        var postResponse= ModelData.fromJson(jsonDecode(response.body));
        ModelData responsedData = ModelData(userId: postResponse.userId, id: postResponse.id, title: postResponse.title, body: postResponse.body);
        print(response.body);
        return responsedData;
      }else{
        throw Exception('Failed to post');
      }
    }catch(e){print(e);}
    return modelData;
  }
  Future<ModelData> putData(ModelData modelData) async{
    final bodyContent= jsonEncode({
      'id':modelData.id,
      'userId':modelData.userId,
      'title':modelData.title,
      'body':modelData.body
    });
    var api=baseUrl+modelData.id.toString();
    print(api);
    try{
      final http.Response response= await http.put(Uri.parse(api),
          headers: {
            'Content-Type':'application/json; charset=UTF-8'
          },
          body: bodyContent);

      if(response.statusCode==200){
        var updateResponse= ModelData.fromJson(jsonDecode(response.body));
        ModelData responsedData = ModelData(userId: updateResponse.userId, id: updateResponse.id, title: updateResponse.title, body: updateResponse.body);

        print(response.body);

        return responsedData;
      }else{
        throw Exception('Failed to edit');
      }
    }catch(e){print(e);}
    return modelData;
  }
}