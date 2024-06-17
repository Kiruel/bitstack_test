// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitcoinPriceImpl _$$BitcoinPriceImplFromJson(Map<String, dynamic> json) =>
    _$BitcoinPriceImpl(
      price: (json['price'] as num).toDouble(),
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
    );

Map<String, dynamic> _$$BitcoinPriceImplToJson(_$BitcoinPriceImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'currency': _$CurrencyEnumMap[instance.currency]!,
    };

const _$CurrencyEnumMap = {
  Currency.usd: 'USD',
  Currency.btc: 'BTC',
};
