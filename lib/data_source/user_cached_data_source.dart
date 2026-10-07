import 'dart:convert';

import 'package:sprintsapp/core/shared_prefs/shared_prefs_keys.dart';
import 'package:sprintsapp/core/shared_prefs/shared_prefs_service.dart';
import 'package:sprintsapp/data_source/interface/user_data_source_interface.dart';
import 'package:sprintsapp/models/user_model.dart';

class UserCachedDataSource implements UserDataSourceInterface {
  @override
  Future<List<UserModel>> getUserData() async {
    List<UserModel> users = [];
    var userData = await SharedPrefsService.getString(SharedPrefsKeys.userDataKey);
    if (userData != null) {
      var jsonData = jsonDecode(userData);
      jsonData.forEach((element) {
        UserModel user = UserModel.fromJson(element);
        users.add(user);
      });
    }

    return users;
  }
}
