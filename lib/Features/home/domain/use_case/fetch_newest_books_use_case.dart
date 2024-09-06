import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/repos/home_repo.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FetchNewstBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewstBooksUseCase({required this.homeRepo});

  @override
  Future<Either<failure, List<BookEntity>>> call([NoParam? params]) async {
    return await homeRepo.featchNewestBooks();
  }
}

abstract class UseCase<T, P> {
  Future<Either<failure, T>> call([P params]);
}

class NoParam {}
