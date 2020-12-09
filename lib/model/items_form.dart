/// FeedbackForm is a data class which stores data fields of Feedback.
class ItemsForm {
  // ignore: non_constant_identifier_names
  String Manfactor;
  // ignore: non_constant_identifier_names
  String Type;
  // ignore: non_constant_identifier_names
  String SupType;
  // ignore: non_constant_identifier_names
  String Wieght;
  // ignore: non_constant_identifier_names
  String Ticet;
  // ignore: non_constant_identifier_names
  String Salary;
  // ignore: non_constant_identifier_names
  String DateGet;
  // ignore: non_constant_identifier_names
  String QR_Code;


  ItemsForm(this.Manfactor, this.Type, this.SupType, this.Wieght, this.Ticet,
      this.Salary, this.DateGet, this.QR_Code);

  factory ItemsForm.fromJson(dynamic json) {
    return ItemsForm(
        "${json['Manfactor']}",
        "${json['Type']}",
        "${json['SupType']}",
        "${json['Wieght']}",
        "${json['Ticet']}",
        "${json['Salary']}",
        "${json['DateGet']}",
        "${json['QR_Code']}"
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'Manfactor': Manfactor,
        'Type': Type,
        'SupType': SupType,
        'Wieght': Wieght,
        'Ticet': Ticet,
        'Salary': Salary,
        'DateGet': DateGet,
        'QR_Code': QR_Code
      };

//
//  String toParams() =>
//      "?name=$name&email=$email&mobileNo=$mobileNo&feedback=$feedback";

  @override
  String toString() {
    return 'ItemsForm(Manfactor: $Manfactor, Type: $Type, SupType: $SupType, Wieght: $Wieght, Ticet: $Ticet, Salary: $Salary, DateGet: $DateGet, QR_Code: $QR_Code)';
  }
}
