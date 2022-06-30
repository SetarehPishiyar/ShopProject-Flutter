class Product {

  String title;
  int price;
  String description;
  String seller;
  String imageURL = "images/noImage.png";
  String category;
  String subCategory;
  List<String> colors;
  List<String> sizes;
  int Count;
  double Rate;
  List<String> Comments;
  bool inBasket = false;
  bool saved = false;

  Product(String title, int price,int count , String description, String seller, List<String> colors, List<String> Sizes, String category, String subCategory, String imageURL){
    this.title = title;
    this.price = price;
    this.Count = count;
    this.description = description;
    this.seller = seller;
    this.colors = colors;
    this.sizes = sizes;
    this.category = category;
    this.subCategory = subCategory;
    this.imageURL = imageURL;
  }
}

enum Category {
  FashionAndClothes,
  BooksAndStationary,
  SportsAndTravel,
  DigitalProducts
}

enum SubCategory {
  Woman,
  Men,
  Kids,
  MobliePhone,
  LapTop,
  Camera,
  Book,
  Stationary,
  Music,
  HandCrafts,
  SportClothes,
  SportEquipments,
  TravelAndCampingEquipments
}
