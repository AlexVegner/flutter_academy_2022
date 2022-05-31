import 'package:freezed_annotation/freezed_annotation.dart';

enum Gender { male, female }

extension GenderExt on Gender {
  static Gender? parse(String? value) {
    switch (value) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return null;
    }
  }
}

class GenderConverter implements JsonConverter<Gender?, String?> {
  const GenderConverter();

  @override
  Gender? fromJson(String? v) {
    if (v == null) {
      return null;
    }
    for (var value in Gender.values) {
      if (value.toString().split('.').last == v) {
        return value;
      }
    }
    return null;
  }

  @override
  String? toJson(Gender? v) => v?.toString().split('.').last;
}
