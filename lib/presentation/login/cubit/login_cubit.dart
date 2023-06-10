import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_sample/core/base/base_state.dart';
import 'package:login_sample/data/base_login_data_source.dart';
import 'package:login_sample/data/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BaseLoginDataSource baseLoginDataSource;

  LoginCubit(this.baseLoginDataSource) : super(const LoginState());

  void login({required String email, required String password}) {
    emit(state.copyWith(status: CubitStatus.loading));

    baseLoginDataSource.login(email: email, password: password).then((value) {
      emit(state.copyWith(status: CubitStatus.success, loginModel: value));
    }).catchError((e) {
      emit(state.copyWith(status: CubitStatus.failure, failureMessage: e.toString()));
    });

  }
}
