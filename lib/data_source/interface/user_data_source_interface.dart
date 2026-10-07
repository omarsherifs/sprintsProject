import 'package:sprintsapp/models/user_model.dart';

abstract class UserDataSourceInterface {
  Future<List<UserModel>> getUserData();
}
