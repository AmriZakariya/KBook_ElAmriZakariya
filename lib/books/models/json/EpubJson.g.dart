// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpubJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpubJson _$EpubJsonFromJson(Map<String, dynamic> json) {
  return EpubJson(
    isAvailable: json['isAvailable'] as bool,
    acsTokenLink: json['acsTokenLink'] as String,
    downloadLink: json['downloadLink'] as String,
  );
}

Map<String, dynamic> _$EpubJsonToJson(EpubJson instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'acsTokenLink': instance.acsTokenLink,
      'downloadLink': instance.downloadLink,
    };
