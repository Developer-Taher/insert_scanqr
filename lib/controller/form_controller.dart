import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../model/items_form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxzJi8r7atnDjjmA7SHi1fzfuaA2125_srt9O27r_154QhGUpfu/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      ItemsForm feedbackForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          print(response.body);
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<ItemsForm>> getItemsList() async {
    return await http.get(URL).then((response) {
      var jsonItms = convert.jsonDecode(response.body) as List;
      // Map<String, ItemsForm> myqr = {};

      return jsonItms.map((json) => ItemsForm.fromJson(json)).toList();
    });
  }
}
