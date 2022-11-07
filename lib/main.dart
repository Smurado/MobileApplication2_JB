import 'dart:io';
import 'dart:ui';
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
  List<Fach> completeListeofFaecher = [Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach(), Fach()];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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
        /*return Scaffold(
          appBar: CupertinoSliverNavigationBar(

            bottom: CupertinoSliverNavigationBar(
              children: <Widget>[
              FlatButton(
                onPressed: (){

                },
              ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Fach(),
            ],
          ),
       ),*/
  }
}