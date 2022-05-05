import 'package:edu_models/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    required String firstName,
    required String lastName,
    @GenderConverter() Gender? gender,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

extension ProfileExt on Profile {
  String get fullName => '$firstName $lastName';
}
