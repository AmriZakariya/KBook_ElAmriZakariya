import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kbook_elamri_zakariya/books/bloc/books_bloc.dart';
import 'package:kbook_elamri_zakariya/books/books.dart';
import 'package:kbook_elamri_zakariya/books/utils/network_image.dart';

class BookPage extends StatelessWidget {
  final String searshInit = "flutter";
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (_) => BooksBloc()..add(BooksSerchInit(searshInit)),
        child: BooksList(),
      ));
//    return Scaffold(
//      body: BlocProvider(
//        create: (_) => BooksBloc()..add(BooksSerchInit(searshInit)),
//        child: SingleChildScrollView(
//          child: Container(
//            height: MediaQuery.of(context).size.height,
//            width: MediaQuery.of(context).size.width,
//            child: Stack(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.only(top: 145),
//                  height: MediaQuery.of(context).size.height,
//                  width: double.infinity,
//                  child: BooksList(),
//                ),
//                Container(
//                  height: 140,
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                      color: Theme.of(context).primaryColor,
//                      borderRadius:
//                          BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 30),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          "Books",
//                          style: TextStyle(color: Colors.white, fontSize: 24),
//                        ),
//                        IconButton(
//                          onPressed: () {},
//                          icon: Icon(
//                            Icons.filter_list,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  child: Column(
//                    children: <Widget>[
//                      SizedBox(
//                        height: 110,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 20),
//                        child: Material(
//                          elevation: 5.0,
//                          borderRadius: BorderRadius.all(Radius.circular(30)),
//                          child: TextField(
//                            onSubmitted: (query) async {
//                             await  context.bloc<BooksBloc>().add(BooksSerchInit(query));
//
////                              showDialog<void>(
////                                  context: context,
////                                  barrierDismissible: false,
////                                  builder: (BuildContext context) {
////                                    return AlertDialog(
////                                      title: Text("Retry"),
////                                      titlePadding: EdgeInsets.fromLTRB(15, 20, 15, 0),
////                                      content: Column(
////                                        children: <Widget>[
////                                          Text("listError"),
////                                          Text(
////                                            "Do you want to retry?",
////                                            style: Theme.of(context).textTheme.body1,
////                                          ),
////                                        ],
////                                      ),
////                                      contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
////                                      actions: <Widget>[
////                                        FlatButton(
////                                          child: Text("No"),
////                                          onPressed: () {
////                                            Navigator.of(context).pop();
////                                          },
////                                        ),
////                                        FlatButton(
////                                          child: Text("Yes"),
////                                          onPressed: () {
////                                            Navigator.of(context).pop();
////                                          },
////                                        )
////                                      ],
////                                    );
////                                  });
//                            },
//                            cursorColor: Theme.of(context).primaryColor,
//                            controller: _textController,
//                            decoration: InputDecoration(
//                                hintText: "Search Book",
//                                hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
//                                prefixIcon: GestureDetector(
//                                  behavior: HitTestBehavior.translucent,
//                                  onTap: () {
//                                    context.bloc<BooksBloc>().add(BooksSerchInit(_textController.text));
//                                  },
//                                  child: Material(
//                                    elevation: 0.0,
//                                    borderRadius: BorderRadius.all(Radius.circular(30)),
//                                    child: Icon(Icons.search),
//                                  ),
//                                ),
//                                border: InputBorder.none,
//                                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: BlocProvider(
                  create: (_) => BooksBloc()..add(BooksFetched()),
                  child: BooksList(),
                ),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
//                      IconButton(
//                        onPressed: () {},
//                        icon: Icon(
//                          Icons.menu,
//                          color: Colors.white,
//                        ),
//                      ),
                      Text(
                        "Books",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
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
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              hintText: "Search Book",
                              hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
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
      ),
    );
  }
}
