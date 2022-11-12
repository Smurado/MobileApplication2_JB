import 'package:abcliste/ScaffoldForListInFach.dart';
import 'package:flutter/material.dart';

class Fach extends StatelessWidget {
  late String bezeichnung = "tessdfsdft";
  late int countBuchstaben = 0;


  //erstelle eine zwei Dimensinale Liste.
  //1. In jedem index der ersten Liste wird eine 2. Liste erstellt.
  //2. Jeder Index der zweiten Liste wird erstmal mit null Initialisiert
  //3. Rows könnnen nicht wachsen, Columns aber schon!
  //List<List<String?>> buchstaben = List.generate(26, (i) => List.generate(1, (j) => null, growable: true),growable: false);
  List<String> buchstaben = List.generate(26, (i) => "", growable: false);

  late Icon Symbol;

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
        var result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScaffoldForListInFach(list: buchstaben)),
        );
      },
    );

  }
}