import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_models.dart';

class HttpServices {
  final baseUrl = 'https://testcoreapi.onexamination.com/api/';
  final apiKey = '23d37eec-2a9a-4db2-a5b0-6c63e8d56503';
  Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

  Future<dynamic> get(url) async {
    final response =
        http.get(Uri.parse(baseUrl + url), headers: requestHeaders);

    return response;
  }

  Future<String> post(url, body) async {
    var reqParams = jsonEncode(body);
    final response = await http.post(
      Uri.parse(baseUrl + url),
      headers: requestHeaders,
      body: reqParams,
    );
    if (response.statusCode == 200) {
      // ApiResponse data = jsonDecode(response.body);
      // print(data);

      // print(data.status);
      // if (data.status == 401) {
      //   return 'Bad Request ' + data.message;
      // } else if (data.status == 200) {
      //   return 'Success ' + data.message;
      //   ;
      // } else {
      return '';
      // }
    } else {
      throw 'response error';
    }
  }

  Future<dynamic> delete(url) {
    var response = http.delete(Uri.parse(baseUrl + url));
    return response;
  }

  Future<dynamic> pdate(url) {
    var response = http.put(Uri.parse(baseUrl + url));
    return response;
  }
}
