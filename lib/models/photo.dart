import 'package:netframkollun_flutter/models/photo_size.dart';

class Photo {
  int id;
  String name;
  int quantity;
  String url;
  PhotoSize size;

  static Photo fromJson(Map<String, dynamic> json){
    Photo p = new Photo();
    p.id = json["id"];
    p.quantity = json["quantity"];
    p.url = json["url"];
    p.size = PhotoSize.fromJson(json["size"]);
    return p;
  }

  Photo({this.name, this.quantity, this.url, this.size});

  static Photo clone(Photo original) {
    Photo clone = new Photo();
    clone.id = original.id;
    clone.quantity = original.quantity;
    clone.url = original.url;
    clone.size = original.size;
    return clone;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'name': this.name,
      'quantity': this.quantity,
      'url': this.url,
      'size': this.size.toJson()
    };
  }
}
