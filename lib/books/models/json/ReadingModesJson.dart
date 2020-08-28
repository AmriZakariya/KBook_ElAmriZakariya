
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ReadingModesJson.g.dart';

@JsonSerializable()
class ReadingModesJson extends Equatable{
  bool text;
  bool image;

  ReadingModesJson({this.text, this.image});


  @override
  List<Object> get props => [this.text, this.image];


  factory ReadingModesJson.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesJsonFromJson(json);
  Map<String, dynamic> toJson() => _$ReadingModesJsonToJson(this);
}
