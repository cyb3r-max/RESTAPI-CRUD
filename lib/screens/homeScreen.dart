import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task2inflack/controller/dataController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.put(DataController());
  @override
  void initState() {
    super.initState();
    dataController.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() =>ListView.builder(
                itemCount: dataController.modelData!.id!,
                itemBuilder: (context, index) => Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.only(left: 20),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.indigoAccent),
                          child: Text(dataController.modelData!.id!.toString()),
                        )
                      ],
                    ))));
  }
}
