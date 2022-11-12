import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetForLetters extends StatefulWidget{
  const WidgetForLetters({super.key, this.list, this.index});

  final List<String?>? list;
  final int? index;

  @override
  State<StatefulWidget> createState() => _WidgetForLetters();

}

class _WidgetForLetters extends State<WidgetForLetters>{
  var Buchstaben = List.generate(26, (i) => List.generate(1, (j) => null, growable: true),growable: false);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

          Text(String.fromCharCode(65+index)),
          SizedBox(
            width: 100,
            child: TextField(
            )

        ),

        ]
      ),
    );
  }
}