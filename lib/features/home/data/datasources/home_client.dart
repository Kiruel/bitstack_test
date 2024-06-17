import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_client.g.dart';

@RestApi()
abstract class HomeClient {
  factory HomeClient(Dio dio, {String baseUrl}) = _HomeClient;

  @GET('/price')
  Future<BitcoinPrice> getBitcoinPrice();

  @GET('/balance')
  Future<Balance> getBalance();
}
