import 'package:book_ui/Features/home/domain/entites/book_entity.dart';

abstract class HomeRepo{
 
  Future<List<BookEntity>> featchFeaturedBooks();

  Future<List<BookEntity>> featchNewestBooks(); 

}