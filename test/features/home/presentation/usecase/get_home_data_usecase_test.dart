import 'package:bit_stack_test/features/home/presentation/usecases/get_home_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';
import 'package:bit_stack_test/features/home/domain/repositories/home_repository.dart';
import 'package:bit_stack_test/features/home/data/models/currency.dart';

import 'get_home_data_usecase_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HomeRepository>(),
])
void main() {
  late GetHomeDataUsecase usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetHomeDataUsecase(homeRepository: mockHomeRepository);
  });

  group('GetHomeDataUsecase', () {
    final tBalance = Balance(balance: 0.1, currency: Currency.btc);
    final tBitcoinPrice = BitcoinPrice(price: 40000.0, currency: Currency.usd);
    final tCurrentDollarBalance = (0.1 * 40000.0).toStringAsFixed(2);

    test('should return HomeDataState when getHomeData is called', () async {
      // arrange
      when(mockHomeRepository.getBalance()).thenAnswer((_) async => tBalance);
      when(mockHomeRepository.getBitcoinPrice())
          .thenAnswer((_) async => tBitcoinPrice);

      // act
      final stream = usecase.getHomeData();

      // assert
      expectLater(
        stream,
        emitsInOrder([
          isA<HomeDataState>()
              .having((state) => state.balance, 'balance', tBalance)
              .having(
                  (state) => state.bitcoinPrice, 'bitcoinPrice', tBitcoinPrice)
              .having((state) => state.currentDollarBalance,
                  'currentDollarBalance', tCurrentDollarBalance),
        ]),
      );
    });

    test('should call getBalance and getBitcoinPrice on the repository',
        () async {
      // arrange
      when(mockHomeRepository.getBalance()).thenAnswer((_) async => tBalance);
      when(mockHomeRepository.getBitcoinPrice())
          .thenAnswer((_) async => tBitcoinPrice);

      // act
      await usecase.getHomeData().first;

      // assert
      verify(mockHomeRepository.getBalance());
      verify(mockHomeRepository.getBitcoinPrice());
    });

    test('should emit periodic HomeDataState updates', () async {
      // arrange
      when(mockHomeRepository.getBalance()).thenAnswer((_) async => tBalance);
      when(mockHomeRepository.getBitcoinPrice())
          .thenAnswer((_) async => tBitcoinPrice);

      // act
      final stream = usecase.getHomeData();

      // assert
      final expectedResponses = [
        isA<HomeDataState>()
            .having((state) => state.balance, 'balance', tBalance)
            .having(
                (state) => state.bitcoinPrice, 'bitcoinPrice', tBitcoinPrice)
            .having((state) => state.currentDollarBalance,
                'currentDollarBalance', tCurrentDollarBalance),
        isA<HomeDataState>()
            .having((state) => state.balance, 'balance', tBalance)
            .having(
                (state) => state.bitcoinPrice, 'bitcoinPrice', tBitcoinPrice)
            .having((state) => state.currentDollarBalance,
                'currentDollarBalance', tCurrentDollarBalance),
      ];

      await expectLater(
        stream,
        emitsInOrder(expectedResponses),
      );

      // verify the periodic calls
      verify(mockHomeRepository.getBalance()).called(greaterThanOrEqualTo(2));
      verify(mockHomeRepository.getBitcoinPrice())
          .called(greaterThanOrEqualTo(2));
    });
  });
}
