import 'dart:io';
import 'dart:ui';
import 'package:abcliste/ScaffoldForCreatingFach.dart';
import 'package:abcliste/liste.dart';
import 'package:flutter/cupertino.dart';
import 'package:abcliste/fach.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';



void main() {
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

class _MyHomePageState extends State<MyHomePage> {
  List<Fach> completeListeofFaecher = [Fach()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Übersichtsseite")
        ),
        leading: Icon(Icons.create),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () async {
                String result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScaffoldForCreatingFach()),
                );
                Fach tmp = Fach();
                tmp.bezeichnung = result;
                completeListeofFaecher.add(tmp);
                setState(() {});
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