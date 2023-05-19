import 'dart:convert';
import 'dart:developer';

import 'package:flutter_api_calling/core/constant.dart';
import 'package:flutter_api_calling/model/imagemodel.dart';
import 'package:http/http.dart' as http;

Future<ImageModel> fetchImage(String searchWord) async {
  final response =
      await http.get(Uri.parse('$baseUrl$apiKey&q$searchWord'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log('got data');

    final responce = ImageModel.fromJson(jsonDecode(response.body));
    print(responce);

    return responce;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load image');
  }
}
