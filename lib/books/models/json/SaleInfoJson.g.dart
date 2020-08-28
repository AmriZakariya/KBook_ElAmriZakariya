// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaleInfoJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoJson _$SaleInfoJsonFromJson(Map<String, dynamic> json) {
  return SaleInfoJson(
    country: json['country'] as String,
    saleability: json['saleability'] as String,
    isEbook: json['isEbook'] as bool,
    buyLink: json['buyLink'] as String,
  );
}

Map<String, dynamic> _$SaleInfoJsonToJson(SaleInfoJson instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleability,
      'isEbook': instance.isEbook,
      'buyLink': instance.buyLink,
    };
