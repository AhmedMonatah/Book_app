import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<failure, List<BookEntity>>> featchFeaturedBooks(
    {int pageNumber=0}
  );

  Future<Either<failure, List<BookEntity>>> featchNewestBooks();
}
