import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:kbook_elamri_zakariya/books/models/json/ImageLinksJson.dart';

class BookModel extends Equatable {
  const BookModel({@required this.id, @required this.title, @required this.authors, @required this.description, @required this.buyLink,  @required this.imageLinks, @required this.isFavori = false});

  final String id;
  final String title;
  final List<String> authors;
  final String description;
  final String buyLink;
  final ImageLinksJson imageLinks;
  final bool isFavori;

  @override
  List<Object> get props => [id];
}
