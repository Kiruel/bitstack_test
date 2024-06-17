import 'package:bit_stack_test/features/home/data/models/balance.dart';
import 'package:bit_stack_test/features/home/data/models/bitcoin_price.dart';
import 'package:bit_stack_test/features/home/domain/repositories/home_repository.dart';

class HomeDataState {
  HomeDataState({
    required this.balance,
    required this.bitcoinPrice,
    required this.currentDollarBalance,
  });

  final Balance balance;
  final BitcoinPrice bitcoinPrice;
  final String currentDollarBalance;
}

class GetHomeDataUsecase {
  GetHomeDataUsecase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;
  final HomeRepository _homeRepository;

  double _calcCurrentDollarBalance(
    double currentBitcoinPrice,
    double currentBitcoinBalance,
  ) {
    return currentBitcoinPrice * currentBitcoinBalance;
  }

  Future<HomeDataState> _getDataState() async {
    final multipleFuture = <Future>[];
    multipleFuture.add(_homeRepository.getBalance());
    multipleFuture.add(_homeRepository.getBitcoinPrice());

    // here we perform both calls in parallels to be faster.
    final responses = await Future.wait(multipleFuture);
    final balance = responses[0] as Balance;
    final bitcoinPrice = responses[1] as BitcoinPrice;

    return HomeDataState(
      balance: balance,
      bitcoinPrice: bitcoinPrice,
      currentDollarBalance: _calcCurrentDollarBalance(
        bitcoinPrice.price,
        balance.balance,
      ).toStringAsFixed(2),
    );
  }

  Stream<HomeDataState> getHomeData() async* {
    // A better approach here is to make a websocket on the server side
    // to have a true real time data, and not spam the server
    final initData = await _getDataState();
    yield initData;
    yield* Stream.periodic(
      Duration(seconds: 10),
      (_) => _getDataState(),
    ).asyncMap(
      (event) async => await event,
    );
  }
}
