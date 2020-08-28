
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PanelizationSummaryJson.g.dart';

@JsonSerializable()
class PanelizationSummaryJson extends Equatable{
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummaryJson({this.containsEpubBubbles, this.containsImageBubbles});

  @override
  List<Object> get props => [this.containsEpubBubbles, this.containsImageBubbles];

  factory PanelizationSummaryJson.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryJsonFromJson(json);
  Map<String, dynamic> toJson() => _$PanelizationSummaryJsonToJson(this);
}
