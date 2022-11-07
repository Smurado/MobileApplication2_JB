import 'package:flutter/material.dart';

class Fach extends StatelessWidget {

  late String Bezeichnung;
  late int CountBuchstaben = 0;

  //erstelle eine zwei Dimensinale Liste.
  //1. In jedem index der ersten Liste wird eine 2. Liste erstellt.
  //2. Jeder Index der zweiten Liste wird erstmal mit null Initialisiert
  //3. Rows könnnen nicht wachsen, Columns aber schon!
  var Buchstaben = List.generate(26, (i) => List.generate(1, (j) => null, growable: true),growable: false);

  late Icon Symbol;


  static Fach createFach(String bezeichnung,  Icon symbol){
    var tmp = Fach();
    tmp.Bezeichnung = bezeichnung;
    tmp.Symbol = symbol;
    return tmp;
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
        ],
      ),
    );
  }
}