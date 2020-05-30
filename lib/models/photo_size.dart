class PhotoSize {
  int id;
  String name;
  int price;

  static PhotoSize fromJson(Map<String, dynamic> json){
    PhotoSize s = new PhotoSize();
    s.id = json["id"];
    s.name = json["name"];
    s.price = json["price"];
    return s;
  }

  PhotoSize({this.id, this.name, this.price});

  // To make the dummy data work
  bool operator ==(o) => o is PhotoSize && id == o.id;

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price
    };
  }
}
