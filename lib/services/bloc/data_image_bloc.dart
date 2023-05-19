import 'dart:convert';
import 'dart:developer';
import 'package:flutter_api_calling/core/constant.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_calling/model/imagemodel.dart';

part 'data_image_event.dart';
part 'data_image_state.dart';

class DataImageBloc extends Bloc<DataImageEvent, DataImageState> {
  DataImageBloc() : super(DataImageInitial()) {
    // on<DataImageEvent>((event, emit) {});
    on<FetchImages>((event, emit) async{
       final response = await http.get(Uri.parse('$baseUrl$apiKey&q=${event.searchWord}'));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['hits'] as List<dynamic>;
      final transformed = result.map((e) {
        return ImageModel(largeImageURL: e['largeImageURL']);
      }).toList();
   
         emit(DisplayImages(transformed)) ;
  
      print(transformed.toString());
      log('got data');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load image');
    }
    });
  }
}
