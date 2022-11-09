
import 'package:flutter/material.dart';

class Fach extends StatelessWidget {
  final bezeichnunginput = TextEditingController();
  late String Bezeichnung = "tessdfsdft";
  late int CountBuchstaben = 0;


  //erstelle eine zwei Dimensinale Liste.
  //1. In jedem index der ersten Liste wird eine 2. Liste erstellt.
  //2. Jeder Index der zweiten Liste wird erstmal mit null Initialisiert
  //3. Rows könnnen nicht wachsen, Columns aber schon!
  var Buchstaben = List.generate(26, (i) => List.generate(1, (j) => null, growable: true),growable: false);

  late Icon Symbol;

  createFachScaffold(){
    Bezeichnung = "Heyo";
    Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Fach tmp = Fach();
                //Hier weiter machen!!!!!!!!
                //tmp.Bezeichnung = bezeichnunginput.text;
                //a.add(tmp);
                //return List.generate(a.length+1, (index) => null);
              },
              child: const Icon(
                Icons.add,
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
  return ;
  }







  @override
  Widget build(BuildContext context){
    return Container(
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
              child: Text(Bezeichnung, style: TextStyle(fontSize: 25, color: Colors.white),)
          ),
          Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 20, bottom: 10),
              child: Text(CountBuchstaben.toString() + " / 26", style: TextStyle(fontSize: 25, color: Colors.white),)
          ),
        ],
      ),
    );
  }
}