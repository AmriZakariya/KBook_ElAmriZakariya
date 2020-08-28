part of 'books_bloc.dart';

enum BookStatus { initial, success, filtred, failure }

class BooksState extends Equatable {
  const BooksState({
    this.status = BookStatus.initial,
    this.books = const <BookModel>[],
    this.hasReachedMax = false,
    this.favs = const <String>[],
  });

  final BookStatus status;
  final List<BookModel> books;
  final bool hasReachedMax;
  final List<String> favs ;

  BooksState copyWith({
    BookStatus status,
    List<BookModel> books,
    bool hasReachedMax,
    List<String> favs,
  }) {
    return BooksState(
      status: status ?? this.status,
      books: books ?? this.books,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      favs: favs ?? this.favs,
    );
  }

  @override
  List<Object> get props => [status, books, hasReachedMax, favs];
}
