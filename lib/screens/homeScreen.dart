import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2inflack/controllers/dataController.dart';
import 'package:task2inflack/screens/postScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController dataController = Get.put(DataController());

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => dataController.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dataController.dataList.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                           Container(
                             padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                             width: MediaQuery.of(context).size.width-10,
                             child:Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.max,
                               children: [
                                 Text(
                                   dataController.dataList[index].title,
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold, fontSize: 15),
                                 ),
                                 Text(
                                   dataController.dataList[index].body,
                                   style: TextStyle(
                                       fontWeight: FontWeight.normal,
                                       fontSize: 10),
                                 ),
                               ],
                             ),
                           ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,

                              children: [
                                ElevatedButton(
                                  onPressed: () {Get.to(PostScreen(postId: dataController.dataList[index].id, isEdit: true,));},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        2.5,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.black54, fontSize: 20),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.snackbar("Message","Data has been deleted", snackPosition: SnackPosition.BOTTOM, backgroundColor:Colors.indigoAccent.withOpacity(0.5), duration: Duration(seconds: 5));
                                    dataController.deleteData(dataController.dataList[index].id);
                                    print(
                                        "$dataController.dataList[index].id is deleted");

                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ))),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Get.to(PostScreen(isEdit: false, postId: 0)),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
