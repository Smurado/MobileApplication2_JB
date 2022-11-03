import 'dart:io';
import 'dart:ui';
import 'package:abcliste/liste.dart';
import 'package:flutter/material.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
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
  final streamUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
              body: Column(
            children: <Widget>[
                  NewGradientAppBar(),
                  Fach()
            ],
          ),
       );
      }

}