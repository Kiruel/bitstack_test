import 'package:bit_stack_test/core/types/exceptions.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';
import 'package:bit_stack_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.dataSource,
  });

  final HomeRemoteDataSource dataSource;

  @override
  Future<Balance> getBalance() async {
    try {
      final response = await dataSource.getBalance();
      // here we could save localy the result to cache the data
      // with a localSource for example
      return response;
    } catch (e) {
      throw BalanceException();
    }
  }

  @override
  Future<BitcoinPrice> getBitcoinPrice() async {
    try {
      final response = await dataSource.getBitcoinPrice();
      return response;
    } catch (e) {
      throw BitcoinPriceException();
    }
  }
}
