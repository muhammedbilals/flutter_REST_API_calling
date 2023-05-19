// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter_api_calling/core/constant.dart';
// import 'package:flutter_api_calling/model/imagemodel.dart';
// import 'package:http/http.dart' as http;

// Future<List<ImageModel>> fetchImage() async {
//   String searchWord = 'bird';
//   final response = await http.get(
//       Uri.parse('$baseUrl$apiKey&q=$searchWord&image_type=photo&pretty=true'));
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     ImageModel imageModel = ImageModel.fromJson(jsonDecode(response.body));
//    final data = parsePersons(response.body);
//     log('got data');

//     return data;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load image');
//   }
// }

// List<ImageModel> parsePersons(String jsonStr) {
//   final parsed = json.decode(jsonStr).cast<Map<String, dynamic>>();
//   return parsed.map<ImageModel>((json) => ImageModel.fromJson(json)).toList();
// }
