import 'package:netframkollun_flutter/models/price_item.dart';

class PhotoOrderPrices{
  List<PriceItem> priceItems;

  static PhotoOrderPrices fromJson(List<Map<String, dynamic>> listOfJson){

    var photoPrices = new PhotoOrderPrices();

    photoPrices.priceItems = new List<PriceItem>();
    
    for(int i = 0; i < listOfJson.length; i++)
      photoPrices.priceItems.add(PriceItem.fromJson(listOfJson[i]));

    return photoPrices;
  }
}