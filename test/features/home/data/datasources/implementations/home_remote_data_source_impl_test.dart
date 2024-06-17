import 'package:bit_stack_test/features/home/data/datasources/implementations/home_remote_data_source_impl.dart';
import 'package:bit_stack_test/features/home/data/models/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bit_stack_test/core/types/exceptions.dart';
import 'package:bit_stack_test/features/home/data/datasources/home_client.dart';
import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';

import 'home_remote_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HomeClient>(),
])
void main() {
  late HomeRemoteDataSourceImpl dataSource;
  late MockHomeClient mockHomeClient;

  setUp(() {
    mockHomeClient = MockHomeClient();
    dataSource = HomeRemoteDataSourceImpl(homeClient: mockHomeClient);
  });

  group('getBalance', () {
    final tBalance = Balance(balance: 1000.0, currency: Currency.usd);

    test('should return Balance when the call to homeClient is successful',
        () async {
      // arrange
      when(mockHomeClient.getBalance()).thenAnswer((_) async => tBalance);

      // act
      final result = await dataSource.getBalance();
      print(result);

      // assert
      expect(result, tBalance);
      verify(mockHomeClient.getBalance());
      verifyNoMoreInteractions(mockHomeClient);
    });

    test(
        'should throw ServerException when the call to homeClient is unsuccessful',
        () async {
      // arrange
      when(mockHomeClient.getBalance()).thenThrow(Exception());

      // act
      final call = dataSource.getBalance;

      // assert
      expect(() => call(), throwsA(isA<ServerException>()));
      verify(mockHomeClient.getBalance());
      verifyNoMoreInteractions(mockHomeClient);
    });
  });

  group('getBitcoinPrice', () {
    final tBitcoinPrice = BitcoinPrice(price: 40000.0, currency: Currency.usd);

    test('should return BitcoinPrice when the call to homeClient is successful',
        () async {
      // arrange
      when(mockHomeClient.getBitcoinPrice())
          .thenAnswer((_) async => tBitcoinPrice);

      // act
      final result = await dataSource.getBitcoinPrice();

      // assert
      expect(result, tBitcoinPrice);
      verify(mockHomeClient.getBitcoinPrice());
      verifyNoMoreInteractions(mockHomeClient);
    });

    test(
        'should throw ServerException when the call to homeClient is unsuccessful',
        () async {
      // arrange
      when(mockHomeClient.getBitcoinPrice()).thenThrow(Exception());

      // act
      final call = dataSource.getBitcoinPrice;

      // assert
      expect(() => call(), throwsA(isA<ServerException>()));
      verify(mockHomeClient.getBitcoinPrice());
      verifyNoMoreInteractions(mockHomeClient);
    });
  });
}
