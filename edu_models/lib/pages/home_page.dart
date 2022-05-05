import 'package:edu_models/models/user.dart';
import 'package:edu_models/service/user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserService userService = UserServiceMock();

  List<User> _list = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final list = await userService.getUserList();
    if (mounted) {
      setState(() {
        _list = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<User> users = Set.from(_list);
    return Scaffold(
      body: Container(
          color: Colors.amber.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...users.map((u) => _buildUser(u)),
            ],
          )),
    );
  }

  Widget _buildUser(User user) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
          leading: const Icon(Icons.abc_outlined),
          title: Text(fullName(user)),
          subtitle: Text(user.gender?.name ?? ''),
        ),
      ),
    );
  }

  String fullName(User user) {
    return '${user.firstName} ${user.lastName}';
  }
}
