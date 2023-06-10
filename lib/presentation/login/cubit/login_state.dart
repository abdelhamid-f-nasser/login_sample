part of 'login_cubit.dart';

@immutable
class LoginState extends BaseState {
  final LoginModel? loginModel;

  const LoginState({
    this.loginModel,
    CubitStatus status = CubitStatus.initial,
    String? failureMessage,
  }) : super(
    status: status,
    failureMessage: failureMessage,
  );

  @override
  List<Object?> get props => [
    ...super.props,
    loginModel,
  ];

  LoginState copyWith({
    LoginModel? loginModel,
    CubitStatus? status,
    String? failureMessage,
  }) {
    return LoginState(
      loginModel: loginModel ?? this.loginModel,
      status: status ?? this.status,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}
