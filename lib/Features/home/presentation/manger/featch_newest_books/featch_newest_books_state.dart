part of 'featch_newest_books_cubit.dart';

@immutable
abstract class FeatchNewestBooksState {}

class FeatchNewestBooksInitial extends FeatchNewestBooksState {}

class FeatchNewestBooksLoading extends FeatchNewestBooksState {}

class FeatchNewestBooksSuccess extends FeatchNewestBooksState {
  final List<BookEntity> books;
  FeatchNewestBooksSuccess(this.books);
}

class FeatchNewestBooksFailure extends FeatchNewestBooksState {
  final String message;
  FeatchNewestBooksFailure(this.message);
}