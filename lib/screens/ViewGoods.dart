import 'package:flutter/material.dart';

class ViewGoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff1E2D47),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E2D47),
          // backgroundColor: Color.fromRGBO(30, 45, 71, 0),
          title: Text(
            "NE BU",
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          // backgroundColor: ,
        ),
        body: Center(
          child: Text("view goods"),
        ),
      ),
    );
  }
}
