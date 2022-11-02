import 'package:flutter/material.dart';


class liste extends StatefulWidget {
  liste( {Key? key}) : super(key: key);


  String currentTitle = "";

  @override
  State<liste> createState() => _listeState();
}

class _listeState extends State<liste> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomAppBar( //bottom bar with pause and unpause
      ),
    );
  }
}