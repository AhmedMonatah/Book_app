class BookEntity {
  final String bookId;
  final String title;
  final String? authorName;
  final String? imageUrl;
  final num? price;
  final num? rating;

  BookEntity(
    {
    required this.bookId,
    required this.price, 
    required this.title,
    required this.authorName,
    required this.imageUrl,
    required this.rating,
  });
}
