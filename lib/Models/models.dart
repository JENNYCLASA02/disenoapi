class ModelosProducts {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRating rating;

  ModelosProducts({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class ProductRating {
  final double rate;
  final int count;

  ProductRating({
    required this.rate,
    required this.count,
  });
}
