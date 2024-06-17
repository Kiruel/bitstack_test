// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bitcoin_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BitcoinPrice _$BitcoinPriceFromJson(Map<String, dynamic> json) {
  return _BitcoinPrice.fromJson(json);
}

/// @nodoc
mixin _$BitcoinPrice {
  double get price => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BitcoinPriceCopyWith<BitcoinPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitcoinPriceCopyWith<$Res> {
  factory $BitcoinPriceCopyWith(
          BitcoinPrice value, $Res Function(BitcoinPrice) then) =
      _$BitcoinPriceCopyWithImpl<$Res, BitcoinPrice>;
  @useResult
  $Res call({double price, Currency currency});
}

/// @nodoc
class _$BitcoinPriceCopyWithImpl<$Res, $Val extends BitcoinPrice>
    implements $BitcoinPriceCopyWith<$Res> {
  _$BitcoinPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BitcoinPriceImplCopyWith<$Res>
    implements $BitcoinPriceCopyWith<$Res> {
  factory _$$BitcoinPriceImplCopyWith(
          _$BitcoinPriceImpl value, $Res Function(_$BitcoinPriceImpl) then) =
      __$$BitcoinPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, Currency currency});
}

/// @nodoc
class __$$BitcoinPriceImplCopyWithImpl<$Res>
    extends _$BitcoinPriceCopyWithImpl<$Res, _$BitcoinPriceImpl>
    implements _$$BitcoinPriceImplCopyWith<$Res> {
  __$$BitcoinPriceImplCopyWithImpl(
      _$BitcoinPriceImpl _value, $Res Function(_$BitcoinPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$BitcoinPriceImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BitcoinPriceImpl implements _BitcoinPrice {
  const _$BitcoinPriceImpl({required this.price, required this.currency});

  factory _$BitcoinPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BitcoinPriceImplFromJson(json);

  @override
  final double price;
  @override
  final Currency currency;

  @override
  String toString() {
    return 'BitcoinPrice(price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BitcoinPriceImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BitcoinPriceImplCopyWith<_$BitcoinPriceImpl> get copyWith =>
      __$$BitcoinPriceImplCopyWithImpl<_$BitcoinPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BitcoinPriceImplToJson(
      this,
    );
  }
}

abstract class _BitcoinPrice implements BitcoinPrice {
  const factory _BitcoinPrice(
      {required final double price,
      required final Currency currency}) = _$BitcoinPriceImpl;

  factory _BitcoinPrice.fromJson(Map<String, dynamic> json) =
      _$BitcoinPriceImpl.fromJson;

  @override
  double get price;
  @override
  Currency get currency;
  @override
  @JsonKey(ignore: true)
  _$$BitcoinPriceImplCopyWith<_$BitcoinPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
