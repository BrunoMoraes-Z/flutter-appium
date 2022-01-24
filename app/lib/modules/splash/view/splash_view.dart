import 'package:appium_sample/shared/utils/size_config.dart';
import 'package:appium_sample/shared/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: 250,
            width: 250,
            child: SvgPicture.asset('assets/splash.svg'),
          ),
          const SizedBox(height: 100),
          const Text(
            'Appium Sample',
            key: Key('app_title'),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            width: double.maxFinite,
            height: 48,
            child: DefaultButton(
              key: const Key('btn_seguir'),
              label: 'Seguir',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/calc');
              },
              enabled: true,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
