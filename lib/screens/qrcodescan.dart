// import 'dart:async';


// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(_MyApp());
// }

// class _MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<_MyApp> {
//   ScanResult scanResult;

//   final _flashOnController = TextEditingController(text: "Flash on");
//   final _flashOffController = TextEditingController(text: "Flash off");
//   final _cancelController = TextEditingController(text: "Cancel");

//   var _aspectTolerance = 0.00;

//   var _selectedCamera = -1;
//   var _useAutoFocus = true;
//   var _autoEnableFlash = false;

//   static final _possibleFormats = BarcodeFormat.values.toList()
//     ..removeWhere((e) => e == BarcodeFormat.unknown);

//   List<BarcodeFormat> selectedFormats = [..._possibleFormats];

//   @override
//   // ignore: type_annotate_public_apis
//   initState() {
//     super.initState();

//     Future.delayed(Duration.zero, () async {
//       // _numberOfCameras = await BarcodeScanner.numberOfCameras;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var contentList = <Widget>[
//       if (scanResult != null)
//         Card(
//           child: Column(
//             children: <Widget>[

//               ListTile(
//                 title: Text("Raw Content"),
//                 subtitle: Text(scanResult.rawContent ?? ""),
//               ),

//             ],
//           ),
//         ),

//     ];

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Barcode Scanner Example'),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.camera),
//               tooltip: "Scan",
//               onPressed: scan,
//             )
//           ],
//         ),
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           children: contentList,
//         ),
//       ),
//     );
//   }

//   Future scan() async {
//     try {
//       var options = ScanOptions(
//         strings: {
//           "cancel": _cancelController.text,
//           "flash_on": _flashOnController.text,
//           "flash_off": _flashOffController.text,
//         },
//         restrictFormat: selectedFormats,
//         useCamera: _selectedCamera,
//         autoEnableFlash: _autoEnableFlash,
//         android: AndroidOptions(
//           aspectTolerance: _aspectTolerance,
//           useAutoFocus: _useAutoFocus,
//         ),
//       );

//       var result = await BarcodeScanner.scan(options: options);

//       setState(() => scanResult = result);
//     } on PlatformException catch (e) {
//       var result = ScanResult(
//         type: ResultType.Error,
//         format: BarcodeFormat.unknown,
//       );

//       if (e.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           result.rawContent = 'The user did not grant the camera permission!';
//         });
//       } else {
//         result.rawContent = 'Unknown error: $e';
//       }
//       setState(() {
//         scanResult = result;
//       });
//     }
//   }
// }
