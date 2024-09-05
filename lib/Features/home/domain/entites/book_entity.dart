class BookEntity{
  final String title;
  final String author;
  final String imageUrl;
  final num price;
  final num rating;

  BookEntity(this.price, {
    required this.title,
    required this.author, 
    required this.imageUrl,
    required this.rating,
  });
}