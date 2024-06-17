import 'package:bit_stack_test/features/home/data/models/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bitcoin_price.freezed.dart';
part 'bitcoin_price.g.dart';

@freezed
class BitcoinPrice with _$BitcoinPrice {
  const factory BitcoinPrice({
    required double price,
    required Currency currency,
  }) = _BitcoinPrice;

  factory BitcoinPrice.fromJson(Map<String, dynamic> json) =>
      _$BitcoinPriceFromJson(json);
}
