// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/assets.dart';
import 'package:unit_converter_app/constants/color_constant.dart';
import 'package:unit_converter_app/screens/home_screen.dart';

import 'onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? initScreen;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen == true) {
      Timer(const Duration(milliseconds: 1000), ()  {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    } else {
      Timer(const Duration(milliseconds: 1000), (){
        //prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset(Assets.appLogo),
            ),
            SizedBox(
              height: 1.h,
            ),
            const SizedBox(
              child: Text(
                'Unit Converter',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: CustomColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
