import 'package:login_sample/core/base_database.dart';
import 'package:login_sample/data/base_login_data_source.dart';
import 'package:login_sample/data/login_model.dart';

class LoginDataSource implements BaseLoginDataSource {
  final BaseDatabase databaseClient;

  LoginDataSource(
  this.databaseClient,
  );

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final successfulLoginCount = await _getLoginCount(email);
    final model = LoginModel(
        email: email,
        password: password,
        successfulLoginCount: successfulLoginCount+1);
    await databaseClient.upsert(table: 'login', data: model.toJson());
    return Future.value(model);
  }

  Future<int> _getLoginCount(String email) async {
    final json = await databaseClient.retrieve(table: 'login', id: email);
    if (json != null && json!.isNotEmpty == true) {
      final model = LoginModel.fromJson(json.first);
      return Future.value(model.successfulLoginCount);
    } else {
      return Future.value(0);
    }
  }
}
