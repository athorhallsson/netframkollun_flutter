import 'package:netframkollun_flutter/models/photo.dart';

class Order {
  String id;
  String token;
  String name;
  String email;
  String address;
  String postCode;
  String comment;
  String phone;
  List<Photo> photos;
  bool pickup = false;

  static Order fromJson(Map<String, dynamic> json){
    Order o = new Order();
    o.id = json["id"];
    o.token = json["token"];
    o.name = json["name"];
    o.email = json["email"];
    o.address = json["address"];
    o.postCode = json["postCode"];
    o.comment = json["comment"];
    o.phone = json["phone"];
    o.pickup = json["pickup"] != null ? json["pickup"] : false;
    return o;
  }
}
