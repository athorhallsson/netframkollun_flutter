class PriceItem{
  String name;
  int count;
  int price;

  static PriceItem fromJson(Map<String, dynamic> json){
    var priceItem = new PriceItem();
    priceItem.name = json["name"];
    priceItem.count = json["count"];
    priceItem.price = json["price"];
    return priceItem;
  }

}