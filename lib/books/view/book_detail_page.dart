import 'package:flutter/material.dart';
import 'package:kbook_elamri_zakariya/books/books.dart';
import 'package:kbook_elamri_zakariya/books/utils/network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatefulWidget {
  final BookModel book;
  final BooksBloc bookBloc;

  const BookDetailPage({Key key, @required this.book, @required this.bookBloc}) : super(key: key);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              child: PNetworkImage(
                widget.book.imageLinks.thumbnail,
                fit: BoxFit.cover,
              )),
          SafeArea(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  MaterialButton(
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    textColor: Colors.black,
                    minWidth: 0,
                    height: 40,
                    onPressed: () => Navigator.pop(context),
                  ),
                ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2.8),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  widget.book.title,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28.0),
                                ),
                                trailing: IconButton(
//                                  color: book.isFavori ? Colors.red : Cowlors.white,
                                  icon:
                                  widget.book.isFavori ? Icon(
                                    Icons.favorite,
                                    color: Colors.red ,
                                  ) : Icon(
                                  Icons.favorite_border,
                                  color: Colors.black ,
                                )  ,
                                  onPressed: () async{
                                    await widget.bookBloc.add(BookAddToFavoris(widget.book.id));
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(widget.book.isFavori ?  'Book removed from favorites ' : 'Book added to favorites '),
                                    ));
                                    setState(() {
                                      widget.book.isFavori = !widget.book.isFavori ;
                                    });
                                  },
                                ),
                              ),
                              ExpansionTile(
                                initiallyExpanded: true,
                                title: Text(
                                  "Description",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(widget.book.description),
                                  )
                                ],
                              ),
                              ExpansionTile(
                                initiallyExpanded: true,
                                title: Text(
                                  "Authors",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(widget.book.authors.toString()),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
//                          Container(
//                            color: Colors.transparent,
//                            padding: const EdgeInsets.all(12.0),
////                            decoration: BoxDecoration(
////                              borderRadius: BorderRadius.only(
////                                  topLeft: Radius.circular(20.0),
////                                  topRight: Radius.circular(20.0)),
////                              color: Colors.grey.shade900,
////                            ),
//                            child: RaisedButton(
//                              padding: const EdgeInsets.symmetric(
//                                  vertical: 8.0, horizontal: 16.0),
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.circular(10.0)),
//                              onPressed: () {},
//                              color: Colors.orange,
//                              textColor: Colors.white,
//                              child: Row(
//                                mainAxisSize: MainAxisSize.min,
//                                children: <Widget>[
//                                  Text("Buy link",style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 16.0
//                                  ),),
//                                  const SizedBox(width: 20.0),
//                                  Container(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Icon(
//                                      Icons.arrow_forward_ios,
//                                      color: Colors.orange,
//                                      size: 16.0,
//                                    ),
//                                    decoration: BoxDecoration(
//                                        color: Colors.white,
//                                        borderRadius:
//                                        BorderRadius.circular(10.0)),
//                                  )
//                                ],
//                              ),
//                            ),
//                          )
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      )),
      floatingActionButton: widget.book.buyLink.isNotEmpty
          ? RaisedButton(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: () async {
                if (await canLaunch(widget.book.buyLink)) {
                  await launch(widget.book.buyLink);
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: new Text('Error: ${widget.book.buyLink}'),
                    duration: new Duration(seconds: 10),
                  ));
                }
              },
              color: Colors.orange,
              textColor: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Buy link",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  const SizedBox(width: 20.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orange,
                      size: 16.0,
                    ),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
