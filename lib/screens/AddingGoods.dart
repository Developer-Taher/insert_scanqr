import 'dart:ui';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:geratefluttergooglesheet/controller/generalController.dart';
import 'package:geratefluttergooglesheet/model/widgets.dart';
import 'package:get/get.dart';
import '../model/constant.dart';
import 'listviewitemsgood.dart';

class AddingGoods extends StatefulWidget {
  @override
  _AddingGoodsState createState() => _AddingGoodsState();
}

// need to pass the count list to another
class _AddingGoodsState extends State<AddingGoods> {
  ScanResult result;
  ScanResult scanResult;
  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  // var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList();

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  GeneralController controller = Get.put(GeneralController());
  // GlobalKey qrkey = GlobalKey();

  // var qrtext = " ";
  // QRViewController controllercam;
  var sumwieght = 0.0;
  var sumnet = 0.0;
  var sumcount = 0.0;
  var lastsumwieght = 0.0;
  var lastsumnet = 0.0;
  var lastsumcount = 0.0;
  // var count = 0;

  getweight() {
    for (var i = 0; i < controller.ltemsweightlist.length; i++) {
      print(sumwieght);
      // to do dont forget this is abig problem to ad value twice at the first time for first run and work correctlly after one from next time

      lastsumwieght = sumwieght + controller.ltemsweightlist[i];
      print(sumwieght);
    }
    print(lastsumwieght);
    return lastsumwieght;
  }

  getnet() {
    for (var i = 0; i < controller.ltemsnetweightlist.length; i++) {
      print(sumnet);
      lastsumnet = sumnet + controller.ltemsnetweightlist[i];
      print(sumnet);
    }
    print(lastsumnet);
    return lastsumnet;
  }

  getCount() {
    for (var i = 0; i < controller.ltemscounttlist.length; i++) {
      print(sumcount);
      lastsumcount = sumcount + controller.ltemscounttlist[i];
      print(sumcount);
    }
    print(lastsumcount);
    return lastsumcount;
  }

  // ScanResult(
  //     {ResultType type: ResultType.Barcode,
  //     String result: "Scan Result !!",
  //     BarcodeFormat format: BarcodeFormat.unknown,
  //     String formatNote: ""
  //     });

  @override
  // ignore: type_annotate_public_apis
  initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      // _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  // contentList.addAll(_possibleFormats.map(
  //   (format) => CheckboxListTile(
  //     value: selectedFormats.contains(format),
  //     onChanged: (i) {
  //       setState(() => selectedFormats.contains(format)
  //           ? selectedFormats.remove(format)
  //           : selectedFormats.add(format));
  //     },
  //     title: Text(format.toString()),
  //   ),
  // ));
  Future scan() async {
    try {
      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
// var result = await BarcodeScanner.scan(options: options);
  // Future _scanqrcode() async {
  //   try {
  //     // dont forget to add cast from scan result to string

  //     String qrResult = await BarcodeScanner.scan();
  //     setState(() {
  //       result = qrResult;
  //       print(result);
  //       print(qrResult);
  //     });
  //   } on PlatformException catch (exc) {
  //     if (exc.code == BarcodeScanner.cameraAccessDenied) {
  //       setState(() {
  //         result = "Camera Permistion is Denied !!";
  //         print(result);
  //       });
  //     } else {
  //       setState(() {
  //         result = "Unknown Error g $exc!!";
  //         print(result);
  //       });
  //     }
  //   } on FormatException {
  //     setState(() {
  //       result = "you pressed the back buttom before scaning any thing !!";
  //       print(result);
  //     });
  //   } catch (exc) {
  //     setState(() {
  //       result = "Unknown Error y00000000000000000000000000000000000000 $exc!!";
  //       print(result);
  //     });
  //   }
  // }

  // var x = double.parse(getCount());
  // String getwieght;
  final goodsweightcontroller = new TextEditingController();
  final netweightcontroller = new TextEditingController();
  final countcontroller = new TextEditingController();
  // final QRViewCreatedCallback onQRViewCreated;
  // @override
  // void dispose() {
  //   controllercam?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var contentList = <Widget>[
      if (scanResult != null)
        Card(
          child: Column(
            children: <Widget>[
              // ListTile(
              //   title: Text("Result Type"),
              //   subtitle: Text(scanResult.type?.toString() ?? ""),
              // ),
              ListTile(
                title: Text("QR Data",
                style: buildTextStylefortextmain(),
                ),
                subtitle: Center(child: Text(scanResult.rawContent ?? "")),
              ),
            ],
          ),
        ),
      // ListTile(
      //   title: Text("Camera selection"),
      //   dense: true,
      //   enabled: false,
      // ),
      // RadioListTile(
      //   onChanged: (v) => setState(() => _selectedCamera = -1),
      //   value: -1,
      //   title: Text("Default camera"),
      //   groupValue: _selectedCamera,
      // ),
    ];
    return WillPopScope(
      onWillPop: () async {
        controller.ltemsweightlist.clear();
        controller.ltemsnetweightlist.clear();
        controller.ltemscounttlist.clear();
        Navigator.pop(context);
        return null;
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
                  AddressMainRow(),
                  // Container(
                  //   color: mainnebucolor,
                  //   child: Card(
                  //     child: Padding(padding: const EdgeInsets.all(8.0),

                  //     ),
                  //   ),
                  // ),
                  Card(
                    color: mainnebucolor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        // backgroundColor: Colors.red,
                        initiallyExpanded: true,
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
                                BeforeColumnData(
                                    lastsumwieght: lastsumwieght,
                                    lastsumnet: lastsumnet,
                                    lastsumcount: lastsumcount),
                                AfterColumnData(),
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
                              setState(() {
                                sumwieght =
                                    double.parse(goodsweightcontroller.text);
                                sumnet = double.parse(netweightcontroller.text);
                                sumcount = double.parse(countcontroller.text);

                                controller.ltemsweightlist.add(sumwieght);
                                controller.ltemsnetweightlist.add(sumnet);
                                controller.ltemscounttlist.add(sumcount);

                                getweight();
                                getnet();
                                getCount();
                              });
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Qr_Scanner()));
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
                      // Text(
                      //   "$result",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),contentList
                      // ListView(
                      //   scrollDirection: Axis.vertical,
                      //   shrinkWrap: true,
                      //   children: contentList,
                      // ),
                      // ListTile(
                      //   title: Text("Raw Content"),
                      //   subtitle: Text(scanResult.rawContent ?? ""),
                      // ),
                      // ListTile(
                      //   title: Text("Raw Content"),
                      //   subtitle: Text(scanResult.rawContent ?? ""),
                      // ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: contentList,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // }

        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(
            Icons.qr_code_scanner,
          ),
          onPressed: scan,
          label: Text("Scan"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
