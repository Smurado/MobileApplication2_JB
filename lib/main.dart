import 'dart:async';
import 'dart:convert';
import 'package:abcliste/ScaffoldForCreatingFach.dart';
import 'package:flutter/cupertino.dart';
import 'package:abcliste/fach.dart';
import 'package:flutter/material.dart';
import 'package:abcliste/StorageManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Rootwidget der Andwenung von hier aus werden alle anderen Widgets erstellt
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'ABCListe'),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*
List<Fach> initialize() {
  Fach a = Fach(bezeichnung: "bezeichnung", countBuchstaben: 3, buchstaben: []);
  List<Fach> fakung = [];
  fakung.add(a);

  List<Fach> ausgabe = [];
  StorageManager.readData('faecher'
  ).then((value) {
    ausgabe=(json.decode(value.toString()) as List).map((i) =>
                  Fach.fromJson(i)).toList();
    return ausgabe;
  });
  return ausgabe;
}*/

class _MyHomePageState extends State<MyHomePage>{
  List<Fach> completeListeofFaecher = [];

  //Funktion um die Fächer aus dem Speicher zu laden, sofern diese vorhanden sind.
  void receivefaecher() async {
    //instanziieren einer SharedPreference
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      completeListeofFaecher = (json.decode(sharedPreferences.getString('faecher').toString()) as List).map((i) => Fach.fromJson(i)).toList();
    });
    //aufruf updateList damit ab hier der Timer läuft
    updateList();
  }

  //updateList ist eine Funktion, welche 1 mal pro Sekunde das Array versucht erneut zu schreiben sowie zu löschende Element zu löschen
  void updateList(){
    //Timer definition mit einer Sekunde Intervall
    const oneSec = Duration(seconds:1);
    Timer.periodic(oneSec, (Timer t) {

      //speichern des
      String save = json.encode(completeListeofFaecher);
      StorageManager.saveData('faecher', save);
      for(int i = 0; i < completeListeofFaecher.length; i++){
        if(completeListeofFaecher[i].deleteable == true){
          completeListeofFaecher.removeAt(i);
          setState(() {
          });
        }
      }
    });
  }

  //initState wird aufgerufen bevor das Scaffold gebaut wird.
  //hierbei receivefaecher aufgerufen da auf grundlage dessen das Scaffold befüllt wird
  @override
  void initState() {
    super.initState();
    receivefaecher();
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold welches zurückgegeben wird
    return Scaffold(
      //Appbar diese befindet sich an der oberen Seite des Bildschirms
      //Jedes Element ist hierbei in einen Container gepackt, damit
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          //Text in der Navbar
          child: Text("Übersichtsseite")
        ),
        //Gesture Detecor für das Icon mit dem Stiftsymbol in der Navbar
        leading: GestureDetector(
            onTap: () async{},
            child: Icon(Icons.create)
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            //GestureDetector für das "add" Icon
            child: GestureDetector(
              //onTap funktion wird aufgerufen wenn auf den Gesture Detector getippt wird
              onTap: () async {
                //String result fungiert als Rückgabewerte welcher die Informationen enthält aus dem Scaffold welches aufgerufen wird
                String result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScaffoldForCreatingFach()),
                );
                //mit den gewonnenen Informationen wird ein neues Objekt vom Typ Fach instanziiert.
                Fach tmp = Fach(
                  bezeichnung: result,
                  countBuchstaben: 0,
                  buchstaben: List<String>.generate(26, (i) => ""),
                );
                //das Objekt wird der Liste hinzugefügt und die List anschließend sofort in den Speicher geschrieben
                completeListeofFaecher.add(tmp);
                //umwandlung der Liste in einen Json String
                String save = json.encode(completeListeofFaecher);
                StorageManager.saveData('faecher', save);
                setState(() {
                });
              },
              //hinzufügen Icon
              child: const Icon(
                Icons.add,
                size: 30.0,
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      //Jedes Item ist in einer SafeArea hinterlegt, damit diese nicht unter der Navbar verschwinden können
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: completeListeofFaecher
            )
          ),
        )
        );
  }
}