import 'package:bit_stack_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bit_stack_test/core/types/exceptions.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_remote_data_source.dart';
import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';
import 'package:bit_stack_test/features/home/data/models/currency.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HomeRemoteDataSource>(),
])
void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(dataSource: mockRemoteDataSource);
  });

  group('getBalance', () {
    final tBalance = Balance(balance: 1000.0, currency: Currency.usd);

    test('should return Balance when the call to dataSource is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getBalance()).thenAnswer((_) async => tBalance);

      // act
      final result = await repository.getBalance();

      // assert
      expect(result, tBalance);
      verify(mockRemoteDataSource.getBalance());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
        'should throw BalanceException when the call to dataSource is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getBalance()).thenThrow(Exception());

      // act
      final call = repository.getBalance;

      // assert
      expect(() => call(), throwsA(isA<BalanceException>()));
      verify(mockRemoteDataSource.getBalance());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('getBitcoinPrice', () {
    final tBitcoinPrice = BitcoinPrice(price: 40000.0, currency: Currency.usd);

    test('should return BitcoinPrice when the call to dataSource is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getBitcoinPrice())
          .thenAnswer((_) async => tBitcoinPrice);

      // act
      final result = await repository.getBitcoinPrice();

      // assert
      expect(result, tBitcoinPrice);
      verify(mockRemoteDataSource.getBitcoinPrice());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test(
        'should throw BitcoinPriceException when the call to dataSource is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getBitcoinPrice()).thenThrow(Exception());

      // act
      final call = repository.getBitcoinPrice;

      // assert
      expect(() => call(), throwsA(isA<BitcoinPriceException>()));
      verify(mockRemoteDataSource.getBitcoinPrice());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
