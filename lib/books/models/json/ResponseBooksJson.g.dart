// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseBooksJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBooksJson _$ResponseBooksJsonFromJson(Map<String, dynamic> json) {
  return ResponseBooksJson(
    kind: json['kind'] as String,
    totalItems: json['totalItems'] as int,
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ItemsJson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseBooksJsonToJson(ResponseBooksJson instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
