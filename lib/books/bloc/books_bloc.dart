import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kbook_elamri_zakariya/books/books.dart';
import 'package:kbook_elamri_zakariya/books/models/BookModel.dart';
import 'package:kbook_elamri_zakariya/books/services/BooksServices.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksState());
  final BooksServices bookServices = new BooksServices();
  String query;

  @override
  Stream<Transition<BooksEvent, BooksState>> transformEvents(
    Stream<BooksEvent> events,
    TransitionFunction<BooksEvent, BooksState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {

    if (event is BooksSerchInit) {
      if(event.query.isNotEmpty){
      this.query = event.query;
      yield state.copyWith(
        status: BookStatus.initial,
        books: [],
        hasReachedMax: false,
        favs: [],
      );
      yield await _mapPostFetchedToState(state);
      }else{
        yield state.copyWith(
          books: [],
        );
      }

    }

    if (event is BooksFetched) {
      yield await _mapPostFetchedToState(state);
    }

    if (event is BookAddToFavoris) {
//      List<String> favs = state.favs.map((e) => e).toList();
      if (state.favs.contains(event.id)) {
        state.favs.remove(event.id);
        state.books.firstWhere((element) => element.id == event.id).isFavori = false ;
      } else {
        state.favs.add(event.id);
        state.books.firstWhere((element) => element.id == event.id).isFavori = true ;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("favs", state.favs);

      yield state.copyWith(
        books: state.books,
        hasReachedMax: false,
        favs: state.favs,
      );
    }

    if (event is BookFilterFavorisOnQuery) {
      if(state.status == BookStatus.filtredSection){
//        List<BookModel> booksFiltred = state.books.where((element) => state.favs.contains(element.id)).map((e) => e).toList() ;
//          yield state.copyWith(
//            status: BookStatus.filtred,
//            books: booksFiltred,
//            hasReachedMax: true,
//          );


        yield state.copyWith(
          status: BookStatus.success,
          hasReachedMax: false,
        );
      }else{
        yield state.copyWith(
          status: BookStatus.filtredSection,
          hasReachedMax: true,
        );
      }
    }
  }

  Future<BooksState> _mapPostFetchedToState(BooksState state) async {
    if (state.hasReachedMax || state.status == BookStatus.filtredSection) return state;
    try {
      if (state.status == BookStatus.initial) {
//        List<String> favs = state.favs.map((e) => e).toList();

        if (state.favs.isEmpty) {
          await SharedPreferences.getInstance().then((prefs) {
            if (prefs.getStringList("favs") != null) {
              state.favs.addAll(prefs.getStringList("favs"));
            }
          });
        }

        final books = await bookServices.getBooks(query, favs: state.favs);
        return state.copyWith(
          status: BookStatus.success,
          books: books,
          hasReachedMax: false,
          favs: state.favs,
        );
      }
      final books = await bookServices.getBooks(query, favs: state.favs, startIndex: state.books.length);
      return books.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: BookStatus.success,
              books: List.of(state.books)..addAll(books),
              hasReachedMax: false,
//              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: BookStatus.failure);
    }
  }
}
