import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/repos/home_repo.dart';
import 'package:book_ui/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<failure, List<BookEntity>>> call([int params=0]) async {
    return await homeRepo.featchFeaturedBooks(
      pageNumber: params
    );
  }
}

abstract class UseCase<T, P> {
  Future<Either<failure, T>> call([P params]);
}

