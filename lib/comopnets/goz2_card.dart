import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/screens/select_sora_screen.dart';
import 'package:quran_app/screens/sora_screen.dart';
import 'package:quran_app/src/app_color.dart';
import 'package:quran_app/utils/app_navigator.dart';

class Goz2Card extends StatelessWidget {
  String mainText;
  int index;
  String goz2Name;
  bool isSora;
  String? soraName;
  Goz2Card(
      {this.isSora = false,
      this.soraName,
      required this.mainText,
      required this.index,
      required this.goz2Name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSora) {
          AppNavigator.appNavigator(
              context,
              SoraScreen(
                index: index,
                goz2Name: goz2Name,
                soraname: soraName!,
              ),
              isFinished: true);
        } else {
          AppNavigator.appNavigator(
            context,
            SelectSoraScreen(
              index: index - 1,
              goz2Name: goz2Name,
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(right: 16),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 25.sp,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              mainText,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: AppColors.kBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            CircleAvatar(
              backgroundColor: AppColors.kBlackColor,
              child: Text(
                index.toString(),
                style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
