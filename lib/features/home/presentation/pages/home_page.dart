import 'package:bit_stack_test/core/service_locator.dart';
import 'package:bit_stack_test/features/home/presentation/usecases/get_home_data_usecase.dart';
import 'package:bit_stack_test/features/home/presentation/widgets/card_bitstack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.di});

  final ServiceLocator di;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeDataState? tmpState;

  @override
  void initState() {
    widget.di.resolve<GetHomeDataUsecase>().getHomeData().listen((event) {
      setState(() {
        tmpState = event;
      });
    }, onError: (error) {
      // handle potential errors with dialog or widget somewhere in the view.
      print(error);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 53),
              CardBitstack(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tmpState?.balance.balance ?? 0}₿',
                      // instead of that use Theme data from MaterialApp
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '\$${tmpState?.currentDollarBalance ?? 0}',
                      style: GoogleFonts.inter().copyWith(
                        color: Color(0xff23242E),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              CardBitstack(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9.5),
                borderRadius: BorderRadius.circular(150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFF8934),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: Text(
                          'BITCOIN',
                          style: GoogleFonts.inter().copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                        right: 10,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Text(
                        '\$${tmpState?.bitcoinPrice.price ?? 0}',
                        style: GoogleFonts.inter().copyWith(
                          color: Color(0xff23242E),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
