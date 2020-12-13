import 'package:flutter/material.dart';

import 'constant.dart';

class AfterColumnData extends StatelessWidget {
  const AfterColumnData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "After",
          style: buildTextStyleforaddressexpantiontile(),
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
    );
  }
}

class BeforeColumnData extends StatelessWidget {
  const BeforeColumnData({
    Key key,
    @required this.lastsumwieght,
    @required this.lastsumnet,
    @required this.lastsumcount,
  }) : super(key: key);

  final double lastsumwieght;
  final double lastsumnet;
  final double lastsumcount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Before",
          style: buildTextStyleforaddressexpantiontile(),
        ),
        Text(
          "$lastsumwieght",
          style: buildTextStylefortextmain(),
        ),
        Text(
          "$lastsumnet",
          style: buildTextStylefortextmain(),
        ),
        Text(
          "$lastsumcount",
          style: buildTextStylefortextmain(),
        ),
      ],
    );
  }
}
// Container callcamscanner() {
//     return Container(
//               child: Expanded(
//                 flex: 3,
//                 child: QRView(
//                   // key: qrkey,
//                   overlay: QrScannerOverlayShape(
//                     borderRadius: 30,
//                     borderColor: Colors.red,
//                     borderLength: 60,
//                     borderWidth: 20,
//                     cutOutSize: 300,
//                   ),
//                   onQRViewCreated: _onQrViewCreated,
//                   key: null,
//                 ),
//               ),
//             );
// }

class AddressMainRow extends StatelessWidget {
  const AddressMainRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class TextFieldForQuantity extends StatelessWidget {
  const TextFieldForQuantity({
    Key key,
    @required this.countcontroller,
  }) : super(key: key);

  final TextEditingController countcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: countcontroller,
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Qty",
        labelStyle: buildTextStylefortextmain(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class TextFieldForNetWeight extends StatelessWidget {
  const TextFieldForNetWeight({
    Key key,
    @required this.netweightcontroller,
  }) : super(key: key);

  final TextEditingController netweightcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: netweightcontroller,
      keyboardType: TextInputType.number,
      cursorColor: Colors.white,
      // autofocus: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Net Wieght",
        labelStyle: buildTextStylefortextmain(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class TextFieldForGoodsWeight extends StatelessWidget {
  const TextFieldForGoodsWeight({
    Key key,
    @required this.goodsweightcontroller,
  }) : super(key: key);

  final TextEditingController goodsweightcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: goodsweightcontroller,
      keyboardType: TextInputType.number,
      // autofocus: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Goods Wieght",
        labelStyle: buildTextStylefortextmain(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ColumnForMAINAddress extends StatelessWidget {
  const ColumnForMAINAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: buildTextStyleforaddressexpantiontile(),
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
    );
  }
}
