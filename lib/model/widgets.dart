import 'package:flutter/material.dart';

import 'constant.dart';

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
