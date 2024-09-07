import 'package:book_ui/Features/home/data/datasource/home_local_data_source.dart';
import 'package:book_ui/Features/home/data/datasource/remote_data_source.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/repos/home_repo.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({required this.homeRemoteDataSource,required this.homeLocalDataSource});
  @override
  Future<Either<failure, List<BookEntity>>> featchFeaturedBooks() async{
  try {
  var booksList=homeLocalDataSource.fetchFeaturedBooks();
  if(booksList.isEmpty){
  return Right(booksList);
  }
  var box =await homeRemoteDataSource.fetchFeaturedBooks();
  return Right(box);
  
  } on Exception catch (e) {
return Left(failure(message: e.toString()));
}

  }

  @override
  Future<Either<failure, List<BookEntity>>> featchNewestBooks() {
    // TODO: implement featchNewestBooks
    throw UnimplementedError();
  }
  
}