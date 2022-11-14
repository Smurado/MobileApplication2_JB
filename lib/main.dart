import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'package:abcliste/ScaffoldForCreatingFach.dart';
import 'package:abcliste/liste.dart';
import 'package:flutter/cupertino.dart';
import 'package:abcliste/fach.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:abcliste/StorageManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

List<Fach> initialize() {

  Fach a = Fach(bezeichnung: "bezeichnung", countBuchstaben: 3, buchstaben: []);
  List<Fach> fakung = [];
  fakung.add(a);

  List<Fach> ausgabe = [];
  StorageManager.readData('faecher'
  ).then((value) {
    ausgabe=(json.decode(value.toString()) as List).map((i) =>
                  Fach.fromJson(i)).toList();
    print("I"+ausgabe.toString());
    print("V"+value.toString());
    return ausgabe;
  });
  return ausgabe;
}

class _MyHomePageState extends State<MyHomePage>{
  List<Fach> completeListeofFaecher = [];

  void lel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){

    completeListeofFaecher = (json.decode(sharedPreferences.getString('faecher').toString()) as List).map((i) => Fach.fromJson(i)).toList();
    });
    updateList();
  }

  void updateList(){
    const oneSec = Duration(seconds:1);
    Timer.periodic(oneSec, (Timer t) {
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

  @override
  void initState() {
    super.initState();
    lel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Übersichtsseite")
        ),
        leading: GestureDetector(
            onTap: () async{

            },
            child: Icon(Icons.create)

        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () async {
                String result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScaffoldForCreatingFach()),
                );
                Fach tmp = Fach(
                  bezeichnung: result,
                  countBuchstaben: 0,
                  buchstaben: List<String>.generate(26, (i) => ""),
                );
                completeListeofFaecher.add(tmp);
                String save = json.encode(completeListeofFaecher);
                StorageManager.saveData('faecher', save);
                //print(completeListeofFaecher.toString());
                setState(() {
                });
              },
              child: const Icon(
                Icons.add,
                size: 30.0,
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
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