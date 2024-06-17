import 'package:freezed_annotation/freezed_annotation.dart';

enum Currency {
  @JsonValue('USD')
  usd,
  @JsonValue('BTC')
  btc,
}
