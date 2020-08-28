import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ItemsJson.dart';

part 'ResponseBooksJson.g.dart';

@JsonSerializable()
class ResponseBooksJson extends Equatable {
  String kind;
  int totalItems;
  List<ItemsJson> items;

  ResponseBooksJson({this.kind, this.totalItems, this.items});

  @override
  List<Object> get props => [this.kind, this.totalItems, this.items];



  factory ResponseBooksJson.fromJson(Map<String, dynamic> json) =>
      _$ResponseBooksJsonFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseBooksJsonToJson(this);
}
