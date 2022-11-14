import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldForListInFach extends StatefulWidget{
  //Liste von Strings welche zurückgegeben werden soll
  final List<String> list;

  const ScaffoldForListInFach({super.key, required this.list});

  @override
  State<StatefulWidget> createState() => _ScaffoldForListInFach();

}

class _ScaffoldForListInFach extends State<ScaffoldForListInFach>{
  //Instanziierung einer KLontrollerliste welches jedes Element in der Liste abbildet
  //diese Werden benöitgt, um auf die Eingaben im Textfeld zugreifen zu können
  List<TextEditingController> tmp = List.generate(26, (j) => TextEditingController());

  @override

  Widget build(BuildContext context) {
    //aus dem vorangegangenen Widget werden alle vorhandenen Elemente geladen und in anfangs erstelle Liste überführt
    List<String> buchstaben = widget.list;
    for(int i = 0; i < 26; i++){
      tmp[i].text = buchstaben[i];
    }

    return Scaffold(
      //Appbar implementiert einen Speicherbutton welchen gedrücktwerden kann um die Liste an String zurückzugeben.
      appBar: AppBar(
        actions: [
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                for(int i = 0; i < 26; i++){
                  //der Text aus jedem Kontroller wird der Liste an der entsprechenden Stelle (index) hinzugefügt
                  buchstaben[i] = tmp[i].text;
                }
                //Rückgabe der Liste an die vorhergehende Instanz
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
      //ListViewBuilder ist nötig um eine Index zu bekommen für jedes hinzugefüge Element (Textfield)
      //Damit können die Buchstaben später mittels ASCI übersetzung erzeugt werden anhand des Indexes in der Liste
      body: ListView.builder(

        itemCount: 26,
        itemBuilder: (BuildContext context, int index){

          //Jedes Textfeld befindet sich in einer Row
          return Row(
           children: [
             //hier werden die Buchstaben erzeugt anhand ihres Indexes (beginnden bei 0) + dem ASCI-Wert für den Buchstaben A
             //Beispiel: Das dritte Listenelement 'C' muss erzeugt werden anhand des ASCI-Wertes 67
             //65 + 2 = 67 -> Dieser Wert wird anschließend in einen String übersetzt was dann das C ergibt.
             Text(String.fromCharCode(65+index)+"  ",
               style: TextStyle(
                 fontSize: 30
               ),
             ),
             //SizedBox für das Textfeld um dess Größe und Position ändern zu können
             //Der Controller wird benötigt um den Rückgabewert abfangen zu können.
             //Hierbei handelt es sich um eine Controllerliste
             SizedBox(
                 width: 350,
                 child: TextField(
                   controller: tmp[index],
                   style: TextStyle(
                       fontSize: 30
                   ),
                 )
             ),
           ],
          );
          },
      ),
    );
  }
}