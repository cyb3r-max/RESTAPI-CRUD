import 'package:flutter/material.dart';

class AlertBoxTextStyle extends StatelessWidget {
  String head, text;

  AlertBoxTextStyle({required this.head, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
      Text(
        head,
        style: TextStyle(fontWeight: FontWeight.bold,),
      ),
      Expanded(child: Text(text,style: TextStyle(overflow: TextOverflow.fade),))
        ],
      ),
    );
  }
}
