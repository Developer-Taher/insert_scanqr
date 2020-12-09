import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'AddingGoods.dart';
import 'controller/animation.dart';


// import 'main.dart';

// ignore: camel_case_types
class Qr_Scanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Qr_ScannerState();
}

// ignore: camel_case_types
class _Qr_ScannerState extends State<Qr_Scanner> {
  GlobalKey qrkey = GlobalKey();

  var qrtext = " ";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: QRView(
                  key: qrkey,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 30,
                    borderColor: Colors.red,
                    borderLength: 60,
                    borderWidth: 20,
                    cutOutSize: 300,
                  ),
                  onQRViewCreated: _onQrViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text("Scan Result: $qrtext"),
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("insert item"),
                  onPressed: () {
                  Navigator.of(context).push(SliderRight(page: AddingGoods()));
                },
                  // onPressed: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) {
                  //     return AddGoogleSheet();
                  //   }));
                  // },
                ),
                // child: Center(
                //   child: Text("complite data item"),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQrViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scandata) {
      setState(() {
        qrtext = scandata;
      });
    });
  }
}
