class ProductEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  List<String> images;
  String? thumbnail;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
    this.thumbnail,
  });
}
