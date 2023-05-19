import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_api_calling/services/bloc/data_image_bloc.dart';
import 'package:flutter_api_calling/view/home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataImageBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
