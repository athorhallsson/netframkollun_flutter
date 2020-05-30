import 'package:netframkollun_flutter/models/photo_size.dart';

class Sizes {
  List<PhotoSize> sizes;

  static Sizes fromJson(Map<String, dynamic> json){
    Sizes s = new Sizes();
    Iterable l = json["sizes"];
    s.sizes = l.map((jsonItem) => PhotoSize.fromJson(jsonItem)).toList();
    return s;
  }

  Sizes({this.sizes});
}
