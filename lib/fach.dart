
import 'package:abcliste/ScaffoldForListInFach.dart';
import 'package:abcliste/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:abcliste/main.dart';

List<Fach> welcomeFromJson(String str) => List<Fach>.from(json.decode(str).map((x) => Fach.fromJson(x)));

String welcomeToJson(List<Fach> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fach extends StatelessWidget {

  Fach({
    required this.bezeichnung,
    required this.countBuchstaben,
    required this.buchstaben,
  });

  late String bezeichnung;
  int countBuchstaben;
  List<String> buchstaben;
  bool deleteable = false;
  //late Icon symbol;

  Map<String, dynamic> toJson(){
    /*List<String> buchstaben =
    this.buchstaben != null ? this.buchstaben.map((i) => i.toJson()).toList() : null;*/

    return{
      'bezeichnung': bezeichnung,
      'countBuchstaben': countBuchstaben,
      'buchstaben': buchstaben,
    };
  }
  //Fach();



  factory Fach.fromJson(Map<String, dynamic> json) => Fach(
    bezeichnung: json["bezeichnung"],
    countBuchstaben: json["countBuchstaben"],
    buchstaben: List<String>.from(json["buchstaben"].map((x) => x)),
  );

  /*
  factory Fach.fromJson(Map<String, dynamic> parsedjson)
  {
    Fach rueckgabe = Fach();
    rueckgabe.bezeichnung = parsedjson['bezeichnung'] ?? "";
    rueckgabe.countBuchstaben = parsedjson['countBuchstaben'] ?? "";
    rueckgabe.buchstaben = parsedjson['buchstaben'] ?? "";
    return rueckgabe;
  }*/


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 124.0,
              decoration: BoxDecoration(
                color: const Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
            const Icon(Icons.calculate, size: 100, color: Colors.white,),
            Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(right: 20, top: 10),
                child: Text(bezeichnung, style: TextStyle(fontSize: 25, color: Colors.white),)
            ),
            Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 20, bottom: 10),
                child: Text(countBuchstaben.toString() + " / 26", style: TextStyle(fontSize: 25, color: Colors.white),)
            ),
          ],
        ),
      ),
      onTap: () async {
        List<String> result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScaffoldForListInFach(list: buchstaben)),
        );
        buchstaben = result;
        int count = 0;
        for(int i = 0; i < 26; i++){
          if(buchstaben[i] != ""){
            count++;
          }
        }
        countBuchstaben = count;
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("Deleting?"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("YES"),
                    onPressed: () {
                      deleteable = true;
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },

                  )
                ],
              );
            });

        /*CupertinoAlertDialog(
          title: Text("Deleting List?"),
          actions: [
            CupertinoDialogAction(child: Text("yes"), onPressed: (){deleteable = true;}),
            CupertinoDialogAction(child: Text("no"), onPressed: (){}),
          ],
        );*/
      }
    );
  }
}