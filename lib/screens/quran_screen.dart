import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/comopnets/goz2_card.dart';
import 'package:quran_app/models/quraan.dart';
import 'package:quran_app/src/app_color.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Goz2Card(
              index: index + 1,
              mainText: quranParts[index],
              goz2Name: quranParts[index],
            );
          },
          itemCount: quranParts.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
              color: AppColors.kGreyColor,
            );
          },
        ),
      )),
    );
  }
}
