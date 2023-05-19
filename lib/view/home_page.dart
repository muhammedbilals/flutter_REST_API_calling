import 'package:flutter/material.dart';
import 'package:flutter_api_calling/services/image_services.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController controller = TextEditingController();

  List<dynamic> images = [];
  addImages(String searchWord) async{
    fetchImage(searchWord);
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
                      fetchImage('tree');
                    },
                    child: const Icon(Icons.search)),
              ],
            ),
            FutureBuilder(
              future: fetchImage(controller.text),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: size.width * 0.5,
                      height: size.width * 0.5,
                      // child: Image.network(src)
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
