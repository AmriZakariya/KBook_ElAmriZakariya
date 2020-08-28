import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'EpubJson.g.dart';

@JsonSerializable()
class EpubJson extends Equatable {
  bool isAvailable;
  String acsTokenLink;
  String downloadLink;

  EpubJson({this.isAvailable, this.acsTokenLink, this.downloadLink});

  @override
  List<Object> get props => [this.isAvailable, this.acsTokenLink, this.downloadLink];


  factory EpubJson.fromJson(Map<String, dynamic> json) =>
      _$EpubJsonFromJson(json);
  Map<String, dynamic> toJson() => _$EpubJsonToJson(this);
}
