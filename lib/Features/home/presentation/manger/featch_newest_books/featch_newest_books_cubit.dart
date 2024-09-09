import 'package:bloc/bloc.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featch_newest_books_state.dart';

class FeatchNewestBooksCubit extends Cubit<FeatchNewestBooksState> {
  FeatchNewestBooksCubit(this.fetchNewstBooksUseCase) : super(FeatchNewestBooksInitial());
  FetchNewstBooksUseCase fetchNewstBooksUseCase;
  Future<void> featchNewestBooks() async {
    emit(FeatchNewestBooksLoading());
    final result = await fetchNewstBooksUseCase.call();
    result.fold((failure) {
      emit(FeatchNewestBooksFailure(failure.message));
    }, (books) {
      emit(FeatchNewestBooksSuccess(books));
    });
  }
}
