
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SearchInfoJson.g.dart';

@JsonSerializable()
class SearchInfoJson extends Equatable {
  String textSnippet;

  SearchInfoJson({this.textSnippet});

  @override
  List<Object> get props => [this.textSnippet];



  factory SearchInfoJson.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoJsonFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInfoJsonToJson(this);
}