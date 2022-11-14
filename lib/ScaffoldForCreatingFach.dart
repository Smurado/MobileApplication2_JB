import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldForCreatingFach extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ScaffoldForCreatingFach();
}
//Gibt ein Scaffold zurück welches ermöglicht ein neues Fach anzuglegen
//Aufgefangen von dem oberen Scaffold wird dann die Bezeichnung welche der Benutzer eingegeben hat
class _ScaffoldForCreatingFach extends State<ScaffoldForCreatingFach>{
  //Instanziierung eines Kontrollers um die Texteingabe in einem Textfeld abfangen zu können
  final bezeichnunginput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Die Appbar besteht aus einem Button welcher dazu dient die Eingabe zu speichern und  diesen Wert
          // direkt an das aufrufende Element (Widget) zurückzugeben
          actions: [
            Padding(padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                //onTap funktion wird für das Icon aufgerufen wenn dieses angetippt wird
                onTap: () {
                  //Rückgabe des Inputs des Users mittels des Textes im Kontroller
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
        //alle Objekte sind in eine SafeArea gehüllt damit diese nicht unter die Navbar rutschen können
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //Bezeichnung für den Benutzer
                child: Text("Name der Liste:", style: TextStyle(fontSize: 40,),),

                alignment: Alignment.center,
              ),
              SizedBox(child: TextField(
                style: TextStyle(fontSize: 40),
                //input Kontroller um auf die Eingabe in Textfeld zuzugreifen
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