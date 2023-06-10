import 'package:flutter/material.dart';

@immutable
class LoginModel {
  final String email;
  final String password;
  final int successfulLoginCount;

  const LoginModel({
    required this.email,
    required this.password,
    required this.successfulLoginCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'login_count': successfulLoginCount,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
      successfulLoginCount: map['login_count'] as int,
    );
  }
}
