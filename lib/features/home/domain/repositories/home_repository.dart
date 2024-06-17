import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';

abstract class HomeRepository {
  Future<Balance> getBalance();
  Future<BitcoinPrice> getBitcoinPrice();
}
