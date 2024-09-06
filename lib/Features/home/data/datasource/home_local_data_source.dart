import 'package:book_ui/Features/home/domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {

  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
} 
class HomeLocalDataSourceImplementation implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fe
    // tchFeaturedBooks
    throw UnimplementedError();
  }
  
  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
  
  }