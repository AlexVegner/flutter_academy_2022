import 'package:edu_models/models/gender.dart';
import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final String firstName;
  final String lastName;
  final Gender? gender;
  User({
    required this.firstName,
    required this.lastName,
    this.gender,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    Gender? gender,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
    );
  }

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        gender = GenderExt.parse(json['gender']);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender?.name,
      };

  @override
  List<Object?> get props => [firstName, lastName, gender];

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is User &&
  //         runtimeType == other.runtimeType &&
  //         firstName == other.firstName &&
  //         lastName == other.lastName &&
  //         gender == other.gender;

  // @override
  // int get hashCode => firstName.hashCode ^ lastName.hashCode ^ gender.hashCode;
}
