// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbersmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumbersModel _$NumbersModelFromJson(Map<String, dynamic> json) {
  return NumbersModel(
    json['text'] as String,
    json['found'] as bool,
    (json['number'] as num)?.toDouble(),
    json['type'] as String,
    json['date'] as String,
    json['year'] as String,
  );
}

Map<String, dynamic> _$NumbersModelToJson(NumbersModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'found': instance.found,
      'number': instance.number,
      'type': instance.type,
      'date': instance.date,
      'year': instance.year,
    };
