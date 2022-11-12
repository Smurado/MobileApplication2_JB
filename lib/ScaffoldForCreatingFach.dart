import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldForCreatingFach extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _ScaffoldForCreatingFach();

}
class _ScaffoldForCreatingFach extends State<ScaffoldForCreatingFach>{
  final bezeichnunginput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop( context, bezeichnunginput.text);
                },
                child: const Icon(
                  Icons.save,
                  size: 30.0,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Row(
            children: [
              Container(child: Text("Bezeichnung"),),
              SizedBox(child: TextField(
                //input to receive it later
                controller: bezeichnunginput,
                decoration: const InputDecoration(border: OutlineInputBorder()
                ),
              ),
                width: 300,
              )
            ],
          ),
        )
    );
  }

}