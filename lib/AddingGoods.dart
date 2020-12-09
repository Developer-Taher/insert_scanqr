import 'package:flutter/material.dart';
import 'package:geratefluttergooglesheet/qr_scanner.dart';

import 'model/constant.dart';

class AddingGoods extends StatefulWidget {
  @override
  _AddingGoodsState createState() => _AddingGoodsState();
}

class _AddingGoodsState extends State<AddingGoods> {
  String _goodsweight;
  String _netweight;
  String _count;
  String wieght;
  String net;
  String count;
  // String getwieght;
  final  goodsweightcontroller = new TextEditingController();
  final netweightcontroller = new TextEditingController();
  final countcontroller = new TextEditingController();
  List<int> ltemsweightlist;
  List<int> ltemsnetweightlist;
  List<int> ltemscounttlist;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: mainnebucolor,
          appBar: AppBar(
            backgroundColor: mainnebucolor,
            // backgroundColor: Color.fromRGBO(30, 45, 71, 0),
            title: Text(
              "NE BU",
              style: buildTextStyleforappbar(),
            ),
            centerTitle: true,
            // backgroundColor: ,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Registering Goods",
                  style: buildTextStyleformaintext(),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Manfactor",
                      style: buildTextStylefortextmain(),
                    ),
                    Text(
                      "Gold - New",
                      style: buildTextStylefortextmain(),
                    ),
                    Text(
                      "12-12-2020",
                      style: buildTextStylefortextmain(),
                    ),
                  ],
                ),
                Card(
                  color: mainnebucolor,
                  child: ExpansionTile(
                    // backgroundColor: Colors.red,
                    initiallyExpanded: false,
                    title: Center(
                      child: Text(
                        "Goods Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    leading: Icon(Icons.home),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Details",
                                  style:
                                      buildTextStyleforaddressexpantiontile(),
                                ),
                                Text(
                                  "G.Weight",
                                  style: buildTextStylefortextmain(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Net Weight",
                                  style: buildTextStylefortextmain(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Count",
                                  style: buildTextStylefortextmain(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Before",
                                  style:
                                      buildTextStyleforaddressexpantiontile(),
                                ),
                                Text(
                                  "$wieght",
                                  style: buildTextStylefortextmain(),
                                ),
                                Text(
                                  "$net",
                                  style: buildTextStylefortextmain(),
                                ),
                                Text(
                                  "$count",
                                  style: buildTextStylefortextmain(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "After",
                                  style:
                                      buildTextStyleforaddressexpantiontile(),
                                ),
                                Text(
                                  "111",
                                  style: buildTextStylefortextmain(),
                                ),
                                Text(
                                  "2123",
                                  style: buildTextStylefortextmain(),
                                ),
                                Text(
                                  "123",
                                  style: buildTextStylefortextmain(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: goodsweightcontroller,
                      keyboardType: TextInputType.number,
                      // autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Goods Wieght",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: netweightcontroller,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      // autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Net Wieght",
                        labelStyle: buildTextStylefortextmain(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: countcontroller,
                      keyboardType: TextInputType.number,
                      // autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Qty",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          color: Colors.green,
                          child: Text("AddingGoods"),
                          onPressed: () {
                            // ltemsweightlist.add(wieght as int);
                            // getwieght = goodsweightcontroller.text;
                            setState(() {
                              wieght = goodsweightcontroller.text;
                              net = netweightcontroller.text;
                              count = countcontroller.text;
                              // ltemsweightlist.add(wieght as int);
                              // ltemsnetweightlist.add(net as int);
                              // ltemscounttlist.add(count as int);
                              //List<int> ltemsweightlist;
                              // List<int> ltemsnetweightlist;
                              // List<int> ltemscounttlist;

                              print(wieght);
                              print(net);
                              print(count);
                              // _goodsweight += goodsweightcontroller.text as int;
                              // var valWeight = goodsweightcontroller.text;
                              // ltemsweightlist.add(valWeight as int);
                              // print(valWeight);
                              // var valNetweight = netweightcontroller.text;
                              // ltemsnetweightlist.add(valNetweight as int);
                              // print(valNetweight);
                              // var valCount = countcontroller.text;
                              // ltemscounttlist.add(valCount as int);
                              // print(valCount);
                            });
                          },
                        ),
                        IconButton(
                          // onPressed: () {
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: Text("Scan QR"),
                          //         content: Text("THE CONTENT OF THE ALERT DIALOG"),
                          //         actions: [

                          //         ],
                          //       );
                          //     },
                          //   );
                          // },
                          // child: ,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Qr_Scanner()));
                          },
                          icon: Icon(
                            Icons.qr_code_scanner,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 4,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () {},
            child: Icon(
              Icons.calendar_today,
              size: 30,
              color: mainnebucolor,
            ),
          )
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(
          //     Icons.calendar_today,
          //   ),
          //   // splashColor: Colors.black,
          //   backgroundColor: Colors.yellow,
          //   onPressed: () {},
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //     // borderRadius: BorderRadius.all(
          //     //   // Radius.circular(15),
          //     // ),
          //     side: BorderSide(
          //       color: Colors.black,
          //       width: 5,
          //     ),
          //   ),
          //   // mini: true,
          // ),
          ),
    );
  }
}
