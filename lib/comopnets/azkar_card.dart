import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/screens/web_view_screen.dart';
import 'package:quran_app/src/app_color.dart';
import 'package:quran_app/utils/app_navigator.dart';

class AzkarCard extends StatelessWidget {
  String azkarType;
  int index;
  AzkarCard({required this.index, required this.azkarType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.appNavigator(
          context,
          WebViewScreen(
            azkarType: azkarType,
            index: index,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              size: 24.sp,
              color: AppColors.kBlackColor,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              azkarType,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.kBlackColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
