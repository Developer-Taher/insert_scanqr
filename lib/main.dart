// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geratefluttergooglesheet/qr_scanner.dart';
import 'controller/form_controller.dart';
import 'model/items_form.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
  // runApp(Qr_Scanner());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // ignore: non_constant_identifier_names
  TextEditingController ManfactorController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController TypeController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController SupTypeController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController WieghtController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController TicetController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController SalaryController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController DateGetController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController QR_CodeController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm()  {
    // CollectionReference myItems =
    //     FirebaseFirestore.instance.collection('itemsQr');
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.

      //  myItems
      //     .add({
      //       'Manfactor': ManfactorController.text,
      //       'Type': TypeController.text,
      //       'SupType': SupTypeController.text,
      //       'Wieght': WieghtController.text,
      //       'Ticet': TicetController.text,
      //       'Salary': SalaryController.text,
      //       'DateGet': DateGetController.text,
      //       'QR_Code': QR_CodeController.text
      //     })
      //     .then((value) => print(_showSnackbar("data Add!")))
      //     .catchError((error) => _showSnackbar("Failed to add user: $error"));
      ItemsForm updateItemForm = ItemsForm(
          ManfactorController.text,
          TypeController.text,
          SupTypeController.text,
          WieghtController.text,
          TicetController.text,
          SalaryController.text,
          DateGetController.text,
          QR_CodeController.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Item");

      // Submit 'itemsForm' and save it in Google Sheets.
      formController.submitForm(updateItemForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // items is saved succesfully in Google Sheets.
          _showSnackbar("Items Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // String manfactor;
    // String type;
    // String suptype;
    // String wieght;
    // String ticet;
    // String salary;
    // String dateget;
    // String qrcode;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Add Goads"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: ManfactorController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Manfactor';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Manfactor'),
                        ),
                        TextFormField(
                          controller: TypeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Type';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Type'),
                        ),
                        TextFormField(
                          controller: SupTypeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid SupType';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'SupType',
                          ),
                        ),
                        TextFormField(
                          controller: WieghtController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Wieght';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Wieght'),
                        ),
                        TextFormField(
                          controller: TicetController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Ticet';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Ticet'),
                        ),
                        TextFormField(
                          controller: SalaryController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Salary';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Salary'),
                        ),
                        TextFormField(
                          controller: DateGetController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid DateGet';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'DateGet'),
                        ),
                        TextFormField(
                          controller: QR_CodeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid QR';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'QR'),
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: _submitForm,
                    child: Text('Submit Item'),
                  ),
                  IconButton(
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
              // RaisedButton(
              //   color: Colors.lightBlueAccent,
              //   textColor: Colors.black,
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => FeedbackListScreen(),
              //         ));
              //   },
              //   child: Text('View Feedback'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
