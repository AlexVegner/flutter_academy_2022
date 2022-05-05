// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map json) => _$_Profile(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: const GenderConverter().fromJson(json['gender'] as String?),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) {
  final val = <String, dynamic>{
    'firstName': instance.firstName,
    'lastName': instance.lastName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gender', const GenderConverter().toJson(instance.gender));
  return val;
}
