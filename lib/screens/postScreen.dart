import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2inflack/model/modelData.dart';

import '../controllers/dataController.dart';
class PostScreen extends StatefulWidget {

  PostScreen({required this.isEdit, required this.postId, Key? key}) : super(key: key);
  int postId;
  bool isEdit;
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final DataController dataController = Get.put(DataController());
  var  edtId=TextEditingController();
  var  edtuserId=TextEditingController();
  var  edtTitle=TextEditingController();
  var  edtBody=TextEditingController();

  @override
  void initState(){
    super.initState();
    edtTitle.text=widget.postId==0?'':dataController.dataList[widget.postId].title;
    edtId.text=widget.postId==0?'':dataController.dataList[widget.postId].id.toString();
    edtuserId.text=widget.postId==0?'':dataController.dataList[widget.postId].userId.toString();
    edtBody.text=widget.postId==0?'':dataController.dataList[widget.postId].body;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
        child: Column(
          children: [
            TextFormField(
              controller: edtId,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hintText: 'Enter Id',
              labelText: 'Id'
            ),),
            TextFormField(
             controller: edtuserId,
              keyboardType: TextInputType.number,
            decoration: InputDecoration(

                hintText:'Enter User Id',
                labelText: 'User Id'
            ),),
            TextFormField(
              controller: edtTitle,
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                hintText: widget.postId==0?'Enter title':dataController.dataList[widget.postId].title,
                labelText: 'Title',

            ),),
            TextFormField(
             controller: edtBody,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Body'
            ),),
            SizedBox(height:20),
            ElevatedButton(onPressed: (){
              ModelData modelData= ModelData(userId: int.parse(edtuserId.text), id: int.parse(edtId.text), title: edtTitle.text, body: edtBody.text);
              widget.postId==0?showPostResponse(modelData):showEditResponse(modelData);
              Get.snackbar('title', edtTitle.text.trim());
            }, child: Text("Submit"))
          ],
        ),
      )
    );
  }

  showPostResponse(ModelData modelData) async{
    var response = await dataController.postData(modelData);
    print(response);
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Post Created'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(response)
          ],
        ),
      );
    });
  }

  showEditResponse(ModelData modelData) async{
    var response = await dataController.putData(modelData);
    print(response);
    showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text('Post Edited'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(response)
          ],
        ),
      );
    });
  }
}
