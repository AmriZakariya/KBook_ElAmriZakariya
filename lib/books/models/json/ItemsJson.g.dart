// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemsJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsJson _$ItemsJsonFromJson(Map<String, dynamic> json) {
  return ItemsJson(
    kind: json['kind'] as String,
    id: json['id'] as String,
    etag: json['etag'] as String,
    selfLink: json['selfLink'] as String,
    volumeInfo: json['volumeInfo'] == null
        ? null
        : VolumeInfoJson.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo: json['saleInfo'] == null
        ? null
        : SaleInfoJson.fromJson(json['saleInfo'] as Map<String, dynamic>),
    accessInfo: json['accessInfo'] == null
        ? null
        : AccessInfoJson.fromJson(json['accessInfo'] as Map<String, dynamic>),
    searchInfo: json['searchInfo'] == null
        ? null
        : SearchInfoJson.fromJson(json['searchInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemsJsonToJson(ItemsJson instance) => <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };
