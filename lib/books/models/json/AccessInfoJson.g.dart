// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccessInfoJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessInfoJson _$AccessInfoJsonFromJson(Map<String, dynamic> json) {
  return AccessInfoJson(
    country: json['country'] as String,
    viewability: json['viewability'] as String,
    embeddable: json['embeddable'] as bool,
    publicDomain: json['publicDomain'] as bool,
    textToSpeechPermission: json['textToSpeechPermission'] as String,
    epub: json['epub'] == null
        ? null
        : EpubJson.fromJson(json['epub'] as Map<String, dynamic>),
    pdf: json['pdf'] == null
        ? null
        : EpubJson.fromJson(json['pdf'] as Map<String, dynamic>),
    webReaderLink: json['webReaderLink'] as String,
    accessViewStatus: json['accessViewStatus'] as String,
    quoteSharingAllowed: json['quoteSharingAllowed'] as bool,
  );
}

Map<String, dynamic> _$AccessInfoJsonToJson(AccessInfoJson instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewability,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epub,
      'pdf': instance.pdf,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };
