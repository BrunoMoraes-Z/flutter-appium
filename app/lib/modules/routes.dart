import 'package:appium_sample/modules/calculator/view/calculator_view.dart';
import 'package:appium_sample/modules/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashView(),
  '/calc': (context) => const CalculatorView(),
};
