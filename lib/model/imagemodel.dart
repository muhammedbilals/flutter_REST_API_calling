class ImageModel {
  // int? id;

  String? largeImageURL;


  ImageModel(
      {
        // this.id,

     required this.largeImageURL,
});

  ImageModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];

    largeImageURL = json['largeImageURL'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;

    data['largeImageURL'] = this.largeImageURL;

    return data;
  }
}