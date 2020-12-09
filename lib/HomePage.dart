import 'package:flutter/material.dart';

import 'AddingGoods.dart';
import 'AddingQR.dart';
import 'ViewGoods.dart';
import 'controller/animation.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff1E2D47),
        // backgroundColor: Color.fromRGBO(30, 45, 71, 100),#1E2D47
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaisedButton(
                child: Text(
                  "Adding Goods",
                ),
                onPressed: () {
                  Navigator.of(context).push(SliderRight(page: AddingGoods()));
                },
              ),
              RaisedButton(
                child: Text(
                  "Adding QR",
                ),
                onPressed: () {
                  Navigator.of(context).push(SliderRight(page: AddingQR()));
                },
              ),
              RaisedButton(
                child: Text(
                  "View Goods",
                ),
                onPressed: () {
                  Navigator.of(context).push(SliderRight(page: ViewGoods()));
                },
              ),
              // RaisedButton(
              //   child: Text(
              //     "adding goods",
              //   ),
              //   onPressed: () {},
              // ),
              // RaisedButton(
              //   child: Text(
              //     "adding goods",
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
