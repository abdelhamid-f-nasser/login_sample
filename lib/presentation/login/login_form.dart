import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_sample/core/base/base_state.dart';
import 'package:login_sample/core/utilities/mixins/validator_mixin.dart';
import 'package:login_sample/presentation/login/cubit/login_cubit.dart';
import 'package:login_sample/presentation/widget/login_form_field.dart';

class LoginForm extends StatefulWidget
    with EmailValidatorMixin, PasswordValidatorMixin {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  'Welcome, log in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            LoginFormField(
              labelText: 'Email Address',
              hintText: 'awd.1234@asd.co',
              helperMaxLines: 2,
              controller: _emailController,
              validator: (value) => widget.validateEmail(value),
            ),
            const SizedBox(height: 32),
            LoginFormField(
              labelText: 'Password',
              helperText:
                  'Password must be at least 8 characters long, contain at least 1 number and 1 special character',
              helperMaxLines: 2,
              controller: _passwordController,
              validator: (value) => widget.validatePassword(value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _validateForm(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: context.watch<LoginCubit>().state.isLoading ?
                        const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ) :
                    BlocListener<LoginCubit, LoginState>(
                      listener: (BuildContext context, state) => _showSnackBar(context, state),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _validateForm(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final LoginCubit cubit = context.read<LoginCubit>();
      cubit.login(email: email, password: password);
    }
  }

  _showSnackBar(BuildContext context, LoginState state) {
    if (state.status == CubitStatus.success) {
      final email = state.loginModel?.email ?? '';
      final password = state.loginModel?.password ?? '';
      final loginCount = state.loginModel?.successfulLoginCount ?? 1;
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Text(
            'Login success with email: $email and password: $password, count: $loginCount',
          ),
        ),
      );
    }
  }
}
