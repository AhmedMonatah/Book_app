import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {

  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
} 
class HomeLocalDataSourceImplementation implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
  var box=Hive.box<BookEntity>(kfeatherBok);
  return box.values.toList();

  }
  
  @override
  List<BookEntity> fetchNewestBooks() {
  var box=Hive.box<BookEntity>(kfeatherNewBox);
  return box.values.toList();
  }
  
  }