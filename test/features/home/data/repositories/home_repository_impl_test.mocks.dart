// Mocks generated by Mockito 5.4.4 from annotations
// in bit_stack_test/test/features/home/data/repositories/home_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:bit_stack_test/features/home/data/datasources/home_remote_data_source.dart'
    as _i4;
import 'package:bit_stack_test/features/home/data/models/balance.dart' as _i2;
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBalance_0 extends _i1.SmartFake implements _i2.Balance {
  _FakeBalance_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBitcoinPrice_1 extends _i1.SmartFake implements _i3.BitcoinPrice {
  _FakeBitcoinPrice_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSource extends _i1.Mock
    implements _i4.HomeRemoteDataSource {
  @override
  _i5.Future<_i2.Balance> getBalance() => (super.noSuchMethod(
        Invocation.method(
          #getBalance,
          [],
        ),
        returnValue: _i5.Future<_i2.Balance>.value(_FakeBalance_0(
          this,
          Invocation.method(
            #getBalance,
            [],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i2.Balance>.value(_FakeBalance_0(
          this,
          Invocation.method(
            #getBalance,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Balance>);

  @override
  _i5.Future<_i3.BitcoinPrice> getBitcoinPrice() => (super.noSuchMethod(
        Invocation.method(
          #getBitcoinPrice,
          [],
        ),
        returnValue: _i5.Future<_i3.BitcoinPrice>.value(_FakeBitcoinPrice_1(
          this,
          Invocation.method(
            #getBitcoinPrice,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.BitcoinPrice>.value(_FakeBitcoinPrice_1(
          this,
          Invocation.method(
            #getBitcoinPrice,
            [],
          ),
        )),
      ) as _i5.Future<_i3.BitcoinPrice>);
}
