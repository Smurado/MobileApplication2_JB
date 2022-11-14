import 'package:abcliste/ScaffoldForListInFach.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

List<Fach> welcomeFromJson(String str) => List<Fach>.from(json.decode(str).map((x) => Fach.fromJson(x)));

String welcomeToJson(List<Fach> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fach extends StatelessWidget {

  //defualt konsturktor
  Fach({
    required this.bezeichnung,
    required this.countBuchstaben,
    required this.buchstaben,
  });

  //Properties der Klasse
  late String bezeichnung;
  int countBuchstaben;
  List<String> buchstaben;
  bool deleteable = false;

  //toJson Methode welche das Instanzierte Objekt in ein Json umwandeln kann.
  Map<String, dynamic> toJson(){
    return{
      'bezeichnung': bezeichnung,
      'countBuchstaben': countBuchstaben,
      'buchstaben': buchstaben,
    };
  }

  //fromJson Methode welche es ermöglicht, ein Objekt aus einem Json zu erzeugen.
  factory Fach.fromJson(Map<String, dynamic> json) => Fach(
    bezeichnung: json["bezeichnung"],
    countBuchstaben: json["countBuchstaben"],
    buchstaben: List<String>.from(json["buchstaben"].map((x) => x)),
  );

  @override
  Widget build(BuildContext context){
    //GestureDetector wird zurückgegeben -> liegt als quasi auf jedem Widget in der Liste
    return GestureDetector(
      //Jedes Element in der Liste wird einen Container verpackt da sich dieser besser in seinen Maßen definieren lässt.
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        //Die Elemente innerhalb des Containers sind in einem Stack angeordnet
        child: Stack(
          children: <Widget>[
            //Dieser Container definiert den Hintergrund sowie dessen Abrundung an den Ecken
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
            //Das Icon welches auf dem Widget angezeigt werden soll
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
      //Funktion welche aufgerufen wird, wenn der GestureDetector gedrückt wird.
      onTap: () async {
        List<String> result = await Navigator.push(
          context,
          //Der Propertie Fach werden alle Buchstaben zurückgegeben, welche
          MaterialPageRoute(builder: (context) => ScaffoldForListInFach(list: buchstaben)),
        );
        //
        buchstaben = result;
        int count = 0;
        for(int i = 0; i < 26; i++){
          if(buchstaben[i] != ""){
            count++;
          }
        }
        countBuchstaben = count;
      },
        //Funtion welche aufgerufen wird, wenn der GestureDetector lange gedrückt wird.
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              //gibt ein AlertDialog zurück
              //wird genutzt für die Frage ob ein Fachobjekt gelöscht werden soll
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
      }
    );
  }
}