
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'IndustryIdentifiersJson.g.dart';

@JsonSerializable()
class IndustryIdentifiersJson extends Equatable{
  String type;
  String identifier;

  IndustryIdentifiersJson({this.type, this.identifier});

  @override
  List<Object> get props => [this.type, this.identifier];



  factory IndustryIdentifiersJson.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersJsonFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryIdentifiersJsonToJson(this);
}
