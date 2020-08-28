
import 'package:equatable/equatable.dart';

import 'ImageLinksJson.dart';
import 'IndustryIdentifiersJson.dart';
import 'PanelizationSummaryJson.dart';
import 'ReadingModesJson.dart';

import 'package:json_annotation/json_annotation.dart';

part 'VolumeInfoJson.g.dart';

@JsonSerializable()
class VolumeInfoJson extends Equatable {
  String title;
  List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  List<IndustryIdentifiersJson> industryIdentifiers;
  ReadingModesJson readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummaryJson panelizationSummary;
  ImageLinksJson imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  double averageRating;
  int ratingsCount;
  String subtitle;

  VolumeInfoJson(
      {this.title,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.description,
        this.industryIdentifiers,
        this.readingModes,
        this.pageCount,
        this.printType,
        this.categories,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
        this.averageRating,
        this.ratingsCount,
        this.subtitle});

  @override
  List<Object> get props => [this.title, this.authors, this.publisher, this.publishedDate, this.description, this.industryIdentifiers, this.readingModes, this.pageCount, this.printType, this.categories, this.maturityRating, this.allowAnonLogging, this.contentVersion, this.panelizationSummary, this.imageLinks, this.language, this.previewLink, this.infoLink, this.canonicalVolumeLink, this.averageRating, this.ratingsCount, this.subtitle];



  factory VolumeInfoJson.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoJsonFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoJsonToJson(this);
}
