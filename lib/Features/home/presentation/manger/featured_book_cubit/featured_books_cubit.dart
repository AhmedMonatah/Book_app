import 'package:bloc/bloc.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async{
    emit(FeaturedBooksLoadingState());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailureState(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccessState(books));
    });
    

  }
}
