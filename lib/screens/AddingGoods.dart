import 'package:flutter/material.dart';
import 'package:geratefluttergooglesheet/controller/generalController.dart';
import 'package:geratefluttergooglesheet/model/widgets.dart';

import 'package:get/get.dart';

import '../model/constant.dart';
import 'listviewitemsgood.dart';
import 'qr_scanner.dart';

class AddingGoods extends StatefulWidget {
  @override
  _AddingGoodsState createState() => _AddingGoodsState();
}

// need to pass the count list to another
class _AddingGoodsState extends State<AddingGoods> {
  GeneralController controller = Get.put(GeneralController());
  // var _goodsweight;
  // var _netweight;
  // double _count = 0;
  var sumwieght = 0.0;
  var sumnet = 0.0;
  var sumcount = 0.0;

  // List x = ltemscounttlist;
  getweight() {
    for (var i = 0; i < controller.ltemsweightlist.length; i++) {
      sumwieght = sumwieght + controller.ltemsweightlist[i];
    }
    return sumwieght;
  }

  getnet() {
    for (var i = 0; i < controller.ltemsnetweightlist.length; i++) {
      sumnet = sumnet + controller.ltemsnetweightlist[i];
    }
    return sumnet;
  }

  getCount() {
    for (var i = 0; i < controller.ltemscounttlist.length; i++) {
      sumcount = sumcount + controller.ltemscounttlist[i];
    }
    return sumcount;
  }

  // var x = double.parse(getCount());
  // String getwieght;
  final goodsweightcontroller = new TextEditingController();
  final netweightcontroller = new TextEditingController();
  final countcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.ltemsweightlist.clear();
        controller.ltemsnetweightlist.clear();
        controller.ltemscounttlist.clear();
      },
      child: Scaffold(
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
          child: ListView(
            children: [
              Column(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                ColumnForMAINAddress(),
                                Column(
                                  children: [
                                    Text(
                                      "Before",
                                      style:
                                          buildTextStyleforaddressexpantiontile(),
                                    ),
                                    Text(
                                      "$sumwieght",
                                      style: buildTextStylefortextmain(),
                                    ),
                                    Text(
                                      "$sumnet",
                                      style: buildTextStylefortextmain(),
                                    ),
                                    Text(
                                      "$sumcount",
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
                                      "212",
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldForGoodsWeight(
                          goodsweightcontroller: goodsweightcontroller),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldForNetWeight(
                          netweightcontroller: netweightcontroller),
                      SizedBox(
                        height: 5,
                      ),
                      TextFieldForQuantity(countcontroller: countcontroller),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            color: Colors.green,
                            child: Text("AddingGoods"),
                            onPressed: () {
                              // print(ltemscounttlist);
                              // print(getCount());
                              // getCount();
//                            print(_count.toString());
                              // ltemsweightlist.add(wieght as int);
                              // getwieght = goodsweightcontroller.text;
                              setState(() {
                                sumwieght =
                                    double.parse(goodsweightcontroller.text);
                                sumnet = double.parse(netweightcontroller.text);
                                sumcount = double.parse(countcontroller.text);
                                controller.ltemsweightlist.add(sumwieght);
                                controller.ltemsnetweightlist.add(sumnet);
                                controller.ltemscounttlist.add(sumcount);
                                print(controller.ltemsweightlist);
                                print(getweight());
                                print(controller.ltemsnetweightlist);
                                print(getnet());
                                print(controller.ltemscounttlist);
                                print(getCount());
                                // goodsweightcontroller.text = null;
                                // netweightcontroller.text = null;
                                // getCount();
                                // getCount() {
                                //   for (var i = 0;
                                //       i < ltemscounttlist.length;
                                //       i++) {
                                //     sum = sum + ltemscounttlist[i];
                                //   }
                                //   return sum;
                                // }
                                // for (double i in ltemsweightlist) {
                                //   print(i);
                                // }
//                              print(wieght);
//                              print(net);
//                              print(count);
                              });
                            },
                          ),
                          IconButton(
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
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListItems(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.input,
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
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.yellow,
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => Qr_Scanner()));
        //   },
        //   child: Icon(
        //     Icons.calendar_today,
        //     size: 30,
        //     color: mainnebucolor,
        //   ),
        // )
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
