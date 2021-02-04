
import 'package:json_annotation/json_annotation.dart';

part 'numbersmodel.g.dart';

@JsonSerializable()
class NumbersModel {
  NumbersModel(this.text,this.found,this.number,this.type,this.date,this.year);

  String text;
  bool found;
  double number;
  String type;
  String date;
  String year;

  factory NumbersModel.fromJson(Map<String, dynamic> json) => _$NumbersModelFromJson(json);
  Map<String, dynamic> toJson() => _$NumbersModelToJson(this);
}