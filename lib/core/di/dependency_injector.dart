
import 'package:get_it/get_it.dart';
import 'package:login_sample/core/base_database.dart';
import 'package:login_sample/core/sqlflite_database_client.dart';
import 'package:login_sample/data/base_login_data_source.dart';
import 'package:login_sample/data/login_data_source.dart';
import 'package:login_sample/presentation/login/cubit/login_cubit.dart';

final di = GetIt.instance;

class DependencyInjector {

  static Future<void> injectModules() async {
    final sqlFliteDatabase = await SqlfliteDatabaseClient.create();


    // region cubits
    di.registerFactory<LoginCubit>(
          () => LoginCubit(di()),
    );
    // endregion

    // region datasources
    di.registerLazySingleton<BaseLoginDataSource>(
          () => LoginDataSource(di()),
    );
    // endregion



    di.registerSingleton<BaseDatabase>(
          sqlFliteDatabase,
    );
  }
}
