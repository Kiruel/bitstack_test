import 'package:bit_stack_test/core/core_binding.dart';
import 'package:bit_stack_test/core/service_locator.dart';
import 'package:bit_stack_test/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final ServiceLocator di = initDependencyInjection();
  runApp(MaterialApp(home: HomePage(di: di)));
}
