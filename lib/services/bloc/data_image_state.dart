part of 'data_image_bloc.dart';

@immutable
abstract class DataImageState {}

class DataImageInitial extends DataImageState {
  DataImageInitial();
}

class DisplayImages extends DataImageState {
  final List<ImageModel> images;
  DisplayImages(this.images);
}
