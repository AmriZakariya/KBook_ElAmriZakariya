
import 'package:equatable/equatable.dart';

import 'AccessInfoJson.dart';
import 'SaleInfoJson.dart';
import 'SearchInfoJson.dart';
import 'VolumeInfoJson.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ItemsJson.g.dart';

@JsonSerializable()
class ItemsJson extends Equatable{
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfoJson volumeInfo;
  SaleInfoJson saleInfo;
  AccessInfoJson accessInfo;
  SearchInfoJson searchInfo;

  ItemsJson(
      {this.kind,
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        this.saleInfo,
        this.accessInfo,
        this.searchInfo});


  @override
  List<Object> get props => [this.kind, this.id, this.etag, this.selfLink, this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo];


  factory ItemsJson.fromJson(Map<String, dynamic> json) =>
      _$ItemsJsonFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsJsonToJson(this);
}
