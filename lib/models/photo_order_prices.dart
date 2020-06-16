import 'package:netframkollun_flutter/models/price_item.dart';

class PhotoOrderPrices{
  List<PriceItem> priceItems;

  static PhotoOrderPrices fromJson(Map<String, dynamic> json){
    var photoPrices = new PhotoOrderPrices();
    Iterable l = json["priceItems"];
    photoPrices.priceItems = l.map((jsonItem) => PriceItem.fromJson(jsonItem)).toList();
    return photoPrices;
  }
}