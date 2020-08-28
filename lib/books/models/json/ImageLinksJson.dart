
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ImageLinksJson.g.dart';

@JsonSerializable()
class ImageLinksJson extends Equatable {
  String smallThumbnail;
  String thumbnail;

  ImageLinksJson({this.smallThumbnail, this.thumbnail});


  @override
  List<Object> get props => [this.smallThumbnail, this.thumbnail];



  factory ImageLinksJson.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksJsonFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksJsonToJson(this);
}
