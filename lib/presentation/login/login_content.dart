import 'package:flutter/material.dart';
import 'package:login_sample/presentation/login/login_form.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icon-logo.png',
            width: 200,
          ),
          const LoginForm(),
        ],
      ),
    );
  }
}
