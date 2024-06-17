import 'package:bit_stack_test/core/service_locator.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_client.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bit_stack_test/features/home/data/datasources/implementations/home_remote_data_source_impl.dart';
import 'package:bit_stack_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:bit_stack_test/features/home/domain/repositories/home_repository.dart';
import 'package:bit_stack_test/features/home/presentation/usecases/get_home_data_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Consider using a better solution to handle dependency injection like
// riverpod.
ServiceLocator initDependencyInjection() {
  final di = ServiceLocator();

  di.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: '${dotenv.env['SERVER_URL']!}/',
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 40000),
        contentType: Headers.jsonContentType,
        headers: {'API_KEY': dotenv.env['API_KEY']!},
      ),
    ),
  );
  di.registerSingleton<HomeClient>(HomeClient(di.resolve<Dio>()));
  di.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourceImpl(homeClient: di.resolve<HomeClient>()));
  di.registerSingleton<HomeRepository>(
      HomeRepositoryImpl(dataSource: di.resolve<HomeRemoteDataSource>()));
  di.registerSingleton<GetHomeDataUsecase>(
    GetHomeDataUsecase(homeRepository: di.resolve<HomeRepository>()),
  );
  return di;
}
