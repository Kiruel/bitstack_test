import 'package:bit_stack_test/core/types/exceptions.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_client.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({
    required this.homeClient,
  });

  final HomeClient homeClient;

  @override
  Future<Balance> getBalance() async {
    try {
      final response = await homeClient.getBalance();
      return response;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<BitcoinPrice> getBitcoinPrice() async {
    try {
      final response = await homeClient.getBitcoinPrice();
      print(response);
      return response;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
