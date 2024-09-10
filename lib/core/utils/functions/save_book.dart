  import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookEntity> books,String bookName) {
    var box=Hive.box<BookEntity>(bookName);
    box.addAll(books);
  }