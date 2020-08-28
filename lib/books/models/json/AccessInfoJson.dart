
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'EpubJson.dart';

part 'AccessInfoJson.g.dart';

@JsonSerializable()
class AccessInfoJson extends Equatable {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  EpubJson epub;
  EpubJson pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfoJson(
      {this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed});

  @override
  List<Object> get props => [this.country, this.viewability, this.embeddable, this.publicDomain, this.textToSpeechPermission, this.epub, this.pdf, this.webReaderLink, this.accessViewStatus, this.quoteSharingAllowed];


  factory AccessInfoJson.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoJsonFromJson(json);
  Map<String, dynamic> toJson() => _$AccessInfoJsonToJson(this);

}