import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kbook_elamri_zakariya/books/utils/CustomDioINterceptorLogtMessages.dart';
import 'package:logger/logger.dart';


abstract class AsyncService {
  final String endpoint = "https://www.googleapis.com/books/v1/volumes/";
  final logger = Logger(
    printer: PrettyPrinter(),
  );


  Future<Map<String, dynamic>> doGet({String target = "",Map<String, dynamic> queryParameters = const {}}) async {
    Dio dio = new Dio();

    dio.interceptors.add(CustomDioINterceptorLogtMessages(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      compact: true,
      error: true,
      request: false,
    ));

    try {
      Response response = await dio.get(endpoint+target,
          queryParameters: queryParameters
      );

//      if(res)
//      return response.data ;

      if (response.statusCode == 200) {
        return response.data ;
      }else{
        throw ('error fetching books');
      }


      print(response);
    } on DioError catch(e) {
      if(e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else{
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }

//
//    Response response;
//    try {
//      print("**************doGet***********");
//      Dio dio = new Dio();
//
//      dio.interceptors.add(CustomDioINterceptorLogtMessages(
//        requestHeader: true,
//        requestBody: true,
//        responseBody: true,
//        responseHeader: true,
//        compact: true,
//        error: true,
//        request: true,
//      ));
//      response = await dio.post(endpoint,
//          data: formData,
//          options: Options(
//            sendTimeout: 60 * 1000, // 60 seconds
//            receiveTimeout: 60 * 1000, // 60 seconds
//            contentType: Headers.formUrlEncodedContentType,
//            headers: {
//              "X-Requested-With": "XMLHttpRequest",
//              "crossDomain": true,
//            },
//          ));
//    } on DioError catch (e) {
//      print("**************DioError***********");
//      if (e.response != null) {
//        print("**->REQUEST ${e.response.request.uri}#${Transformer.urlEncodeMap(e.response.request.data)} ");
//      }
//      throw (e);
//    } catch (e) {
//      throw ('API ERROR');
//    }
//
//    if (response != null) {
//      if (response.statusCode == 200) {
//          return response.data;
//        } else {
//          print(
//              'error fetching data WS s azeraze - ${response.data["responseCode"]} - ${response.data["responseDescription"]}');
//          throw ('${response.data["responseDescription"]}');
//        }
//
//      } else {
////      print('error fetching data - ${response.statusCode} - ${response.statusMessage}' );
//        throw ('API ERROR');
//      }
//    }else{
//      throw ('API ERROR');
//    }
  }
}
