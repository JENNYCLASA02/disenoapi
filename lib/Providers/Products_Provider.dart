class ModelosProducts {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String url;
  final ProductRating rating;

  ModelosProducts(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.url,
    this.rating,
  );
}

class ProductRating {
  final double rate;
  final int count;

  ProductRating({
    required this.rate,
    required this.count,
  });
}
