import 'package:kbook_elamri_zakariya/books/models/BookModel.dart';
import 'package:kbook_elamri_zakariya/books/models/json/ImageLinksJson.dart';
import 'package:kbook_elamri_zakariya/books/models/json/ResponseBooksJson.dart';

import 'AsyncService.dart';

class BooksServices extends AsyncService {
  Future<List<BookModel>> getBooks(String q,
      {
        List<String> favs = const [],
        int maxResults = 20,
        int startIndex = 0,
        Map<String, dynamic> bodyAdd = const {}}
      ) async {
    List<BookModel> booksList = new List();
    this.logger.d("Service", "************** getBooks  *************** ");
    try {
      Map<String, dynamic> jsonString = await doGet(queryParameters: {
        "q": q,
        "maxResults": maxResults,
        "startIndex": startIndex,
      });

      ResponseBooksJson responseBooksJson = ResponseBooksJson.fromJson(jsonString);

      if (responseBooksJson != null) {
        booksList = responseBooksJson.items
            .map((item) => BookModel(
                  id: item.id,
                  title: item.volumeInfo.title ?? "",
                  authors: item.volumeInfo.authors ?? [],
                  description: item.volumeInfo.description ?? "",
                  buyLink: item.saleInfo.buyLink ?? "",
                  imageLinks: item.volumeInfo.imageLinks ??
                      ImageLinksJson(
                          smallThumbnail:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png",
                          thumbnail:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"),
                  isFavori: favs.contains(item.id) ? true : false,
                ))
            .toList();
      }
    } catch (e) {
      print(e);
    }

    return booksList;
  }
//  Future<ResponseBooksJson> getBooks(String q,{Map<String, dynamic> bodyAdd = const {}}) async {
//    this.logger.v("Service", "************** list  *************** ");
//    Map<String, dynamic> jsonString = await doGet(
//      queryParameters: {
//        "q" : q,
//        "maxResults" : "20",
//        "startIndex" : "0",
//      }
//    );
//    return ResponseBooksJson.fromJson(jsonString);
//  }
//
//  List<BookModel> fetchBooks(ResponseBooksJson responseBooksJson) {
//    if(responseBooksJson != null){
//      return responseBooksJson.items.map((item) => BookModel(
//          id: int.parse(item.id),
//          title: item.volumeInfo.title,
//          authors: item.volumeInfo.authors,
//          description: item.volumeInfo.description,
//          buyLink: item.saleInfo.buyLink ?? "",
//          isFavori: false,
//      )).toList();
//    }
//    return null ;
//  }

}
