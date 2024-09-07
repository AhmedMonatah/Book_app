import 'package:book_ui/Features/home/data/datasource/home_local_data_source.dart';
import 'package:book_ui/Features/home/data/datasource/remote_data_source.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/repos/home_repo.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
   
if (e is DioException) {
  return Left(ServerFailure.fromDiorError(e));
}else{
  return Left(ServerFailure(message: e.toString()));
}
}

  }

  @override
  Future<Either<failure, List<BookEntity>>> featchNewestBooks()async {
try {
  var booksList=homeLocalDataSource.fetchNewestBooks();
  if(booksList.isEmpty){
  return Right(booksList);
  }
  var box =await homeRemoteDataSource.fetchNewestBooks();
  return Right(box);
  } on Exception catch (e) {
   
if (e is DioException) {
  return Left(ServerFailure.fromDiorError(e));
}else{
  return Left(ServerFailure(message: e.toString()));
}
}

  }
  
}