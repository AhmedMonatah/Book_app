
import 'package:book_ui/Features/home/data/models/book_model/book_model.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/core/utils/api_services.dart';

abstract class HomeRemoteDataSource {

  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}
 class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImplementation({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
  var data = await apiService.get(url: 'volumes?q=programming&Filtering=free-ebooks');
  List<BookEntity> books = getBookList(data);
  return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
 
  @override
  Future<List<BookEntity>> fetchNewestBooks() {
   
  }

}