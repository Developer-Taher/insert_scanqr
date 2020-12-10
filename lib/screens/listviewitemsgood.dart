import 'package:flutter/material.dart';
import 'package:geratefluttergooglesheet/controller/generalController.dart';
import 'package:get/get.dart';

import '../model/constant.dart';

// ignore: must_be_immutable
class ListItems extends StatelessWidget {
  GeneralController controller = Get.put(GeneralController());
  // List value;
  // ListItems(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainnebucolor,
        // backgroundColor: Color.fromRGBO(30, 45, 71, 0),
        // tothis pa
        title: Text(
          "NE BU",
          style: buildTextStyleforappbar(),
        ),
        centerTitle: true,
        // backgroundColor: ,
      ),
      body: ListView.builder(
        itemCount: controller.ltemscounttlist.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    //
                    "${controller.ltemscounttlist[index]}",
                  ),
                ),
              ],
            ),
            // subtitle: Text("${controller.ltemsweightlist[index]}",),
            // subtitle: Row(
            //   children: [
            //     Expanded(
            //       child: Text(
            //           //
            //           //
            //           ),
            //     ),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types

// class ListItems extends StatefulWidget {
//   @override
//   _ListItemsState createState() => _ListItemsState();
// }

// class _ListItemsState extends State<ListItems> {
//   List value;
//   ListItems(this.value);
//   AddingGoods adding = AddingGoods();
//   // List<AddingGoods> itemlist = List<AddingGoods>();
//   @override
//   Widget build(BuildContext context) {

//   }
// }
