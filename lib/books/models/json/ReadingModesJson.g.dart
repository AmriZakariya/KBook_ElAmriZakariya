// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReadingModesJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModesJson _$ReadingModesJsonFromJson(Map<String, dynamic> json) {
  return ReadingModesJson(
    text: json['text'] as bool,
    image: json['image'] as bool,
  );
}

Map<String, dynamic> _$ReadingModesJsonToJson(ReadingModesJson instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };
