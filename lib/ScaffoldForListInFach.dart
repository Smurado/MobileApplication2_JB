import 'package:abcliste/WidgetForLetters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldForListInFach extends StatefulWidget{
  final List<String> list;

  const ScaffoldForListInFach({super.key, required this.list});

  @override
  State<StatefulWidget> createState() => _ScaffoldForListInFach();

}

class _ScaffoldForListInFach extends State<ScaffoldForListInFach>{
  List<TextEditingController?> tmp = List.generate(26, (j) => null);

  @override
  Widget build(BuildContext context) {
    List<String> buchstaben = widget.list;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {

                Navigator.pop( context, buchstaben);
            },
            child: const Icon(
              Icons.save,
              size: 30.0,
            ),
          ),
        )
        ],
      ),
      body: ListView.builder(

        itemCount: 26,
        itemBuilder: (BuildContext context, int index){

            //hier return von dem Widget
          return Row(
           children: [
             Text(String.fromCharCode(65+index)+"  ",
               style: TextStyle(
                 fontSize: 30
               ),
             ),

             SizedBox(
                 width: 350,
                 child: TextField(
                   style: TextStyle(
                       fontSize: 30
                   ),
                 )
             ),

           ],
          );
            //return WidgetForLetters(index: index,);
          },
      ),
    );
  }
}