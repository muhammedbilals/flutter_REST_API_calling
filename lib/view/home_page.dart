import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_api_calling/core/constant.dart';
import 'package:flutter_api_calling/model/imagemodel.dart';
import 'package:flutter_api_calling/view/full_screen.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController controller = TextEditingController();

  List<ImageModel> images = [];

  void fetchImage(String searchWord) async {
    final response = await http.get(Uri.parse('$baseUrl$apiKey&q=$searchWord'));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['hits'] as List<dynamic>;
      final transformed = result.map((e) {
        return ImageModel(largeImageURL: e['largeImageURL']);
      }).toList();
      setState(() {
        images = transformed;
      });
      print(transformed.toString());
      log('got data');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load image');
    }
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter api'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: size.width * 0.8,
                    child: TextFormField(
                      controller: controller,
                    )),
                ElevatedButton(
                    onPressed: () {
                      fetchImage(controller.text);
                    },
                    child: const Icon(Icons.search)),
              ],
            ),
            controller.text != ''
                ? images.isNotEmpty
                    ? 
                           GridView.builder(
                            
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: images.length,
                            // images.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScreen(
                                              image: images[index]
                                                  .largeImageURL!)));
                                },
                                child: SizedBox(
                                    width: size.width * 0.5,
                                    height: size.width * 0.5,
                                    child: Image.network(
                                        images[index].largeImageURL!)),
                              );
                            },
                          )
                        
                      
                    : const Center(child: CircularProgressIndicator())
                : const Center(child: Text('Search Something'))
          ],
        ),
      ),
    );
  }
}
