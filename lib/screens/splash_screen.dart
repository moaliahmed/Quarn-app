import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'package:quran_app/screens/nav_bar_screen.dart';
import 'package:quran_app/src/app_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: double.infinity,
            height: 450.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/splash_screen_img.jpg',
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 50.h,
          ),
          CircularProgressIndicator(
            color: AppColors.kBlackColor,
          )
        ],
      ),
    );
  }
}
