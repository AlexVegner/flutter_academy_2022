import 'dart:convert';

import 'package:edu_models/models/profile.dart';
import 'package:edu_models/models/user.dart';

abstract class UserService {
  Future<List<User>> getUserList();
}

class UserServiceMock implements UserService {
  @override
  Future<List<User>> getUserList() async {
    await Future.delayed(const Duration(seconds: 1));
    // final user1 = User(
    //   firstName: 'Ksenia',
    //   lastName: 'Pavlenko',
    //   gender: Gender.female,
    // );
    // final user2 = user1.copyWith(
    //   firstName: 'Svetlana',
    // );
    // final user3 = user1.copyWith(
    //   firstName: 'Igor',
    //   gender: Gender.male,
    // );
    // final user4 = User(
    //   firstName: 'Ksenia',
    //   lastName: 'Pavlenko',
    //   gender: Gender.female,
    // );
    final rawJson = jsonDecode(_mockJson) as List<dynamic>;
    final users = rawJson.map((json) => User.fromJson(json)).toList();
    // final backToJson = jsonEncode(users);

    final pRawJson = jsonDecode(_mockJson) as List<dynamic>;
    final profiles = pRawJson.map((json) => Profile.fromJson(json)).toList();

    final ptest = profiles[0].copyWith(firstName: 'Ira');
    final backToJsonProfile = jsonEncode(profiles);
    print(backToJsonProfile);
    return users;
  }
}

const _mockJson = '''
[
  {
    "firstName": "Ksenia",
    "lastName": "Pavlenko",
    "gender": "female"
  },
  {
    "firstName": "Svetlana",
    "lastName": "Pavlenko",
    "gender": "female"
  },
  {
    "firstName": "Igor",
    "lastName": "Pavlenko",
    "gender": "male"
  },
  {
    "firstName": "Ksenia",
    "lastName": "Pavlenko",
    "gender": "female"
  }
]
''';
