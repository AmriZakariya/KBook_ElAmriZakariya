import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbook_elamri_zakariya/books/books.dart';
import 'package:kbook_elamri_zakariya/books/view/book_detail_page.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key key, @required this.book, @required this.bookBloc}) : super(key: key);

  final BookModel book;
  final BooksBloc bookBloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async{
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailPage(
                book: book,
                bookBloc: bookBloc,
              )),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        margin: EdgeInsets.only(bottom: 20.0),
        height: 300,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(book.imageLinks.thumbnail), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(5.0, 5.0), blurRadius: 10.0)]),
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        book.title,
                        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(5.0, 5.0), blurRadius: 10.0)]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
