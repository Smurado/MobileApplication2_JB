import 'package:flutter/material.dart';

class Fach extends StatelessWidget {
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