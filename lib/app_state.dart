import 'package:netframkollun_flutter/api_client.dart';
import 'package:flutter/material.dart';

import 'models/order.dart';
import 'models/photo.dart';
import 'models/photo_size.dart';

class AppState with ChangeNotifier {
  AppState() {
    createOrderAction();
//    dummyDataAction();
    initializeSizesAction();
  }

  ApiClient apiClient = new ApiClient();

  String _displayText = "asdf";
  List<Photo> _photos = new List();
  Photo _currentPhoto;
  Order _order;
  List<PhotoSize> _sizes;
  List<String> _postCodes = ["600", "601", "603", "606"];
  List<int> _quantities = List.generate(100, (i) => i + 1);

  void createOrderAction() {
    apiClient.createNewOrder().then((order) =>
      _setOrder(order)
    );
  }

  void _setOrder(Order order) {
    _order = order;
    notifyListeners();
  }

  void changeNameAction(String name) {
    _order.name = name;
    notifyListeners();
  }

  void changePostCodeAction(String postCode) {
    _order.postCode = postCode;
    notifyListeners();
  }

  void changePickupAction(bool pickup) {
    print("new pickup value " + pickup.toString());
    _order.pickup = pickup;
    notifyListeners();
  }

  void changePhoneAction(String phone) {
    _order.phone = phone;
    notifyListeners();
  }

  void changeEmailAction(String email) {
    _order.email = email;
    notifyListeners();
  }

  void initializeSizesAction() {
    apiClient.getSizes().then((sizes) =>
        _setSizes(sizes)
    );
    notifyListeners();
  }

  void dummyDataAction() {
    PhotoSize defaultSize = PhotoSize(id: 1, name: "10x15", price: 59);
    for (int i = 1; i < 10; i++) {
      _addPhoto(Photo(size: defaultSize, name: "Test " + i.toString(), quantity: i, url: "https://storage.googleapis.com/boka-tima-images/images/433d6e77-2198-4eaf-afa6-7c51d7f0c9e5.jpeg"));
    }
  }

  void postPhotoAction(String base64Image) {
    print("posting a photo");
    apiClient.createNewPhoto(_order.token, base64Image)
        .then((p) => _addPhoto(p));
  }

  void updatePhotoAction(Photo photo) {
    print("updating a photo");
    apiClient.patchPhoto(_order.token, photo)
        .then((p) => _updatePhoto(p));
  }

  void deletePhotoAction(Photo photo) {
    print("deleting a photo");
    apiClient.deletePhoto(_order.token, photo)
        .then((a) => _removePhoto(photo.id));
  }

  void closePhotoDialogAction() {
    _currentPhoto = null;
    notifyListeners();
  }

  void openPhotoAction(Photo photo) {
    _currentPhoto = Photo.clone(photo);
    notifyListeners();
  }

  void updateCurrentPhotoQuantityAction(int quantity) {
    _currentPhoto.quantity = quantity;
    notifyListeners();
  }

  void updateCurrentPhotoSizeAction(PhotoSize size) {
    _currentPhoto.size = size;
    notifyListeners();
  }

  // Private

  void _addPhoto(Photo photo) {
    _photos.add(photo);
    notifyListeners();
  }

  void _setSizes(List<PhotoSize> sizes) {
    _sizes = sizes;
    notifyListeners();
  }

  void _updatePhoto(Photo photo) {
    Photo photoInState = _photos.firstWhere((p) => p.id == photo.id);
    if (photoInState != null) {
      photoInState.quantity = photo.quantity;
      photoInState.size = photo.size;
      photoInState.name = photo.name;
    }
    _currentPhoto = null;
    notifyListeners();
  }

  void _removePhoto(int photoId) {
    _photos.removeWhere((p) => p.id == photoId);
    _currentPhoto = null;
    notifyListeners();
  }

  String get getDisplayText => _displayText;
  List<Photo> get getPhotos => _photos;
  Photo get getCurrentPhoto => _currentPhoto;
  Order get getOrder => _order;
  List<PhotoSize> get getSizes => _sizes;
  List<int> get getQuantities => _quantities;
  List<String> get getPostCodes => _postCodes;
}
