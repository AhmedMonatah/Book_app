import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {

  List<BookEntity> fetchFeaturedBooks({int pageNumber=0});

  List<BookEntity> fetchNewestBooks();
} 
class HomeLocalDataSourceImplementation implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
  int startIndex=pageNumber*20;
  int endIndex=(startIndex+1)*10;
  var box=Hive.box<BookEntity>(kfeatherBok);
  int length=box.values.length;
  if(endIndex>=length|| startIndex>= length){
  return[];
  }
  return box.values.toList().sublist(startIndex, endIndex);

  }
  
  @override
  List<BookEntity> fetchNewestBooks() {
  var box=Hive.box<BookEntity>(kfeatherNewBox);
  return box.values.toList();
  }
  
  }