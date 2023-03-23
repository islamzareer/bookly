part of 'newset_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailure({required this.errMessage});
}
