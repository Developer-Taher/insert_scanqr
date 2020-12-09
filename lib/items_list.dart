// import 'package:flutter/material.dart';

// import 'controller/form_controller.dart';
// import 'model/items_form.dart';

// class FeedbackListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Items Responses',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ItemsListPage(title: "Responses"));
//   }
// }

// class ItemsListPage extends StatefulWidget {
//   ItemsListPage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _ItemsListPageState createState() => _ItemsListPageState();
// }

// class _ItemsListPageState extends State<ItemsListPage> {
//   // ignore: non_constant_identifier_names
//   List<ItemsForm> Itemsform = List<ItemsForm>();

//   // Method to Submit Feedback and save it in Google Sheets

//   @override
//   void initState() {
//     super.initState();

//     // ignore: non_constant_identifier_names
//     FormController().getItemsList().then((ItemsFORM) {
//       setState(() {
//         this.Itemsform = ItemsFORM;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         itemCount: Itemsform.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Row(
//               children: <Widget>[
//                 Icon(Icons.person),
//                 Expanded(
//                   child: Text(
//                       "${Itemsform[index].Manfactor} (${Itemsform[index].Type})"),
//                 )
//               ],
//             ),
//             subtitle: Row(
//               children: <Widget>[
//                 Icon(Icons.message),
//                 Expanded(
//                   child: Text(Itemsform[index].Ticet),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
