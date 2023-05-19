import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  
  const FullScreen({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Full Screen')),
        body: SizedBox(
          height:size.width ,
          width: size.height,
          child: Image.network(
            
            image.toString(),fit: BoxFit.contain,)),
      ),
    );
  }
}
