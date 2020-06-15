import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/order.dart';
import 'models/photo.dart';
import 'models/photo_size.dart';
import 'models/sizes.dart';

class ApiClient {

  String baseUrl = 'http://localhost:8080';
 // String baseUrl = 'https://named-idiom-277810.appspot.com';

  Future<Order> createNewOrder() async {
    var url = baseUrl + "/api/v1/photoorders";
    var response = await http.post(url, body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Order order = Order.fromJson(json.decode(response.body));

    return order;
  }

  Future<List<PhotoSize>> getSizes() async {
    try {
      var url = baseUrl + "/api/v1/photosizes";
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Sizes sizes = Sizes.fromJson(json.decode(response.body));

      return sizes.sizes;
    } catch (e) {
      print("Failed to get sizes");
      print(e);
      throw e;
    }
  }

  Future<Photo> createNewPhoto(String orderToken, String base64String) async {
    try {
  //    print(base64String);
      var url = baseUrl + "/api/v1/photoorders/" + orderToken + "/items";
      var response = await http.post(url, body: json.encode({ "content": base64String }), headers: { "Content-Type": "application/json" });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Photo photo = Photo.fromJson(json.decode(response.body));
      print(photo);
      return photo;
    } catch (e) {
      print("Failed to create new photo");
      print(e);
      throw e;
    }
  }

  Future<Photo> patchPhoto(String orderToken, Photo p) async {
    try {
      var url = baseUrl + "/api/v1/photoorders/" + orderToken + "/items/" + p.id.toString();
      var response = await http.patch(url, body: json.encode(p), headers: { "Content-Type": "application/json" });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Photo photo = Photo.fromJson(json.decode(response.body));
      return photo;
    } catch (e) {
      print("Failed to update photo");
      print(e);
      throw e;
    }
  }

  Future<String> deletePhoto(String orderToken, Photo p) async {
    try {
      var url = baseUrl + "/api/v1/photoorders/" + orderToken + "/items/" + p.id.toString();
      var response = await http.delete(url, headers: { "Content-Type": "application/json" });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return "OK";
    } catch (e) {
      print("Failed to delete photo");
      print(e);
      throw e;
    }
  }
}
