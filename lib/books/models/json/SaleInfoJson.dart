
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SaleInfoJson.g.dart';

@JsonSerializable()
class SaleInfoJson extends Equatable {
  String country;
  String saleability;
  bool isEbook;
  String buyLink;

  SaleInfoJson({this.country, this.saleability, this.isEbook, this.buyLink});

  @override
  List<Object> get props => [this.country, this.saleability, this.isEbook, this.buyLink];



  factory SaleInfoJson.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoJsonFromJson(json);
  Map<String, dynamic> toJson() => _$SaleInfoJsonToJson(this);
}

