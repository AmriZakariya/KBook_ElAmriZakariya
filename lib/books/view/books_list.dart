import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbook_elamri_zakariya/books/bloc/books_bloc.dart';
import 'package:kbook_elamri_zakariya/books/bloc/books_bloc.dart';
import 'package:kbook_elamri_zakariya/books/books.dart';
import 'package:kbook_elamri_zakariya/books/view/book_detail_page.dart';
import 'package:kbook_elamri_zakariya/books/widgets/books_list_item.dart';
import 'package:kbook_elamri_zakariya/books/widgets/bottom_loader.dart';

class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final _scrollController = ScrollController();
  final String searshInit = "flutter";
  final TextEditingController _textController = TextEditingController();

  BooksBloc bookBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    bookBloc = context.bloc<BooksBloc>();
    _textController.text = "flutter";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksBloc, BooksState>(
      listener: (context, state) {
        if (!state.hasReachedMax && _isBottom) {
          bookBloc.add(BooksFetched());
        }
        if (state.status == BookStatus.initial  ) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Display search result for query = ${_textController.text}'),
            duration: const Duration(seconds: 3),
          ));
        }
        if (state.status == BookStatus.filtredSection) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Show favorites books'),
            duration: const Duration(seconds: 3),
          ));
        }
//        if (state.status == BookStatus.filtredAllBooks) {
//          Scaffold.of(context).showSnackBar(SnackBar(
//            content: Text('Show favorites books'),
//            duration: const Duration(seconds: 3),
//          ));
//        }
      },
      builder: (context, state) {
        List<BookModel> bookList = state.status == BookStatus.filtredSection
            ? state.books.where((element) => state.favs.contains(element.id)).map((e) => e).toList()
            : state.books;
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                if (state.status == BookStatus.failure)
                  const Center(child: Text('failed to fetch books'))
                else if (state.status == BookStatus.success || state.status == BookStatus.filtredSection)
                  if (bookList.isEmpty)
                    const Center(child: Text('no books'))
                  else
                    Container(
                      padding: EdgeInsets.only(top: 145),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return index >= bookList.length
                                ? BottomLoader()
                                : PostListItem(
                                    book: bookList[index],
                                    bookBloc: bookBloc,
                                  );
                          },
                          itemCount: state.hasReachedMax ? bookList.length : bookList.length + 1,
                          controller: _scrollController,
                        ),
                      ),
                    )
                else
                  const Center(child: CircularProgressIndicator()),
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "KBook EL AMRI ZAKARIYA",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Spacer(),
//                        IconButton(
//                          tooltip: "show all favorites books",
//                          onPressed: () {
//                            bookBloc.add((BookFilterFavorisOnQuery()));
//                          },
//                          icon: Icon(
//                            Icons.favorite,
//                            color: Colors.white,
//                          ),
//                        ),
                        IconButton(
                          tooltip: "Filter favorites books in this query",
                          onPressed: () {
                            bookBloc.add((BookFilterFavorisOnQuery()));
                          },
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            onSubmitted: (query) async {
                              await bookBloc.add(BooksSerchInit(query));

//                              showDialog<void>(
//                                  context: context,
//                                  barrierDismissible: false,
//                                  builder: (BuildContext context) {
//                                    return AlertDialog(
//                                      title: Text("Retry"),
//                                      titlePadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
//                                      content: Column(
//                                        children: <Widget>[
//                                          Text("listError"),
//                                          Text(
//                                            "Do you want to retry?",
//                                            style: Theme.of(context).textTheme.body1,
//                                          ),
//                                        ],
//                                      ),
//                                      contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
//                                      actions: <Widget>[
//                                        FlatButton(
//                                          child: Text("No"),
//                                          onPressed: () {
//                                            Navigator.of(context).pop();
//                                          },
//                                        ),
//                                        FlatButton(
//                                          child: Text("Yes"),
//                                          onPressed: () {
//                                            Navigator.of(context).pop();
//                                          },
//                                        )
//                                      ],
//                                    );
//                                  });
                            },
                            cursorColor: Theme.of(context).primaryColor,
                            controller: _textController,
                            decoration: InputDecoration(
                                hintText: "Search Book",
                                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                                prefixIcon: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    bookBloc.add(BooksSerchInit(_textController.text));
                                  },
                                  child: Material(
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    child: Icon(Icons.search),
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) bookBloc.add(BooksFetched());
  }

  bool get _isBottom {
    if (_scrollController.positions.length > 0) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      return currentScroll >= (maxScroll * 0.9);
    }
    return false;
  }
}
