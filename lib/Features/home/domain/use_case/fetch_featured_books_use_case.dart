

import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/repos/home_repo.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  Future<Either<failure,List<BookEntity>>> featchFeaturedBooks(){
    return  homeRepo.featchFeaturedBooks();
  } 

}