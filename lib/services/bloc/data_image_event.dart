part of 'data_image_bloc.dart';

@immutable
abstract class DataImageEvent {}

class FetchImages extends DataImageEvent {
  String searchWord;
  FetchImages(this.searchWord);
}
