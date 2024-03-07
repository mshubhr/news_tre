import 'dart:convert';
import 'package:http/http.dart' as http;

class WebClient {
  static const ip = "https://newsapi.org/";

  static Future<dynamic> post(url, data) async {
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    // ignore: avoid_print
    print(sendData);

    var body = json.encode(sendData);

    var response = await http.post(
      Uri.parse(ip + url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);

      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var response = await http.get(Uri.parse(ip + url),
        headers: {"Content-Type": "application/json"});

    // ignore: avoid_print

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode.toString());
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}
