import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_sample/core/base_database.dart';
import 'package:login_sample/core/di/dependency_injector.dart';
import 'package:login_sample/data/login_data_source.dart';
import 'package:login_sample/presentation/login/cubit/login_cubit.dart';
import 'package:login_sample/presentation/login/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            LoginDataSource(
              di<BaseDatabase>(),
            ),
          )
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: const Center(
            child: LoginContent(),
          ),
        ),
      ),
    );
  }
}
