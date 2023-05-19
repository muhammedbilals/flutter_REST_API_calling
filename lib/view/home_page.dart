import 'package:flutter/material.dart';
import 'package:flutter_api_calling/services/bloc/data_image_bloc.dart';
import 'package:flutter_api_calling/view/full_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter api'),
      ),
      body: BlocBuilder<DataImageBloc, DataImageState>(
        builder: (context, state) {
           if (state is DataImageInitial) {
          context.read<DataImageBloc>().add(FetchImages(controller.text));
        }
        if(state is DisplayImages){
          return SingleChildScrollView(
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
                          BlocProvider.of<DataImageBloc>(context).add(FetchImages(
                            controller.text
                      ));
                        },
                        child: const Icon(Icons.search)),
                  ],
                ),
                controller.text != ''
                    ? state.images.isNotEmpty
                        ? GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: state.images.length,
                            // images.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScreen(
                                              image: state.images[index]
                                                  .largeImageURL!)));
                                },
                                child: SizedBox(
                                    width: size.width * 0.5,
                                    height: size.width * 0.5,
                                    child: Image.network(
                                        state.images[index].largeImageURL!)),
                              );
                            },
                          )
                        : const Center(child: CircularProgressIndicator())
                    : const Center(child: Text('Search Something'))
              ],
            ),
          );
        }
           return const Center(
          child: Text('Loading'),
        );
        },
      ),
    );
  }
}
