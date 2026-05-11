class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  final String? category;

  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    this.isFavorite = false,
  });

  factory Product.fromJson(
    Map<String, dynamic> json,
  ) {
    return Product(
      id: int.parse(
        json['id'].toString(),
      ),

      title: json['title'] ?? '',

      description:
          json['description'] ?? '',

      image: json['image'] ?? '',

      category:
          json['category']?.toString(),

      price: double.parse(
        json['price'].toString(),
      ),

      isFavorite: false,
    );
  }
}