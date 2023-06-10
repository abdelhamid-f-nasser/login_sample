import 'package:login_sample/data/login_model.dart';

abstract interface class BaseLoginDataSource {
  Future<LoginModel> login({
    required String email,
    required String password,
  });
}
