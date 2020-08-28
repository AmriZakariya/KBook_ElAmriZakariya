part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BooksSerchInit extends BooksEvent {
  final String query;

  BooksSerchInit(this.query);
}
class BooksFetched extends BooksEvent {}

class BookAddToFavoris extends BooksEvent {
  final String id ;

  BookAddToFavoris(this.id);
}
class BookFilterOnlyFavoris extends BooksEvent {

}
