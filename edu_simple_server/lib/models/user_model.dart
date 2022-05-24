@DaoModel()
class UserDao {
  @Dao(json: 'name', required: true)
  String? name;
}

class DaoModel {
  const DaoModel();
}

class Dao {
  final bool required;
  final String? json;
  const Dao({
    this.required = false,
    this.json,
  });
}
